defmodule ItaclimbWeb.UserLive.Registration do
  use ItaclimbWeb, :live_view

  alias Itaclimb.Accounts
  alias Itaclimb.Accounts.User

  @impl true
  def render(assigns) do
    ~H"""
    <Layouts.itaclimb flash={@flash} current_scope={@current_scope}>
      <div class="mx-auto max-w-sm">
        <div class="text-center">
          <.header>
            Register for an account
            <:subtitle>
              Already registered?
              <.link navigate={~p"/users/log-in"} class="font-semibold text-brand hover:underline">
                Log in
              </.link>
              to your account now.
            </:subtitle>
          </.header>
        </div>

        <.form for={@form} id="registration_form" phx-submit="save" phx-change="validate" multipart>
          <.input field={@form[:username]} type="text" label="Nome de Usuário" required />
          <.input field={@form[:email]} type="email" label="E-mail" required />
          <.input field={@form[:location]} type="text" label="Onde você mora?" />
          <.input field={@form[:password]} type="password" label="Senha" required />

          <div class="mt-4">
            <label>Foto de Perfil</label>
            <.live_file_input upload={@uploads.avatar} />
          </div>

          <.button phx-disable-with="Criando conta..." class="w-full">Criar conta</.button>

        </.form>
      </div>
    </Layouts.itaclimb>
    """
  end

  @impl true
  def mount(_params, _session, %{assigns: %{current_scope: %{user: user}}} = socket)
      when not is_nil(user) do
    {:ok, redirect(socket, to: ItaclimbWeb.UserAuth.signed_in_path(socket))}
  end

  # def mount(_params, _session, socket) do
  #   changeset = Accounts.change_user_email(%User{}, %{}, validate_unique: false)

  #   {:ok, assign_form(socket, changeset), temporary_assigns: [form: nil]}
  # end

  def mount(_params, _session, socket) do
    {
      :ok,
      socket
      |> assign(trigger_submit: false, check_errors: false)
      |> allow_upload(:avatar, accept: ~w(.jpg .jpeg .png), max_entries: 1) # Permitir foto
      |> assign_form(Accounts.User.registration_changeset(%Accounts.User{}, %{}))
    }
  end

  # @impl true
  # def handle_event("save", %{"user" => user_params}, socket) do
  #   case Accounts.register_user(user_params) do
  #     {:ok, user} ->
  #       {:ok, _} =
  #         Accounts.deliver_login_instructions(
  #           user,
  #           &url(~p"/users/log-in/#{&1}")
  #         )

  #       {:noreply,
  #        socket
  #        |> put_flash(
  #          :info,
  #          "An email was sent to #{user.email}, please access it to confirm your account."
  #        )
  #        |> push_navigate(to: ~p"/users/log-in")}

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       {:noreply, assign_form(socket, changeset)}
  #   end
  # end

  @impl true
  def handle_event("save", %{"user" => user_params}, socket) do
    upload_result = consume_uploaded_entries(socket, :avatar, fn %{path: path}, entry ->
      file_binary = File.read!(path)
      {:ok, Itaclimb.ImageKit.upload(file_binary, entry.client_name)}
    end) |> List.first()

    user_params =
      case upload_result do
        {:ok, %{url: url, file_id: file_id}} ->
          user_params
          |> Map.put("profile_picture_url", url)
          |> Map.put("imagekit_file_id", file_id)

        _ ->
          user_params
      end

    case Accounts.register_user(user_params) do
      {:ok, _user} ->
        {:noreply,
         socket
         |> put_flash(:info, "Account created successfully! Please log in.")
         |> push_navigate(to: ~p"/users/log-in")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign_form(socket, changeset)}
    end
  end

  def handle_event("validate", %{"user" => user_params}, socket) do
    changeset = User.registration_changeset(%User{}, user_params, hash_password: false, validate_unique: false)
    {:noreply, assign_form(socket, Map.put(changeset, :action, :validate))}
  end

  defp assign_form(socket, %Ecto.Changeset{} = changeset) do
    form = to_form(changeset, as: "user")
    assign(socket, form: form)
  end
end

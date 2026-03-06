# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Itaclimb.Repo.insert!(%Itaclimb.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Itaclimb.Blog

posts = [
  %{
    title: "Pedra da Gávea: O Clássico do Rio",
    slug: "pedra-da-gavea-o-classico-do-rio",
    published_at: ~U[2026-02-01 10:00:00Z],
    views: 0,
    body: """
    A Pedra da Gávea é um dos ícones da escalada carioca e um destino obrigatório para qualquer alpinista que visita o Rio de Janeiro. Com suas paredes de granito imponentes e vistas panorâmicas da cidade e do mar, a Gávea oferece rotas para todos os níveis de experiência.

    Entre as vias mais procuradas está a clássica "Canaleta", uma rota de múltiplos comprimentos que percorre a face sul do maciço. A escalada combina trechos de fissura com placas expostas, exigindo técnica variada e boa leitura de terreno.

    A logística é simples: o acesso pode ser feito pela Estrada da Gávea, com trilha de aproximação de cerca de 1h30. É fundamental levar água suficiente, protetor solar e equipamento de rapel para a descida. A escalada é mais agradável no início da manhã, quando o sol ainda não aquece demais as pedras.

    Para quem está começando, há opções de vias de um comprimento na base do maciço, ideais para familiarizar com o granito carioca. Para os mais experientes, a travessia completa até o cume é uma experiência inesquecível.
    """
  },
  %{
    title: "Setor Coca-Cola: Melhor Pedra para Iniciantes em Itatiaia",
    slug: "setor-coca-cola-melhor-pedra-para-iniciantes-em-itatiaia",
    published_at: ~U[2026-02-08 09:00:00Z],
    views: 0,
    body: """
    O Parque Nacional do Itatiaia é o lar de alguns dos melhores setores de escalada esportiva do Brasil, e o Setor Coca-Cola se destaca como o ponto de entrada perfeito para quem está começando na escalada em rocha.

    Localizado a poucos minutos de caminhada da estrada principal, o setor oferece mais de 30 vias bem equipadas, com graduações que vão do 5a ao 7b. As rotas são curtas, geralmente entre 15 e 25 metros, em um calcário de excelente qualidade com grandes agarras e passagens técnicas.

    O ambiente é acolhedor: nos finais de semana é comum encontrar grupos de escaladores de diferentes níveis compartilhando o setor, o que cria uma atmosfera de comunidade e aprendizado. Instrutores e guias locais frequentemente levam turmas de iniciantes ao local.

    A melhor época para escalar em Itatiaia é entre abril e setembro, quando as chuvas são menos frequentes e as temperaturas mais amenas tornam o esforço físico mais confortável. Nos meses de verão, chegue cedo para aproveitar a sombra da manhã.
    """
  },
  %{
    title: "Técnica de Rapel: Dicas para Descer com Segurança",
    slug: "tecnica-de-rapel-dicas-para-descer-com-seguranca",
    published_at: ~U[2026-02-15 11:00:00Z],
    views: 0,
    body: """
    O rapel é uma habilidade fundamental para qualquer escalador que frequenta vias de múltiplos comprimentos. Dominar a técnica corretamente não apenas garante sua segurança, mas também torna a descida mais eficiente e confortável.

    O primeiro passo é montar o sistema de freio corretamente. O oito é o dispositivo mais comum entre iniciantes pela sua simplicidade e facilidade de visualização. Já escaladores mais experientes tendem a usar o reverso ou o ATC guia, que oferecem mais controle em situações de carga pesada.

    Antes de iniciar a descida, sempre faça a checagem dupla: verifique o nó de bloqueio da corda, confirme que o mosquetão de segurança está travado e teste a tensão do sistema puxando a corda suavemente. Nunca inicie um rapel sem a confirmação de um parceiro.

    Durante a descida, mantenha o corpo em posição de L, com os pés paralelos à parede e os joelhos levemente dobrados. A mão do freio deve estar posicionada na lateral do quadril, nunca à frente. Controle a velocidade com movimentos suaves — descer rápido demais aquece o equipamento e aumenta o desgaste da corda.

    Em situações de rocha irregular ou trechos que exigem desvio de obstáculos, a técnica de rapel em pêndulo pode ser necessária. Pratique sempre em ambientes controlados antes de aplicá-la em campo.
    """
  },
  %{
    title: "Campeonato Carioca de Escalada 2026: Resultados e Destaques",
    slug: "campeonato-carioca-de-escalada-2026-resultados-e-destaques",
    published_at: ~U[2026-02-22 14:00:00Z],
    views: 0,
    body: """
    O Campeonato Carioca de Escalada 2026 reuniu mais de 150 atletas no último fim de semana no Centro Esportivo da Lagoa, consolidando-se como um dos eventos mais importantes do calendário esportivo da cidade.

    Na categoria masculina adulto, o destaque foi Lucas Ferreira, do Clube Alpino Carioca, que encadeou a via principal na final com uma facilidade impressionante, garantindo o título com sobra. Em segundo lugar ficou Rafael Monteiro, estreante na competição mas já demonstrando o talento que promete muito para os próximos anos.

    Entre as mulheres, Ana Paula Souza confirmou o favoritismo e conquistou seu terceiro título consecutivo no campeonato estadual. Sua escalada na via final foi considerada pelos juízes como uma das mais técnicas já vistas no evento. Em segundo lugar ficou Mariana Castro, que surpreendeu o público com uma performance consistente e precisa.

    A categoria juvenil revelou novos talentos: Pedro Almeida, de apenas 16 anos, venceu na categoria masculina com uma escalada segura e madura, enquanto Beatriz Lima dominou o feminino com vantagem expressiva.

    A próxima etapa do circuito está marcada para abril, em Teresópolis, e promete reunir ainda mais atletas de todo o estado.
    """
  },
  %{
    title: "Guia de Equipamentos para Iniciantes na Escalada",
    slug: "guia-de-equipamentos-para-iniciantes-na-escalada",
    published_at: ~U[2026-03-01 08:00:00Z],
    views: 0,
    body: """
    Começar na escalada pode parecer intimidador quando se olha para a quantidade de equipamentos disponíveis no mercado. Este guia foi pensado para ajudar iniciantes a entender o que é essencial, o que pode esperar e onde investir primeiro.

    O item mais importante é o arnês. Escolha um arnês específico para escalada esportiva, com alças de perna acolchoadas e fácil ajuste. Marcas como Petzl, Black Diamond e Mammut oferecem opções de excelente custo-benefício na faixa de entrada. Não economize aqui — o arnês é diretamente ligado à sua segurança.

    Os sapatilhos de escalada são o segundo investimento prioritário. Para iniciantes, sapatilhos com sola plana e baixa curvatura são mais confortáveis para longas jornadas de aprendizado. Evite comprar sapatilhos muito pequenos no início: o desconforto prejudica a concentração e o aprendizado.

    Para escalada esportiva em falésias, você vai precisar de um dispositivo de asseguração (ATC ou GriGri), mosquetões de segurança (pelo menos dois), uma mochila de escalada e, para progredir nas vias, um conjunto de quickdraws.

    A corda é o equipamento mais caro e que pode ser compartilhado inicialmente. Quando for a hora de comprar sua própria, opte por uma corda simples de 9,8mm a 10,2mm com no mínimo 60 metros de comprimento. O capacete, muitas vezes negligenciado por iniciantes, é obrigatório em vias de múltiplos comprimentos e altamente recomendado em qualquer situação.
    """
  }
]

for post_attrs <- posts do
  case Blog.create_post(post_attrs) do
    {:ok, post} -> IO.puts("Created post: #{post.title}")
    {:error, changeset} -> IO.puts("Failed to create post '#{post_attrs.title}': #{inspect(changeset.errors)}")
  end
end

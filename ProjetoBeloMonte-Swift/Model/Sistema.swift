//
//  Sistema.swift
//  ProjetoBeloMonte-Swift
//
//  Created by Theo Furtado on 07/11/23.
//

import Foundation


class Sistema {
    static var shared = Sistema()
    var usuarios = [Usuario]()

        
    var reunioes: [Reuniao] = [
        Reuniao(nomeEvento: "Reuniao - 1", participantes: "theofurtado05@gmail.com", dataInicio: Date(), dataFinal: Date(), localizacao: "Rio de Janeiro", status: "Ocupado", notificacao: "Ativo", descricao: "Reuniao da ap2")
    ]
    
    var destaques: [Destaque] = [
        Destaque(titulo: "Princípios", img: "destaque1", topicos: [
            Topico(titulo: "Missão", texto: "Gerar energia e desenvolvimento sustentável para o crescimento do Brasil."),
            Topico(titulo: "Visão", texto: "Ser uma empresa respeitada e admirada no setor elétrico mundial, que fomenta o desenvolvimento econômico e social e é comprometida com projetos que elevam a qualidade de vida da população da região onde atua."),
            Topico(titulo: "Valores", texto: "Comportamento ético; Respeito às pessoas e ao meio ambiente, assim como ao patrimônio da empresa; Foco nos resultados; Coragem e perseverança;")
        ]),
        
        Destaque(titulo: "Composição Acionária", img: "destaque2", topicos: [
            Topico(titulo: "", texto: "A Norte Energia é composta por Empresas de diferentes segmentos de atuação e por fundos de previdência complementar."),
            Topico(titulo: "Conselho de Administração", texto: "Pedro Luiz de Oliveira Jatobá - Presidente Titular | Jonatan Ross - Suplente"),
            Topico(titulo: "", texto: "Rodrigo Limp Nascimento - Titular | Waldenir Alexandre da Silva Cruz - Suplente"),
            Topico(titulo: "", texto: "Ruy Flaks Schneider - Titular | Patrícia de Carvalho Moreira - Suplente"),
            Topico(titulo: "", texto: "Fábio Lopes Alves  - Titular | Reive Barros dos Santos - Suplente"),
            Topico(titulo: "", texto: "Ana Silvia Corso Matte - Titular | Antonio Augusto Bechara Pardauil - Suplente"),
            Topico(titulo: "", texto: "Susana Hanna Stiphan Jabra - Titular | Carlos Alberto Nolasco - Suplente"),
            Topico(titulo: "", texto: "Nélio Henriques Lima - Titular | Sergio Tadeu Nabas - Suplente"),
            Topico(titulo: "", texto: "Solange Maria Pinto Ribeiro - Titular | Marcelo José Cavalcanti Lopes - Suplente"),
            Topico(titulo: "", texto: "Ludmila Lopes Nascimento Brasil - Titular | Douglas Braga Ferraz de Oliveira Xavier - Suplente"),
            Topico(titulo: "", texto: "Luiz Eduardo Barata Ferreira - Titular | Rodrigo Domingues Vilela - Suplente"),
            Topico(titulo: "", texto: "Marina Freitas Gonçalves de Araújo Grossi - Independente | Leonardo de Paiva Rocha - Independente")
        ]),
        
        Destaque(titulo: "Governança Corporativa", img: "destaque3", topicos: [
            Topico(titulo: "", texto: "A estrutura de governança da Norte Energia é formada pelo Conselho de Administração, Diretoria e Conselho Fiscal. O Conselho de Administração é assessorado por seis Comitês, compostos por representantes dos acionistas e Conselheiros de Administração.")
        ]),
        
        Destaque(titulo: "Saiu na Imprensa", img: "destaque4", topicos: [
            Topico(titulo: "Jovens empreendedores criam negócios sustentáveis no Médio Xingu", texto: "Norte Energia lançou novo programa para fomentar o empreendedorismo na região de influência da UHE Belo Monte. Moradores de Altamira estão dando um passo importante para o futuro profissional com a participação na oficina Despertar, que integra as ações do Belo Monte Empreende, novo programa desenvolvido pela Norte Energia, empresa privada e concessionária da Usina Hidrelétrica Belo Monte, para despertar e qualificar uma nova geração de jovens empreendedores aptos para desenvolver negócios sustentáveis na região do Médio Xingu."),
            Topico(titulo: "", texto: "A oficina Despertar já foi realizada em dois dos cinco bairros construídos pela Norte Energia em Altamira; os outros três recebem a programação nas próximas semanas. Concluída esta etapa, as oficinas serão realizadas nos demais bairros da cidade, sempre com o apoio técnico e realização do Centro de Empreendedorismo da Amazônia (CEA)."),
            Topico(titulo: "", texto: "Na fase do Despertar, os participantes trocam ideias, discutem projetos e apresentam soluções para questões voltadas à Amazônia e à comunidade onde vivem. Depois, recebem orientações de como desenvolver uma ideia de negócio, abrir uma empresa e captar financiamento. As propostas criadas em grupo no Despertar serão refinadas ao longo das próximas etapas do programa, podendo vir a se tornar um novo negócio.")
        ])
    ]
    
    
    var activeReuniao: Reuniao = Reuniao()
    
    var activeDestaque: Destaque = Destaque()
//    var activeDestaque: Destaque = Destaque(titulo: "Princípios", img: "destaque2", topicos: [
//        Topico(titulo: "Missão", texto: "Gerar energia e desenvolvimento sustentável para o crescimento do Brasil."),
//        Topico(titulo: "Visão", texto: "Ser uma empresa respeitada e admirada no setor elétrico mundial, que fomenta o desenvolvimento econômico e social e é comprometida com projetos que elevam a qualidade de vida da população da região onde atua."),
//        Topico(titulo: "Valores", texto: "Comportamento ético; Respeito às pessoas e ao meio ambiente, assim como ao patrimônio da empresa; Foco nos resultados; Coragem e perseverança;")
//    ])
    
}

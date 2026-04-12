import 'dart:async';
// ignore: avoid_web_libraries_in_flutter, deprecated_member_use
import 'dart:html' as html;
import 'dart:math' as math;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

enum AppLang { pt, es, en }

extension AppLangX on AppLang {
  String get code => switch (this) {
        AppLang.pt => 'pt',
        AppLang.es => 'es',
        AppLang.en => 'en',
      };

  static AppLang fromCode(String? code) {
    final normalized = (code ?? '').toLowerCase();
    if (normalized.startsWith('es')) return AppLang.es;
    if (normalized.startsWith('en')) return AppLang.en;
    return AppLang.pt;
  }
}

class ServiceCardData {
  const ServiceCardData({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  final String id;
  final String title;
  final String subtitle;
  final IconData icon;
}

class BlogPostData {
  const BlogPostData({
    required this.serviceTitle,
    required this.headline,
    required this.highlights,
    required this.body,
  });

  final String serviceTitle;
  final String headline;
  final List<String> highlights;
  final List<String> body;
}

class AppCopy {
  const AppCopy(this.lang);

  final AppLang lang;

  String get appTitle => switch (lang) {
        AppLang.pt => 'DeployLabz | Solucoes Digitais',
        AppLang.es => 'DeployLabz | Soluciones Digitales',
        AppLang.en => 'DeployLabz | Digital Solutions',
      };

  String get menuHome => switch (lang) {
        AppLang.pt => 'Inicio',
        AppLang.es => 'Inicio',
        AppLang.en => 'Home',
      };

  String get menuServices => switch (lang) {
        AppLang.pt => 'Servicos',
        AppLang.es => 'Servicios',
        AppLang.en => 'Services',
      };

  String get menuTech => switch (lang) {
        AppLang.pt => 'Tecnologias',
        AppLang.es => 'Tecnologias',
        AppLang.en => 'Technologies',
      };

  String get menuBlog => 'Blog';

  String get menuContact => switch (lang) {
        AppLang.pt => 'Contato',
        AppLang.es => 'Contacto',
        AppLang.en => 'Contact',
      };

  String get heroTitle => switch (lang) {
        AppLang.pt => 'Leve seu projeto digital para producao com a DeployLabz.',
        AppLang.es => 'Lleva tu proyecto digital a produccion con DeployLabz.',
        AppLang.en => 'Take your digital project to production with DeployLabz.',
      };

  String get heroSubtitle => switch (lang) {
        AppLang.pt => 'Sites, apps e automacoes com foco em resultado. Fale agora e receba um retorno rapido.',
        AppLang.es => 'Sitios, apps y automatizaciones con foco en resultados. Habla ahora y recibe una respuesta rapida.',
        AppLang.en => 'Websites, apps and automations focused on results. Talk to us now and get a fast response.',
      };

  String get whatsappCta => switch (lang) {
        AppLang.pt => 'Falar no WhatsApp',
        AppLang.es => 'Hablar por WhatsApp',
        AppLang.en => 'Talk on WhatsApp',
      };

  String get emailLabel => 'Email';

  String get servicesTitle => switch (lang) {
        AppLang.pt => 'Servicos',
        AppLang.es => 'Servicios',
        AppLang.en => 'Services',
      };

  String get servicesSubtitle => switch (lang) {
        AppLang.pt => 'Solucoes digitais para acelerar negocio com identidade moderna.',
        AppLang.es => 'Soluciones digitales para acelerar negocios con identidad moderna.',
        AppLang.en => 'Digital solutions to accelerate business with a modern identity.',
      };

  String get technologiesTitle => switch (lang) {
        AppLang.pt => 'Tecnologias',
        AppLang.es => 'Tecnologias',
        AppLang.en => 'Technologies',
      };

  String get blogTitle => 'Blog';

  String get blogListSubtitle => switch (lang) {
        AppLang.pt => 'Artigos com detalhes de cada servico, tecnologia e abordagem de implementacao.',
        AppLang.es => 'Articulos con detalles de cada servicio, tecnologia y enfoque de implementacion.',
        AppLang.en => 'Articles with details on each service, technology and implementation approach.',
      };

  String get blogHeroSubtitle => switch (lang) {
        AppLang.pt => 'Artigos completos sobre servicos, stacks e implementacoes que ajudam clientes a entender o valor tecnico e comercial de cada entrega.',
        AppLang.es => 'Articulos completos sobre servicios, stacks e implementaciones que ayudan a entender el valor tecnico y comercial de cada entrega.',
        AppLang.en => 'Full articles about services, stacks and implementations that help clients understand the technical and commercial value of each delivery.',
      };

  String get readPost => switch (lang) {
        AppLang.pt => 'Ler post',
        AppLang.es => 'Leer post',
        AppLang.en => 'Read post',
      };

  String get backToBlog => switch (lang) {
        AppLang.pt => 'Voltar ao Blog',
        AppLang.es => 'Volver al Blog',
        AppLang.en => 'Back to Blog',
      };

  String get keyPoints => switch (lang) {
        AppLang.pt => 'Pontos-chave',
        AppLang.es => 'Puntos clave',
        AppLang.en => 'Key points',
      };

  String get postClosing => switch (lang) {
        AppLang.pt => 'Se a sua empresa precisa desta solucao, a Deploy Labz pode desenhar a melhor abordagem tecnica e comercial para o seu caso. Entre em contacto e transforme a tecnologia em resultado real.',
        AppLang.es => 'Si tu empresa necesita esta solucion, Deploy Labz puede definir la mejor estrategia tecnica y comercial para tu caso. Ponte en contacto y convierte la tecnologia en resultados reales.',
        AppLang.en => 'If your company needs this solution, Deploy Labz can define the best technical and commercial approach for your case. Get in touch and turn technology into real results.',
      };

  String get contactTitle => switch (lang) {
        AppLang.pt => 'Contato',
        AppLang.es => 'Contacto',
        AppLang.en => 'Contact',
      };

  String get businessEmailTitle => switch (lang) {
        AppLang.pt => 'Email comercial',
        AppLang.es => 'Email comercial',
        AppLang.en => 'Business email',
      };

  String get aboutUsLabel => switch (lang) {
        AppLang.pt => 'Sobre nos',
        AppLang.es => 'Sobre nosotros',
        AppLang.en => 'About us',
      };

  String get privacyLabel => switch (lang) {
        AppLang.pt => 'Politica de Privacidade',
        AppLang.es => 'Politica de Privacidad',
        AppLang.en => 'Privacy Policy',
      };

  String get termsLabel => switch (lang) {
        AppLang.pt => 'Termos de Uso',
        AppLang.es => 'Terminos de Uso',
        AppLang.en => 'Terms of Use',
      };

  String get cookiesLabel => 'Cookies';

  String get rightsReserved => switch (lang) {
        AppLang.pt => 'deploylabz.com | Todos os direitos reservados',
        AppLang.es => 'deploylabz.com | Todos los derechos reservados',
        AppLang.en => 'deploylabz.com | All rights reserved',
      };

  String get portugueseCompany => switch (lang) {
        AppLang.pt => 'Deploy Labz uma empresa portuguesa 🇵🇹🇪🇺',
        AppLang.es => 'Deploy Labz una empresa portuguesa 🇵🇹🇪🇺',
        AppLang.en => 'Deploy Labz a Portuguese company 🇵🇹🇪🇺',
      };

  String get cookieMessage => switch (lang) {
        AppLang.pt => '🍪 Este site usa cookies estritamente necessarios para funcionar. Consulte a nossa Politica de Cookies.',
        AppLang.es => '🍪 Este sitio utiliza cookies estrictamente necesarias para funcionar. Consulta nuestra Politica de Cookies.',
        AppLang.en => '🍪 This site uses strictly necessary cookies to work properly. See our Cookie Policy.',
      };

  String get cookieReject => switch (lang) {
        AppLang.pt => 'Apenas necessarios',
        AppLang.es => 'Solo necesarias',
        AppLang.en => 'Necessary only',
      };

  String get cookieAccept => switch (lang) {
        AppLang.pt => 'Aceitar todos',
        AppLang.es => 'Aceptar todo',
        AppLang.en => 'Accept all',
      };

  String get openLinkError => switch (lang) {
        AppLang.pt => 'Nao foi possivel abrir o link.',
        AppLang.es => 'No fue posible abrir el enlace.',
        AppLang.en => 'Unable to open the link.',
      };

  String get lgpdDialogTitle => switch (lang) {
        AppLang.pt => 'LGPD — Protecao de Dados',
        AppLang.es => 'RGPD — Proteccion de Datos',
        AppLang.en => 'GDPR — Data Protection',
      };

  String get privacyDialogTitle => privacyLabel;
  String get termsDialogTitle => switch (lang) {
        AppLang.pt => 'Termos e Condicoes de Utilizacao',
        AppLang.es => 'Terminos y Condiciones de Uso',
        AppLang.en => 'Terms and Conditions of Use',
      };
  String get cookiesDialogTitle => switch (lang) {
        AppLang.pt => 'Politica de Cookies',
        AppLang.es => 'Politica de Cookies',
        AppLang.en => 'Cookie Policy',
      };

  String get lgpdText => switch (lang) {
        AppLang.pt => 'A Deploy Labz trata os seus dados pessoais em conformidade com o Regulamento Geral sobre a Proteção de Dados (RGPD/GDPR) e a legislação portuguesa aplicável.\n\nDADOS QUE RECOLHEMOS\nApenas recolhemos os dados que nos fornece diretamente: nome, endereço de email e mensagem, quando nos contacta através dos meios disponíveis no site.\n\nFINALIDADE DO TRATAMENTO\nOs seus dados são utilizados exclusivamente para responder ao seu contacto e prestar os serviços solicitados. Não partilhamos, vendemos nem cedemos os seus dados a terceiros.\n\nPRAZO DE CONSERVAÇÃO\nOs dados são conservados pelo período estritamente necessário para responder à sua solicitação, não excedendo 12 meses, salvo obrigação legal.\n\nOS SEUS DIREITOS\nTem direito a aceder, retificar, apagar, limitar o tratamento e opor-se ao uso dos seus dados. Para exercer esses direitos, contacte-nos através de contato@deploylabz.com.\n\nRESPONSÁVEL PELO TRATAMENTO\nDeploy Labz — contato@deploylabz.com',
        AppLang.es => 'Deploy Labz trata tus datos personales de acuerdo con el RGPD y la legislacion aplicable en Portugal.\n\nDATOS QUE RECOPILAMOS\nSolo recopilamos los datos que proporcionas directamente: nombre, correo electronico y mensaje cuando contactas con nosotros a traves del sitio.\n\nFINALIDAD DEL TRATAMIENTO\nTus datos se utilizan exclusivamente para responder a tu contacto y prestar los servicios solicitados. No vendemos ni cedemos datos a terceros.\n\nCONSERVACION\nLos datos se conservan solo durante el tiempo necesario para responder a tu solicitud, salvo obligacion legal.\n\nDERECHOS\nPuedes solicitar acceso, rectificacion, eliminacion, limitacion u oposicion al tratamiento escribiendo a contato@deploylabz.com.\n\nRESPONSABLE\nDeploy Labz — contato@deploylabz.com',
        AppLang.en => 'Deploy Labz processes your personal data in accordance with the GDPR and applicable Portuguese law.\n\nDATA WE COLLECT\nWe only collect data you provide directly: name, email address and message when you contact us through this website.\n\nPURPOSE OF PROCESSING\nYour data is used exclusively to answer your request and provide the requested services. We do not sell or share your data with third parties.\n\nRETENTION\nData is kept only for the period necessary to answer your request, unless a legal obligation requires otherwise.\n\nYOUR RIGHTS\nYou may request access, correction, deletion, restriction or objection by contacting contato@deploylabz.com.\n\nDATA CONTROLLER\nDeploy Labz — contato@deploylabz.com',
      };

  String get privacyText => switch (lang) {
        AppLang.pt => 'POLÍTICA DE PRIVACIDADE — DEPLOY LABZ\n\n1. INFORMAÇÕES GERAIS\nA Deploy Labz, empresa estabelecida em Portugal, é responsável pelo tratamento dos dados pessoais recolhidos neste website.\n\n2. DADOS RECOLHIDOS\nRecolhemos apenas os dados fornecidos voluntariamente pelo utilizador ao utilizar os meios de contacto disponíveis no site.\n\n3. USO DOS DADOS\nOs dados são utilizados para responder a pedidos de contacto, elaborar propostas e prestar os serviços contratados.\n\n4. SEGURANÇA\nAdotamos medidas técnicas e organizativas adequadas para proteger os seus dados.\n\n5. COOKIES\nUtilizamos cookies estritamente necessários para o funcionamento do site.\n\n6. CONTACTO\ncontato@deploylabz.com',
        AppLang.es => 'POLÍTICA DE PRIVACIDAD — DEPLOY LABZ\n\n1. INFORMACIÓN GENERAL\nDeploy Labz, empresa establecida en Portugal, es responsable del tratamiento de los datos personales recogidos en este sitio web.\n\n2. DATOS RECOPILADOS\nSolo recopilamos los datos facilitados voluntariamente por el usuario a traves de los medios de contacto disponibles.\n\n3. USO DE LOS DATOS\nLos datos se utilizan para responder solicitudes de contacto, preparar propuestas y prestar los servicios contratados.\n\n4. SEGURIDAD\nAdoptamos medidas tecnicas y organizativas adecuadas para proteger tus datos.\n\n5. COOKIES\nUtilizamos cookies estrictamente necesarias para el funcionamiento del sitio.\n\n6. CONTACTO\ncontato@deploylabz.com',
        AppLang.en => 'PRIVACY POLICY — DEPLOY LABZ\n\n1. GENERAL INFORMATION\nDeploy Labz, a company established in Portugal, is responsible for processing the personal data collected on this website.\n\n2. DATA COLLECTED\nWe only collect data voluntarily provided by the user through the contact methods available on the site.\n\n3. USE OF DATA\nData is used to answer contact requests, prepare proposals and provide contracted services.\n\n4. SECURITY\nWe adopt appropriate technical and organizational measures to protect your data.\n\n5. COOKIES\nWe use only strictly necessary cookies for the website to function.\n\n6. CONTACT\ncontato@deploylabz.com',
      };

  String get termsText => switch (lang) {
        AppLang.pt => 'TERMOS E CONDIÇÕES DE UTILIZAÇÃO — DEPLOY LABZ\n\n1. ACEITAÇÃO\nAo aceder e utilizar este website, aceita os presentes Termos e Condições.\n\n2. SERVIÇOS\nA Deploy Labz presta serviços de desenvolvimento web, aplicações móveis, automações e consultoria tecnológica.\n\n3. PROPRIEDADE INTELECTUAL\nTodo o conteúdo deste website é propriedade da Deploy Labz ou dos seus licenciantes.\n\n4. LIMITAÇÃO DE RESPONSABILIDADE\nA Deploy Labz não se responsabiliza por danos indiretos resultantes da utilização deste website ou dos serviços prestados, para além do valor efetivamente pago pelo cliente.\n\n5. LEI APLICÁVEL\nOs presentes Termos são regidos pela lei portuguesa.\n\n6. CONTACTO\ncontato@deploylabz.com',
        AppLang.es => 'TÉRMINOS Y CONDICIONES DE USO — DEPLOY LABZ\n\n1. ACEPTACIÓN\nAl acceder y utilizar este sitio web aceptas estos Términos y Condiciones.\n\n2. SERVICIOS\nDeploy Labz presta servicios de desarrollo web, aplicaciones móviles, automatizaciones y consultoría tecnológica.\n\n3. PROPIEDAD INTELECTUAL\nTodo el contenido de este sitio web es propiedad de Deploy Labz o de sus licenciantes.\n\n4. LIMITACIÓN DE RESPONSABILIDAD\nDeploy Labz no se hace responsable de daños indirectos derivados del uso del sitio web o de los servicios prestados, más allá del valor pagado por el cliente.\n\n5. LEY APLICABLE\nEstos Términos se rigen por la legislación portuguesa.\n\n6. CONTACTO\ncontato@deploylabz.com',
        AppLang.en => 'TERMS AND CONDITIONS OF USE — DEPLOY LABZ\n\n1. ACCEPTANCE\nBy accessing and using this website, you accept these Terms and Conditions.\n\n2. SERVICES\nDeploy Labz provides web development, mobile app, automation and technology consulting services.\n\n3. INTELLECTUAL PROPERTY\nAll content on this website is owned by Deploy Labz or its licensors.\n\n4. LIMITATION OF LIABILITY\nDeploy Labz shall not be liable for indirect damages arising from the use of this website or the services provided, beyond the amount effectively paid by the client.\n\n5. APPLICABLE LAW\nThese Terms are governed by Portuguese law.\n\n6. CONTACT\ncontato@deploylabz.com',
      };

  String get cookiesText => switch (lang) {
        AppLang.pt => 'POLÍTICA DE COOKIES — DEPLOY LABZ\n\nO QUE SÃO COOKIES?\nCookies são pequenos ficheiros de texto guardados no seu dispositivo quando visita um website.\n\nCOOKIES QUE UTILIZAMOS\nEste website utiliza apenas cookies estritamente necessários para o seu funcionamento técnico.\n\nCOOKIES DE TERCEIROS\nNão instalamos cookies de terceiros.\n\nCOMO DESATIVAR COOKIES\nPode configurar o seu browser para recusar cookies, mas isso poderá afetar o funcionamento do site.\n\nCONTACTO\ncontato@deploylabz.com',
        AppLang.es => 'POLÍTICA DE COOKIES — DEPLOY LABZ\n\n¿QUÉ SON LAS COOKIES?\nLas cookies son pequeños archivos de texto guardados en tu dispositivo cuando visitas un sitio web.\n\nCOOKIES QUE UTILIZAMOS\nEste sitio utiliza únicamente cookies estrictamente necesarias para su funcionamiento técnico.\n\nCOOKIES DE TERCEROS\nNo instalamos cookies de terceros.\n\nCÓMO DESACTIVARLAS\nPuedes configurar tu navegador para rechazar cookies, aunque eso puede afectar el funcionamiento del sitio.\n\nCONTACTO\ncontato@deploylabz.com',
        AppLang.en => 'COOKIE POLICY — DEPLOY LABZ\n\nWHAT ARE COOKIES?\nCookies are small text files stored on your device when you visit a website.\n\nCOOKIES WE USE\nThis website only uses strictly necessary cookies required for technical operation.\n\nTHIRD-PARTY COOKIES\nWe do not install third-party cookies.\n\nHOW TO DISABLE COOKIES\nYou can configure your browser to reject cookies, although that may affect how the site works.\n\nCONTACT\ncontato@deploylabz.com',
      };

  String get aboutUsText => switch (lang) {
        AppLang.pt => 'SOBRE NÓS — DEPLOY LABZ\n\nA Deploy Labz é uma empresa portuguesa especializada em soluções digitais para negócios.\n\nCriamos sites, aplicações móveis, automações e integrações sob medida com foco em desempenho, design moderno e resultado comercial.\n\nAtuamos com startups, PMEs e empreendedores que precisam de execução rápida, comunicação clara e entregas confiáveis.\n\nNOSSA PROPOSTA\n• Tecnologia com foco em resultado;\n• Desenvolvimento sob medida;\n• Atendimento em português e alinhado ao mercado europeu.\n\nCONTACTO\ncontato@deploylabz.com\n+351 960 344 095',
        AppLang.es => 'SOBRE NOSOTROS — DEPLOY LABZ\n\nDeploy Labz es una empresa portuguesa especializada en soluciones digitales para negocios.\n\nCreamos sitios web, aplicaciones móviles, automatizaciones e integraciones a medida con foco en rendimiento, diseño moderno y resultado comercial.\n\nTrabajamos con startups, pymes y emprendedores que necesitan ejecucion rapida, comunicacion clara y entregas confiables.\n\nNUESTRA PROPUESTA\n• Tecnologia enfocada en resultados;\n• Desarrollo a medida;\n• Atencion en portugues y alineada con el mercado europeo.\n\nCONTACTO\ncontato@deploylabz.com\n+351 960 344 095',
        AppLang.en => 'ABOUT US — DEPLOY LABZ\n\nDeploy Labz is a Portuguese company specialized in digital solutions for businesses.\n\nWe build websites, mobile apps, automations and custom integrations focused on performance, modern design and commercial results.\n\nWe work with startups, SMEs and entrepreneurs who need fast execution, clear communication and reliable delivery.\n\nOUR PROPOSAL\n• Technology focused on results;\n• Custom development;\n• Support aligned with the European market.\n\nCONTACT\ncontato@deploylabz.com\n+351 960 344 095',
      };

  List<ServiceCardData> get services => switch (lang) {
        AppLang.pt => const [
            ServiceCardData(id: 'sites', title: 'Criacao de Sites', subtitle: 'Landing pages e sites institucionais com foco em conversao.', icon: Icons.language),
            ServiceCardData(id: 'apps', title: 'Apps Android e iOS', subtitle: 'Aplicativos modernos para operacao e vendas.', icon: Icons.phone_android),
            ServiceCardData(id: 'flutter', title: 'Flutter', subtitle: 'Multiplataforma com produtividade e qualidade.', icon: Icons.flutter_dash),
            ServiceCardData(id: 'automations', title: 'Automacoes', subtitle: 'Fluxos inteligentes para reduzir tarefas manuais.', icon: Icons.settings_suggest),
            ServiceCardData(id: 'whatsapp', title: 'Chatbot WhatsApp', subtitle: 'Atendimento e qualificacao de leads 24/7.', icon: Icons.support_agent),
            ServiceCardData(id: 'api', title: 'Integracao API', subtitle: 'Conexao entre sistemas e servicos externos.', icon: Icons.api),
            ServiceCardData(id: 'database', title: 'Banco de Dados', subtitle: 'Modelagem robusta e seguranca de dados.', icon: Icons.storage),
            ServiceCardData(id: 'security', title: 'Cybersecurity', subtitle: 'Analise de seguranca e mitigacao de riscos.', icon: Icons.shield_outlined),
          ],
        AppLang.es => const [
            ServiceCardData(id: 'sites', title: 'Creacion de Sitios Web', subtitle: 'Landing pages y sitios corporativos con foco en conversion.', icon: Icons.language),
            ServiceCardData(id: 'apps', title: 'Apps Android e iOS', subtitle: 'Aplicaciones modernas para operacion y ventas.', icon: Icons.phone_android),
            ServiceCardData(id: 'flutter', title: 'Flutter', subtitle: 'Multiplataforma con productividad y calidad.', icon: Icons.flutter_dash),
            ServiceCardData(id: 'automations', title: 'Automatizaciones', subtitle: 'Flujos inteligentes para reducir tareas manuales.', icon: Icons.settings_suggest),
            ServiceCardData(id: 'whatsapp', title: 'Chatbot WhatsApp', subtitle: 'Atencion y cualificacion de leads 24/7.', icon: Icons.support_agent),
            ServiceCardData(id: 'api', title: 'Integracion API', subtitle: 'Conexion entre sistemas y servicios externos.', icon: Icons.api),
            ServiceCardData(id: 'database', title: 'Base de Datos', subtitle: 'Modelado robusto y seguridad de datos.', icon: Icons.storage),
            ServiceCardData(id: 'security', title: 'Ciberseguridad', subtitle: 'Analisis de seguridad y mitigacion de riesgos.', icon: Icons.shield_outlined),
          ],
        AppLang.en => const [
            ServiceCardData(id: 'sites', title: 'Website Development', subtitle: 'Landing pages and corporate websites focused on conversion.', icon: Icons.language),
            ServiceCardData(id: 'apps', title: 'Android and iOS Apps', subtitle: 'Modern applications for operations and sales.', icon: Icons.phone_android),
            ServiceCardData(id: 'flutter', title: 'Flutter', subtitle: 'Cross-platform delivery with productivity and quality.', icon: Icons.flutter_dash),
            ServiceCardData(id: 'automations', title: 'Automations', subtitle: 'Smart flows to reduce manual work.', icon: Icons.settings_suggest),
            ServiceCardData(id: 'whatsapp', title: 'WhatsApp Chatbot', subtitle: 'Customer service and lead qualification 24/7.', icon: Icons.support_agent),
            ServiceCardData(id: 'api', title: 'API Integration', subtitle: 'Connect systems and external services.', icon: Icons.api),
            ServiceCardData(id: 'database', title: 'Database', subtitle: 'Robust modeling and data security.', icon: Icons.storage),
            ServiceCardData(id: 'security', title: 'Cybersecurity', subtitle: 'Security analysis and risk mitigation.', icon: Icons.shield_outlined),
          ],
      };

  Map<String, BlogPostData> get blogPosts => switch (lang) {
        AppLang.pt => const {
            'sites': BlogPostData(serviceTitle: 'Criacao de Sites', headline: 'Criacao de sites profissionais para empresas que querem vender mais online', highlights: ['Desenvolvimento de sites profissionais com foco em SEO, velocidade e conversao.', 'Estrutura comercial com chamadas para acao, prova de confianca e navegacao objetiva.', 'Layout responsivo para desktop, tablet e mobile com experiencia consistente.'], body: ['Criacao de sites profissionais exige mais do que presenca visual. Um site empresarial precisa comunicar valor, gerar confianca e transformar visitas em contactos ou vendas. Por isso, cada projeto comeca pela definicao da estrutura, do objetivo comercial e da mensagem principal da marca.', 'Na Deploy Labz, o desenvolvimento web e pensado com foco em SEO tecnico, performance, responsividade e clareza de navegacao. Isso melhora a experiencia do utilizador e tambem ajuda a empresa a ser encontrada no Google com mais consistencia.', 'O resultado e um site rapido, moderno e preparado para crescer com o negocio, seja para captar leads, apresentar servicos ou fortalecer autoridade digital.']),
            'apps': BlogPostData(serviceTitle: 'Apps Android e iOS', headline: 'Desenvolvimento de apps Android e iOS para negocios que precisam escalar', highlights: ['Aplicativos com interface fluida, foco em usabilidade e experiencia mobile real.', 'Preparacao para Android e iOS com boas praticas de lancamento e manutencao.', 'Base pronta para novas funcionalidades, integracoes e crescimento do produto.'], body: ['O desenvolvimento de apps Android e iOS tornou-se decisivo para empresas que precisam aproximar-se do cliente, digitalizar operacoes ou criar novos canais de receita. Um aplicativo bem pensado melhora experiencia, recorrencia e eficiencia operacional.', 'O trabalho nao e apenas visual. Um bom app precisa de fluxo claro, usabilidade, velocidade, integracao com sistemas e capacidade de evolucao. Isso vale tanto para apps de servico como para vendas, atendimento ou operacao interna.', 'Na pratica, a entrega precisa equilibrar experiencia do utilizador com viabilidade tecnica, para que o app nasca pronto para crescer e nao precise ser refeito a cada nova fase do negocio.']),
            'flutter': BlogPostData(serviceTitle: 'Flutter', headline: 'Flutter para criar apps modernos com rapidez, qualidade e menor custo operacional', highlights: ['Codigo unico para acelerar entrega e reduzir custo de desenvolvimento.', 'Interfaces modernas e consistentes em varias plataformas.', 'Facilidade para integrar APIs, notificacoes, login e recursos nativos.'], body: ['Flutter e uma das tecnologias mais eficientes para criar apps modernos com rapidez e alto padrao visual. Ao usar uma base unica de codigo, a empresa reduz custo de desenvolvimento e acelera a entrada no mercado.', 'Essa abordagem permite manter consistencia entre plataformas, simplificar manutencao e evoluir funcionalidades com mais previsibilidade. Para startups e PMEs, isso representa ganho real de velocidade e controlo de investimento.', 'Quando bem aplicado, Flutter entrega uma combinacao muito forte entre design, produtividade, qualidade tecnica e escalabilidade do produto digital.']),
            'automations': BlogPostData(serviceTitle: 'Automacoes', headline: 'Automacoes empresariais para ganhar tempo, reduzir erros e aumentar produtividade', highlights: ['Mapeamento de processos manuais e criacao de fluxos automaticos sob medida.', 'Regras de negocio acionadas por eventos, integracoes e etapas operacionais.', 'Menos retrabalho, menos falhas humanas e mais eficiencia no dia a dia.'], body: ['Automacoes empresariais existem para reduzir desperdicio de tempo, eliminar tarefas repetitivas e melhorar a eficiencia do dia a dia. Em vez de depender de processos manuais, a operacao passa a funcionar com regras claras e fluxos automatizados.', 'O primeiro passo e entender gargalos, validacoes e etapas que hoje atrasam a equipa. Depois, construimos rotinas que conectam sistemas, disparam acoes e diminuem falhas humanas.', 'Uma automacao bem desenhada nao complica a estrutura da empresa. Pelo contrario: ela organiza a operacao, acelera entregas e liberta a equipa para tarefas mais estrategicas.']),
            'whatsapp': BlogPostData(serviceTitle: 'Chatbot WhatsApp', headline: 'Chatbot para WhatsApp com atendimento automatico e qualificacao de leads', highlights: ['Fluxos de conversa para responder rapido e organizar o primeiro atendimento.', 'Triagem inicial de leads antes do contacto humano da equipa comercial.', 'Possibilidade de integrar CRM, vendas e operacao para ganhar escala.'], body: ['O chatbot para WhatsApp tornou-se uma ferramenta poderosa para atendimento comercial, suporte inicial e captacao de leads. Empresas que respondem rapido tendem a converter mais e perder menos oportunidades.', 'Um bom fluxo automatizado organiza o primeiro contacto, responde perguntas frequentes, recolhe informacao relevante e encaminha apenas o que realmente precisa de atendimento humano.', 'Com isso, o WhatsApp deixa de ser apenas um canal informal e passa a funcionar como parte estruturada da operacao comercial e de relacionamento com o cliente.']),
            'api': BlogPostData(serviceTitle: 'Integracao API', headline: 'Integracao de APIs para conectar sistemas e eliminar trabalho manual', highlights: ['Conexao entre plataformas para sincronizar dados e processos.', 'Autenticacao, padronizacao e tratamento de erros pensados para estabilidade.', 'Estrutura preparada para monitoramento, rastreabilidade e escala.'], body: ['Integracao de APIs e essencial para empresas que usam varios sistemas e precisam que os dados circulem de forma automatica. Sem integracao, surgem retrabalho, erros e perda de visibilidade sobre a operacao.', 'Uma integracao bem feita precisa considerar autenticacao, estabilidade, tratamento de falhas e consistencia entre plataformas. O objetivo nao e apenas conectar, mas garantir que tudo funcione com seguranca e previsibilidade.', 'Ao integrar sistemas corretamente, a empresa ganha velocidade, reduz tarefas manuais e melhora a confiabilidade dos processos internos e comerciais.']),
            'database': BlogPostData(serviceTitle: 'Banco de Dados', headline: 'Banco de dados estruturado para performance, seguranca e crescimento do negocio', highlights: ['Modelagem orientada ao negocio com foco em consistencia e rapidez.', 'Consultas otimizadas, indices e manutencao pensada para escala.', 'Backup, controlo de acesso e protecao da informacao sensivel.'], body: ['Banco de dados bem estruturado e parte central de qualquer sistema confiavel. Quando a base e mal desenhada, surgem lentidao, inconsistencias e dificuldade para crescer sem retrabalho.', 'Por isso, a modelagem precisa considerar performance, integridade dos dados, controlo de acesso e facilidade de manutencao. Nao basta armazenar informacao: e preciso tornar o uso dos dados rapido, seguro e coerente.', 'Empresas que pensam na base desde o inicio conseguem evoluir sistemas com mais estabilidade, melhor leitura operacional e menos risco tecnico no futuro.']),
            'security': BlogPostData(serviceTitle: 'Cybersecurity', headline: 'Cybersecurity para proteger dados, operacao e reputacao digital da empresa', highlights: ['Analise de riscos e correcoes prioritarias para reduzir vulnerabilidades.', 'Reforco de autenticacao, permissoes e protecao de dados.', 'Boas praticas para reduzir riscos tecnicos, operacionais e juridicos.'], body: ['Cybersecurity deixou de ser um tema restrito a grandes empresas. Qualquer negocio com operacao digital precisa proteger dados, acessos e processos para evitar prejuizos tecnicos, comerciais e reputacionais.', 'A seguranca digital deve ser aplicada desde a arquitetura ate as regras de acesso, autenticacao e protecao da informacao. Quanto antes isso entra no projeto, menor o risco de vulnerabilidades criticas depois.', 'Na pratica, boas medidas de cybersecurity aumentam confianca, reduzem exposicao e ajudam a empresa a operar com mais estabilidade num ambiente digital cada vez mais sensivel.']),
          },
        AppLang.es => const {
            'sites': BlogPostData(serviceTitle: 'Creacion de Sitios Web', headline: 'Creacion de sitios web profesionales para empresas que quieren vender mas online', highlights: ['Desarrollo de sitios web con foco en SEO, velocidad y conversion.', 'Estructura comercial con llamadas a la accion, confianza y navegacion objetiva.', 'Diseño responsive para escritorio, tablet y movil.'], body: ['La creacion de sitios web profesionales va mucho mas alla de tener presencia visual. Un sitio empresarial debe comunicar valor, generar confianza y transformar visitas en contactos o ventas.', 'En Deploy Labz, el desarrollo web se plantea con foco en SEO tecnico, rendimiento, adaptabilidad y claridad de navegacion. Eso mejora la experiencia del usuario y ayuda a posicionar mejor la empresa.', 'El resultado es un sitio rapido, moderno y preparado para crecer junto con el negocio.']),
            'apps': BlogPostData(serviceTitle: 'Apps Android e iOS', headline: 'Desarrollo de apps Android e iOS para negocios que necesitan escalar', highlights: ['Aplicaciones con interfaz fluida y experiencia mobile real.', 'Preparacion para Android e iOS con buenas practicas de lanzamiento y mantenimiento.', 'Base lista para nuevas funcionalidades e integraciones.'], body: ['El desarrollo de apps Android e iOS es clave para empresas que necesitan acercarse al cliente, digitalizar operaciones o crear nuevos canales de ingresos.', 'Un buen producto mobile necesita flujo claro, usabilidad, velocidad, integracion y capacidad de evolucion. No se trata solo de pantallas bonitas.', 'La entrega correcta equilibra experiencia del usuario con viabilidad tecnica para que el producto pueda crecer sin rehacer la base.']),
            'flutter': BlogPostData(serviceTitle: 'Flutter', headline: 'Flutter para crear apps modernas con rapidez, calidad y menor coste operativo', highlights: ['Codigo unico para acelerar entrega y reducir costes.', 'Interfaces modernas y consistentes en varias plataformas.', 'Facilidad para integrar APIs, notificaciones y funciones nativas.'], body: ['Flutter es una de las tecnologias mas eficientes para crear apps modernas con rapidez y alto nivel visual. Una sola base de codigo reduce costes y acelera el time-to-market.', 'Esta estrategia facilita el mantenimiento y la evolucion del producto, manteniendo coherencia entre plataformas.', 'Para startups y pymes, Flutter ofrece una combinacion muy fuerte entre velocidad, calidad y escalabilidad.']),
            'automations': BlogPostData(serviceTitle: 'Automatizaciones', headline: 'Automatizaciones empresariales para ganar tiempo, reducir errores y aumentar productividad', highlights: ['Mapeo de procesos manuales y creacion de flujos automaticos.', 'Reglas de negocio activadas por eventos, integraciones y etapas operativas.', 'Menos retrabajo y mayor eficiencia diaria.'], body: ['Las automatizaciones empresariales permiten reducir tiempo perdido, tareas repetitivas y errores manuales.', 'El trabajo comienza con identificar cuellos de botella y etapas que hoy frenan la operacion. Luego se construyen flujos que conectan sistemas y disparan acciones.', 'Una automatizacion bien hecha simplifica la rutina y mejora la productividad real del negocio.']),
            'whatsapp': BlogPostData(serviceTitle: 'Chatbot WhatsApp', headline: 'Chatbot para WhatsApp con atencion automatica y cualificacion de leads', highlights: ['Flujos de conversacion para responder mas rapido.', 'Cualificacion inicial de leads antes del contacto humano.', 'Posibilidad de integracion con CRM y ventas.'], body: ['El chatbot para WhatsApp es una herramienta clave para atencion comercial, soporte inicial y captacion de leads.', 'Un buen flujo automatizado organiza el primer contacto, responde preguntas frecuentes y recoge informacion relevante antes de pasar al equipo.', 'Asi, WhatsApp deja de ser solo un canal informal y pasa a formar parte estructurada del proceso comercial.']),
            'api': BlogPostData(serviceTitle: 'Integracion API', headline: 'Integracion de APIs para conectar sistemas y eliminar trabajo manual', highlights: ['Conexion entre plataformas para sincronizar datos y procesos.', 'Autenticacion y tratamiento de errores pensados para estabilidad.', 'Preparado para trazabilidad y escala.'], body: ['La integracion de APIs es esencial para empresas que usan varios sistemas y necesitan que los datos circulen automaticamente.', 'Sin integracion aparecen errores, tareas repetidas y perdida de visibilidad operativa.', 'Una integracion bien hecha mejora velocidad, confianza y consistencia de los procesos internos y comerciales.']),
            'database': BlogPostData(serviceTitle: 'Base de Datos', headline: 'Base de datos estructurada para rendimiento, seguridad y crecimiento del negocio', highlights: ['Modelado orientado al negocio con foco en consistencia y rapidez.', 'Consultas optimizadas e indices para escala.', 'Backup, control de acceso y proteccion de datos sensibles.'], body: ['Una base de datos bien estructurada es parte central de cualquier sistema fiable.', 'El modelado debe considerar rendimiento, integridad, control de acceso y facilidad de mantenimiento.', 'Las empresas que piensan la base desde el inicio crecen con mas estabilidad y menos riesgo tecnico.']),
            'security': BlogPostData(serviceTitle: 'Ciberseguridad', headline: 'Ciberseguridad para proteger datos, operacion y reputacion digital de la empresa', highlights: ['Analisis de riesgos y correcciones prioritarias.', 'Refuerzo de autenticacion, permisos y proteccion de datos.', 'Buenas practicas para reducir riesgos tecnicos y juridicos.'], body: ['La ciberseguridad ya no es un tema exclusivo de grandes empresas. Cualquier negocio digital necesita proteger datos y accesos.', 'La seguridad debe entrar desde la arquitectura hasta las reglas de autenticacion y proteccion de informacion.', 'Aplicada correctamente, aumenta la confianza y reduce la exposicion del negocio en el entorno digital.']),
          },
        AppLang.en => const {
            'sites': BlogPostData(serviceTitle: 'Website Development', headline: 'Professional website development for companies that want to sell more online', highlights: ['Professional website development focused on SEO, speed and conversion.', 'Commercial structure with clear calls to action, trust signals and objective navigation.', 'Responsive layout for desktop, tablet and mobile.'], body: ['Professional website development goes far beyond visual presence. A business website must communicate value, build trust and turn visits into leads or sales.', 'At Deploy Labz, web development is planned with technical SEO, performance, responsiveness and navigation clarity in mind. That improves user experience and helps the company perform better in search engines.', 'The result is a fast, modern website prepared to grow with the business, whether the goal is lead generation, service presentation or digital authority.']),
            'apps': BlogPostData(serviceTitle: 'Android and iOS Apps', headline: 'Android and iOS app development for businesses that need to scale', highlights: ['Applications with smooth interface and real mobile usability.', 'Preparation for Android and iOS with launch and maintenance best practices.', 'A solid base for new features, integrations and product growth.'], body: ['Android and iOS app development has become essential for businesses that need to get closer to customers, digitize operations or create new revenue channels.', 'A strong mobile product requires flow clarity, usability, speed, system integration and room to evolve. It is not only about attractive screens.', 'Good delivery balances user experience with technical viability so the app can grow without rebuilding the whole foundation.']),
            'flutter': BlogPostData(serviceTitle: 'Flutter', headline: 'Flutter to build modern apps faster, with quality and lower operating cost', highlights: ['Single codebase to accelerate delivery and reduce development cost.', 'Modern and consistent interfaces across platforms.', 'Easy integration with APIs, notifications and native capabilities.'], body: ['Flutter is one of the most efficient technologies for building modern apps quickly with a strong visual standard. A single codebase reduces cost and accelerates time to market.', 'This strategy simplifies maintenance and product evolution while keeping consistency across platforms.', 'For startups and SMEs, Flutter offers a strong combination of speed, quality and scalability.']),
            'automations': BlogPostData(serviceTitle: 'Automations', headline: 'Business automations to save time, reduce errors and increase productivity', highlights: ['Mapping manual processes and creating automated flows.', 'Business rules triggered by events, integrations and operational stages.', 'Less rework and better daily efficiency.'], body: ['Business automations reduce wasted time, repetitive tasks and manual mistakes.', 'The work starts by identifying bottlenecks and stages that currently slow the operation. From there, we build flows that connect systems and trigger actions automatically.', 'A well-designed automation simplifies the routine and improves real business productivity.']),
            'whatsapp': BlogPostData(serviceTitle: 'WhatsApp Chatbot', headline: 'WhatsApp chatbot with automated support and lead qualification', highlights: ['Conversation flows to answer faster and organize first contact.', 'Initial lead qualification before human follow-up.', 'Possibility to integrate with CRM and sales operation.'], body: ['A WhatsApp chatbot is a powerful tool for commercial support, first-line service and lead capture.', 'A good automated flow organizes the first interaction, answers common questions and collects relevant information before handing over to the team.', 'That turns WhatsApp from an informal channel into a structured part of the business process.']),
            'api': BlogPostData(serviceTitle: 'API Integration', headline: 'API integration to connect systems and eliminate manual work', highlights: ['Connect platforms to sync data and processes.', 'Authentication and error handling designed for stability.', 'Prepared for traceability and scale.'], body: ['API integration is essential for businesses that use multiple systems and need data to move automatically.', 'Without integration, errors, repetitive tasks and poor operational visibility become common.', 'A well-built integration improves speed, reliability and consistency across internal and commercial processes.']),
            'database': BlogPostData(serviceTitle: 'Database', headline: 'Structured database for performance, security and business growth', highlights: ['Business-oriented modeling focused on consistency and speed.', 'Optimized queries and indexing for scale.', 'Backup, access control and protection of sensitive information.'], body: ['A well-structured database is a central part of any reliable system.', 'Modeling must consider performance, integrity, access control and maintainability from the beginning.', 'Businesses that design their data layer properly can grow with more stability and less technical risk.']),
            'security': BlogPostData(serviceTitle: 'Cybersecurity', headline: 'Cybersecurity to protect data, operations and the company’s digital reputation', highlights: ['Risk analysis and priority fixes to reduce vulnerabilities.', 'Stronger authentication, permissions and data protection.', 'Best practices to reduce technical, operational and legal risks.'], body: ['Cybersecurity is no longer a concern only for large companies. Any digital business needs to protect data, access and processes.', 'Security should be considered from architecture decisions to authentication and data protection rules.', 'When applied properly, it increases trust and reduces exposure in an increasingly sensitive digital environment.']),
          },
      };
}

void main() {
  runApp(const DeployLabzApp());
}

class DeployLabzApp extends StatefulWidget {
  const DeployLabzApp({super.key});

  @override
  State<DeployLabzApp> createState() => _DeployLabzAppState();
}

class _DeployLabzAppState extends State<DeployLabzApp> {
  AppLang _lang = AppLang.pt;

  @override
  void initState() {
    super.initState();
    try {
      final stored = html.window.localStorage['dl_lang'];
      _lang = stored != null
          ? AppLangX.fromCode(stored)
          : AppLangX.fromCode(html.window.navigator.language);
    } catch (_) {
      _lang = AppLang.pt;
    }
  }

  void _setLang(AppLang lang) {
    setState(() => _lang = lang);
    try {
      html.window.localStorage['dl_lang'] = lang.code;
    } catch (_) {}
  }

  @override
  Widget build(BuildContext context) {
    final copy = AppCopy(_lang);

    return MaterialApp(
      title: copy.appTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFEAF4FF),
        textTheme: GoogleFonts.spaceGroteskTextTheme(),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF00E5FF),
          secondary: Color(0xFFFF3D9A),
          surface: Color(0xFF101528),
        ),
      ),
      home: HomePage(
        lang: _lang,
        onLanguageChanged: _setLang,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.lang,
    required this.onLanguageChanged,
  });

  final AppLang lang;
  final ValueChanged<AppLang> onLanguageChanged;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _heroKey = GlobalKey();
  final _servicesKey = GlobalKey();
  final _techKey = GlobalKey();
  final _contactKey = GlobalKey();

  bool _cookieConsent = false;
  static const _allowedExternalSchemes = {'https', 'mailto'};

  AppCopy get copy => AppCopy(widget.lang);

  @override
  void initState() {
    super.initState();
    try {
      final val = html.window.localStorage['dl_cookie_consent'];
      if (val != null) _cookieConsent = true;
    } catch (_) {}
  }

  void _acceptCookies() {
    try { html.window.localStorage['dl_cookie_consent'] = 'accepted'; } catch (_) {}
    setState(() => _cookieConsent = true);
  }

  void _rejectCookies() {
    try { html.window.localStorage['dl_cookie_consent'] = 'rejected'; } catch (_) {}
    setState(() => _cookieConsent = true);
  }

  Future<void> _open(String url) async {
    final uri = Uri.parse(url);
    if (!_allowedExternalSchemes.contains(uri.scheme)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(copy.openLinkError)),
      );
      return;
    }
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(copy.openLinkError)),
      );
    }
  }

  void _scrollTo(GlobalKey key) {
    final current = key.currentContext;
    if (current == null) return;
    Scrollable.ensureVisible(
      current,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOutCubic,
      alignment: 0.07,
    );
  }

  void _openBlog([String? serviceTitle]) {
    final posts = copy.blogPosts;
    if (serviceTitle != null) {
      final post = posts[serviceTitle];
      if (post == null) return;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (_) => BlogPostPage(
            lang: widget.lang,
            onLanguageChanged: widget.onLanguageChanged,
            serviceTitle: serviceTitle,
            post: post,
          ),
        ),
      );
      return;
    }

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlogPage(
          lang: widget.lang,
          onLanguageChanged: widget.onLanguageChanged,
          posts: posts,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 940;

    return Scaffold(
      floatingActionButton: _cookieConsent
          ? isMobile
              ? FloatingActionButton.small(
                  onPressed: () => _open('https://wa.me/351960344095'),
                  backgroundColor: const Color(0xFF16C784),
                  foregroundColor: Colors.black,
                  child: const Icon(Icons.chat_bubble_outline),
                )
              : FloatingActionButton.extended(
                  onPressed: () => _open('https://wa.me/351960344095'),
                  backgroundColor: const Color(0xFF16C784),
                  foregroundColor: Colors.black,
                  icon: const Icon(Icons.chat_bubble_outline),
                  label: const Text('WhatsApp'),
                )
          : null,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF4FF), Color(0xFFDCEBFF), Color(0xFFF4F8FF)],
          ),
        ),
        child: Stack(
          children: [
            const Positioned.fill(child: IgnorePointer(child: _ScanlineOverlay())),
            Column(
              children: [
                _TopNav(
                  lang: widget.lang,
                  onLanguageChanged: widget.onLanguageChanged,
                  copy: copy,
                  isMobile: isMobile,
                  onHero: () => _scrollTo(_heroKey),
                  onServices: () => _scrollTo(_servicesKey),
                  onTech: () => _scrollTo(_techKey),
                  onBlog: _openBlog,
                  onContact: () => _scrollTo(_contactKey),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _HeroSection(
                          copy: copy,
                          key: _heroKey,
                          onWhatsTap: () => _open('https://wa.me/351960344095'),
                          onContactTap: () => _open('mailto:contato@deploylabz.com'),
                        ),
                        _SectionWrapper(
                          key: _servicesKey,
                          title: copy.servicesTitle,
                          subtitle: copy.servicesSubtitle,
                          child: _ServiceGrid(
                            items: copy.services,
                            onOpenPost: _openBlog,
                          ),
                        ),
                        _SectionWrapper(
                          key: _techKey,
                          title: copy.technologiesTitle,
                          subtitle: '',
                          child: const _TechCarousel(),
                        ),
                        _Footer(
                          copy: copy,
                          key: _contactKey,
                          onMailTap: () => _open('mailto:contato@deploylabz.com'),
                          onWhatsTap: () => _open('https://wa.me/351960344095'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (!_cookieConsent)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: _CookieBanner(
                  copy: copy,
                  onAccept: _acceptCookies,
                  onReject: _rejectCookies,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _TopNav extends StatefulWidget {
  const _TopNav({
    required this.lang,
    required this.onLanguageChanged,
    required this.copy,
    required this.isMobile,
    required this.onHero,
    required this.onServices,
    required this.onTech,
    required this.onBlog,
    required this.onContact,
  });

  final AppLang lang;
  final ValueChanged<AppLang> onLanguageChanged;
  final AppCopy copy;
  final bool isMobile;
  final VoidCallback onHero;
  final VoidCallback onServices;
  final VoidCallback onTech;
  final VoidCallback onBlog;
  final VoidCallback onContact;

  @override
  State<_TopNav> createState() => _TopNavState();
}

class _TopNavState extends State<_TopNav> with SingleTickerProviderStateMixin {
  late final AnimationController _scroll;

  static const _bin =
      '01001011 00110100 11010010 10001101 01110010 00101101 11001010 01000110 '
      '10110001 00101110 01101001 10100011 00011010 10110010 01001101 10001010 '
      '01001011 00110100 11010010 10001101 01110010 00101101 11001010 01000110 '
      '10110001 00101110 01101001 10100011 00011010 10110010 01001101 10001010 ';

  @override
  void initState() {
    super.initState();
    _scroll = AnimationController(vsync: this, duration: const Duration(seconds: 28))
      ..repeat();
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final menu = [
      (widget.copy.menuHome, widget.onHero),
      (widget.copy.menuServices, widget.onServices),
      (widget.copy.menuTech, widget.onTech),
      (widget.copy.menuBlog, widget.onBlog),
      (widget.copy.menuContact, widget.onContact),
    ];
    final brand = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: widget.isMobile ? 34 : 36,
          height: widget.isMobile ? 34 : 36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: const LinearGradient(
              colors: [Color(0xFF00E5FF), Color(0xFFFF3D9A)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: const Icon(Icons.bolt, color: Colors.white),
        ),
        const SizedBox(width: 10),
        Text(
          'DEPLOY LABZ',
          style: GoogleFonts.orbitron(
            color: const Color(0xFF11345A),
            fontWeight: FontWeight.w700,
            letterSpacing: widget.isMobile ? 0.8 : 1.2,
            fontSize: widget.isMobile ? 17 : 20,
          ),
        ),
      ],
    );

    return Container(
      height: widget.isMobile ? 108 : 78,
      padding: EdgeInsets.fromLTRB(20, widget.isMobile ? 12 : 0, 20, 0),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FDFF),
        border: Border(bottom: BorderSide(color: const Color(0xFF00E5FF).withValues(alpha: 0.22))),
      ),
      child: ClipRect(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: 6,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                animation: _scroll,
                builder: (_, child) => Transform.translate(
                  offset: Offset(-_scroll.value * 1100, 0),
                  child: Opacity(
                    opacity: 0.28,
                    child: Text(
                      _bin,
                      style: GoogleFonts.robotoMono(
                        color: const Color(0xFF00E5FF),
                        fontSize: 12,
                        letterSpacing: 2,
                        shadows: [
                          Shadow(
                            color: const Color(0xFF00E5FF),
                            blurRadius: 8,
                          ),
                        ],
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.visible,
                      softWrap: false,
                    ),
                  ),
                ),
              ),
            ),
            if (widget.isMobile)
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Expanded(child: brand),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: _LanguageSelector(
                            lang: widget.lang,
                            onChanged: widget.onLanguageChanged,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      PopupMenuButton<int>(
                        color: const Color(0xFF0E1530),
                        icon: const Icon(Icons.menu, color: Color(0xFF11345A)),
                        onSelected: (index) => menu[index].$2(),
                        itemBuilder: (context) => [
                          for (var i = 0; i < menu.length; i++)
                            PopupMenuItem(
                              value: i,
                              child: Text(menu[i].$1, style: const TextStyle(color: Colors.white)),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            else
              Row(
                children: [
                  brand,
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _LanguageSelector(
                        lang: widget.lang,
                        onChanged: widget.onLanguageChanged,
                      ),
                      const SizedBox(width: 10),
                      Wrap(
                        spacing: 8,
                        children: [
                          for (final item in menu)
                            TextButton(
                              onPressed: item.$2,
                              style: TextButton.styleFrom(
                                foregroundColor: const Color(0xFF19466F),
                              ),
                              child: Text(item.$1),
                            ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _LanguageSelector extends StatelessWidget {
  const _LanguageSelector({required this.lang, required this.onChanged});

  final AppLang lang;
  final ValueChanged<AppLang> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        color: const Color(0xFFE6F2FF),
        border: Border.all(color: const Color(0x3300E5FF)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final option in AppLang.values)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2),
              child: InkWell(
                borderRadius: BorderRadius.circular(999),
                onTap: () => onChanged(option),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(999),
                    color: lang == option ? const Color(0xFF11345A) : Colors.transparent,
                  ),
                  child: Text(
                    option.code.toUpperCase(),
                    style: TextStyle(
                      color: lang == option ? Colors.white : const Color(0xFF19466F),
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    super.key,
    required this.copy,
    required this.onWhatsTap,
    required this.onContactTap,
  });

  final AppCopy copy;
  final VoidCallback onWhatsTap;
  final VoidCallback onContactTap;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final isCompact = width < 980;
    final isPhone = width < 480;

    return Padding(
      padding: EdgeInsets.fromLTRB(isPhone ? 14 : 20, 24, isPhone ? 14 : 20, 10),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1160),
          child: Container(
            padding: EdgeInsets.all(isPhone ? 18 : 26),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              gradient: const LinearGradient(
                colors: [Color(0xFF2A55A3), Color(0xFF2D74C4), Color(0xFF5B4BC6)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: const Color(0xFF00E5FF).withValues(alpha: 0.25)),
              boxShadow: const [
                BoxShadow(color: Color(0x2200E5FF), blurRadius: 32, offset: Offset(0, 10)),
                BoxShadow(color: Color(0x22FF3D9A), blurRadius: 30, offset: Offset(0, 12)),
              ],
            ),
            child: Stack(
              children: [
                const Positioned.fill(child: IgnorePointer(child: _HoloGridOverlay())),
                const Positioned(right: -40, top: -30, child: _NeonOrb(size: 180, color: Color(0x4400E5FF))),
                const Positioned(left: 120, bottom: -50, child: _NeonOrb(size: 140, color: Color(0x44FF3D9A))),
                Flex(
                  direction: isCompact ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            copy.heroTitle,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.audiowide(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              letterSpacing: isPhone ? 0.3 : 0.6,
                              height: 1.15,
                              fontSize: isPhone ? 28 : (isCompact ? 34 : 48),
                            ),
                          ),
                          SizedBox(height: isPhone ? 12 : 14),
                          Text(
                            copy.heroSubtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFFD4E3FF),
                              fontSize: isPhone ? 15 : 18,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: isPhone ? 18 : 24),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: [
                              _NeonGradientButton(
                                onTap: onWhatsTap,
                                icon: Icons.flash_on,
                                label: copy.whatsappCta,
                              ),
                              OutlinedButton.icon(
                                onPressed: onContactTap,
                                style: OutlinedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  side: const BorderSide(color: Color(0xFF8C9BFF)),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isPhone ? 16 : 20,
                                    vertical: isPhone ? 12 : 14,
                                  ),
                                ),
                                icon: const Icon(Icons.mail_outline),
                                label: Text(copy.emailLabel),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NeonOrb extends StatelessWidget {
  const _NeonOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }
}

class _SectionWrapper extends StatefulWidget {
  const _SectionWrapper({
    super.key,
    required this.title,
    required this.subtitle,
    required this.child,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  State<_SectionWrapper> createState() => _SectionWrapperState();
}

class _SectionWrapperState extends State<_SectionWrapper>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse;
  late final Animation<Color?> _color;

  @override
  void initState() {
    super.initState();
    _pulse = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
    _color = ColorTween(
      begin: const Color(0xFF00E5FF),
      end: const Color(0xFF8C9BFF),
    ).animate(CurvedAnimation(parent: _pulse, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasSubtitle = widget.subtitle.trim().isNotEmpty;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedBuilder(
                animation: _color,
                builder: (context, _) => Text(
                  widget.title,
                  style: GoogleFonts.orbitron(
                    color: _color.value,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    shadows: [
                      Shadow(
                        color: (_color.value ?? const Color(0xFF39FF14)).withValues(alpha: 0.7),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                ),
              ),
              if (hasSubtitle) const SizedBox(height: 8),
              if (hasSubtitle)
                Text(
                  widget.subtitle,
                  style: const TextStyle(color: Color(0xFF9FB0D6), fontSize: 16),
                ),
              SizedBox(height: hasSubtitle ? 16 : 8),
              widget.child,
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceGrid extends StatelessWidget {
  const _ServiceGrid({required this.items, required this.onOpenPost});

  final List<ServiceCardData> items;
  final ValueChanged<String> onOpenPost;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = width < 800 ? double.infinity : 560.0;

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        for (final item in items)
          SizedBox(
            width: cardWidth,
            child: _GlassCard(
              title: item.title,
              subtitle: item.subtitle,
              icon: item.icon,
              onTap: () => onOpenPost(item.id),
            ),
          ),
      ],
    );
  }
}

class _GlassCard extends StatefulWidget {
  const _GlassCard({required this.title, required this.subtitle, required this.icon, required this.onTap});

  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  @override
  State<_GlassCard> createState() => _GlassCardState();
}

class _GlassCardState extends State<_GlassCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()..translateByDouble(0.0, hover ? -4.0 : 0.0, 0.0, 1.0),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: hover
                ? const LinearGradient(colors: [Color(0x55271C56), Color(0x5520164C)])
                : const LinearGradient(colors: [Color(0x6631467A), Color(0x66323B72)]),
            border: Border.all(
              color: hover ? const Color(0xFF00E5FF) : const Color(0x44455B8A),
            ),
            boxShadow: [
              if (hover)
                const BoxShadow(color: Color(0x6600E5FF), blurRadius: 30, spreadRadius: 1, offset: Offset(0, 10)),
              if (hover)
                const BoxShadow(color: Color(0x44FF3D9A), blurRadius: 26, offset: Offset(0, 10)),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(widget.icon, color: const Color(0xFF00E5FF), size: 30),
              const SizedBox(height: 10),
              Text(
                widget.title,
                style: const TextStyle(color: Color(0xFF11335A), fontSize: 20, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              Text(widget.subtitle, style: const TextStyle(color: Color(0xFF3D5F85), height: 1.4)),
            ],
          ),
        ),
      ),
    );
  }
}

class _BlogSection extends StatelessWidget {
  const _BlogSection({
    required this.copy,
    required this.posts,
    required this.onOpenPost,
  });

  final AppCopy copy;
  final Map<String, BlogPostData> posts;
  final ValueChanged<String> onOpenPost;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                copy.blogTitle,
                style: GoogleFonts.orbitron(
                  color: const Color(0xFF00E5FF),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                copy.blogListSubtitle,
                style: const TextStyle(color: Color(0xFF6A86AE)),
              ),
              const SizedBox(height: 16),
              for (final entry in posts.entries)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: const LinearGradient(colors: [Color(0xFFEAF3FF), Color(0xFFDCEAFF)]),
                    border: Border.all(color: const Color(0x554E6BA8)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.key,
                        style: const TextStyle(
                          color: Color(0xFF11335A),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        entry.value.headline,
                        style: const TextStyle(color: Color(0xFF244E79), fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        entry.value.highlights.first,
                        style: const TextStyle(color: Color(0xFF3D5F85), height: 1.45),
                      ),
                      const SizedBox(height: 14),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextButton.icon(
                          onPressed: () => onOpenPost(entry.key),
                          icon: const Icon(Icons.open_in_new, size: 18),
                          label: Text(copy.readPost),
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFF00A7D6),
                            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlogPage extends StatefulWidget {
  const BlogPage({
    super.key,
    required this.lang,
    required this.onLanguageChanged,
    required this.posts,
  });

  final AppLang lang;
  final ValueChanged<AppLang> onLanguageChanged;
  final Map<String, BlogPostData> posts;

  @override
  State<BlogPage> createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  void _openPost(String serviceTitle) {
    final post = widget.posts[serviceTitle];
    if (post == null) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => BlogPostPage(
          lang: widget.lang,
          onLanguageChanged: widget.onLanguageChanged,
          serviceTitle: serviceTitle,
          post: post,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 940;
    final copy = AppCopy(widget.lang);

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF4FF), Color(0xFFDCEBFF), Color(0xFFF4F8FF)],
          ),
        ),
        child: Column(
          children: [
            _TopNav(
              lang: widget.lang,
              onLanguageChanged: widget.onLanguageChanged,
              copy: copy,
              isMobile: isMobile,
              onHero: () => Navigator.of(context).pop(),
              onServices: () => Navigator.of(context).pop(),
              onTech: () => Navigator.of(context).pop(),
              onBlog: () {},
              onContact: () => Navigator.of(context).pop(),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1160),
                          child: Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF203E82), Color(0xFF2B67B8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(color: const Color(0x5500E5FF)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  copy.blogTitle,
                                  style: GoogleFonts.audiowide(
                                    color: Colors.white,
                                    fontSize: isMobile ? 32 : 44,
                                    height: 1.1,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  copy.blogHeroSubtitle,
                                  style: const TextStyle(color: Color(0xFFD4E3FF), fontSize: 16, height: 1.5),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    _BlogSection(copy: copy, posts: widget.posts, onOpenPost: _openPost),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogPostPage extends StatelessWidget {
  const BlogPostPage({
    super.key,
    required this.lang,
    required this.onLanguageChanged,
    required this.serviceTitle,
    required this.post,
  });

  final AppLang lang;
  final ValueChanged<AppLang> onLanguageChanged;
  final String serviceTitle;
  final BlogPostData post;

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.sizeOf(context).width < 940;
    final copy = AppCopy(lang);
    final paragraphs = post.body;

    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFEAF4FF), Color(0xFFDCEBFF), Color(0xFFF4F8FF)],
          ),
        ),
        child: Column(
          children: [
            _TopNav(
              lang: lang,
              onLanguageChanged: onLanguageChanged,
              copy: copy,
              isMobile: isMobile,
              onHero: () => Navigator.of(context).popUntil((route) => route.isFirst),
              onServices: () => Navigator.of(context).popUntil((route) => route.isFirst),
              onTech: () => Navigator.of(context).popUntil((route) => route.isFirst),
              onBlog: () => Navigator.of(context).pop(),
              onContact: () => Navigator.of(context).popUntil((route) => route.isFirst),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 28),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 920),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(Icons.arrow_back),
                            label: Text(copy.backToBlog),
                            style: TextButton.styleFrom(foregroundColor: const Color(0xFF1F5E95)),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(26),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              gradient: const LinearGradient(
                                colors: [Color(0xFF203E82), Color(0xFF2B67B8)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(color: const Color(0x5500E5FF)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.serviceTitle,
                                  style: const TextStyle(
                                    color: Color(0xFFD4E3FF),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  post.headline,
                                  style: GoogleFonts.audiowide(
                                    color: Colors.white,
                                    fontSize: isMobile ? 28 : 40,
                                    height: 1.12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              gradient: const LinearGradient(colors: [Color(0xFFF7FBFF), Color(0xFFEAF3FF)]),
                              border: Border.all(color: const Color(0x554E6BA8)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (final paragraph in paragraphs)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 16),
                                    child: Text(
                                      paragraph,
                                      style: const TextStyle(
                                        color: Color(0xFF274B73),
                                        fontSize: 16,
                                        height: 1.75,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 4),
                                Text(
                                  copy.keyPoints,
                                  style: GoogleFonts.orbitron(
                                    color: const Color(0xFF11335A),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                for (final item in post.highlights)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Text(
                                      '• $item',
                                      style: const TextStyle(
                                        color: Color(0xFF3D5F85),
                                        fontSize: 15,
                                        height: 1.6,
                                      ),
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(18),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: const Color(0xFFE4F4FF),
                                    border: Border.all(color: const Color(0x5500E5FF)),
                                  ),
                                  child: Text(
                                    copy.postClosing,
                                    style: const TextStyle(
                                      color: Color(0xFF1D486F),
                                      fontSize: 15,
                                      height: 1.6,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TechCarousel extends StatefulWidget {
  const _TechCarousel();

  @override
  State<_TechCarousel> createState() => _TechCarouselState();
}

class _TechCarouselState extends State<_TechCarousel> {
  static const tech = [
    ('Python', FontAwesomeIcons.python, Color(0xFF3776AB)),
    ('GitHub', FontAwesomeIcons.github, Color(0xFF181717)),
    ('CSS', FontAwesomeIcons.css3Alt, Color(0xFF1572B6)),
    ('WordPress', FontAwesomeIcons.wordpress, Color(0xFF21759B)),
    ('Android', FontAwesomeIcons.android, Color(0xFF3DDC84)),
    ('Apple iOS', FontAwesomeIcons.apple, Color(0xFF111111)),
    ('Windows', FontAwesomeIcons.windows, Color(0xFF0078D4)),
    ('Flutter', Icons.flutter_dash, Color(0xFF02569B)),
    ('Firebase', FontAwesomeIcons.fire, Color(0xFFFFCA28)),
    ('API REST', FontAwesomeIcons.code, Color(0xFF6C63FF)),
    ('Docker', FontAwesomeIcons.docker, Color(0xFF2496ED)),
    ('Linux', FontAwesomeIcons.linux, Color(0xFFFCC624)),
    ('AWS', FontAwesomeIcons.aws, Color(0xFFFF9900)),
    ('Node.js', FontAwesomeIcons.nodeJs, Color(0xFF339933)),
    ('PostgreSQL', Icons.storage, Color(0xFF336791)),
    ('MySQL', Icons.dns, Color(0xFF4479A1)),
    ('OpenAI', Icons.auto_awesome, Color(0xFF10A37F)),
    ('Git', FontAwesomeIcons.gitAlt, Color(0xFFF05032)),
    ('Figma', FontAwesomeIcons.figma, Color(0xFFF24E1E)),
    ('WhatsApp API', FontAwesomeIcons.whatsapp, Color(0xFF25D366)),
  ];

  late final ScrollController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _timer = Timer.periodic(const Duration(milliseconds: 16), (_) {
      if (!_controller.hasClients) return;
      if (!_controller.position.hasContentDimensions) return;
      final max = _controller.position.maxScrollExtent;
      if (max <= 0) return;
      final next = _controller.offset + 0.8;
      _controller.jumpTo(next >= max ? 0 : next);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final looped = [...tech, ...tech];
    return SizedBox(
      height: 42,
      child: ListView.separated(
        controller: _controller,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: looped.length,
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemBuilder: (context, index) => _TechTile(item: looped[index], width: 120),
      ),
    );
  }
}

class _TechTile extends StatelessWidget {
  const _TechTile({required this.item, required this.width});

  final (String, IconData, Color) item;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(colors: [Color(0xFFEAF3FF), Color(0xFFD6E9FF)]),
        border: Border.all(color: const Color(0x554E6BA8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(item.$2, color: item.$3, size: 14),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              item.$1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Color(0xFF173D66), fontWeight: FontWeight.w700, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({super.key, required this.copy, required this.onMailTap, required this.onWhatsTap});

  final AppCopy copy;
  final VoidCallback onMailTap;
  final VoidCallback onWhatsTap;

  void _showLegalDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: const Color(0xFF0D1733),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Color(0x5500E5FF)),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 640, maxHeight: 520),
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.orbitron(
                          color: const Color(0xFF00E5FF),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Color(0xFF79A1D8)),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const Divider(color: Color(0x3300E5FF), height: 24),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      content,
                      style: const TextStyle(
                        color: Color(0xFFD4E3FF),
                        fontSize: 14,
                        height: 1.7,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 8, 20, 28),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(colors: [Color(0xFF1A2F63), Color(0xFF232863)]),
        border: Border.all(color: const Color(0x5500E5FF)),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1160),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                copy.contactTitle,
                style: GoogleFonts.orbitron(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 14),
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ContactCard(
                    icon: Icons.mail_outline,
                    title: copy.businessEmailTitle,
                    value: 'contato@deploylabz.com',
                    onTap: onMailTap,
                  ),
                  _ContactCard(
                    icon: Icons.chat_bubble_outline,
                    title: 'WhatsApp',
                    value: '+351 960 344 095',
                    onTap: onWhatsTap,
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 4,
                runSpacing: 0,
                children: [
                  _LegalLink(label: copy.aboutUsLabel, onTap: () => _showLegalDialog(context, copy.aboutUsLabel, copy.aboutUsText)),
                  const Text('|', style: TextStyle(color: Color(0xFF79A1D8), fontSize: 12.5)),
                  _LegalLink(label: 'LGPD', onTap: () => _showLegalDialog(context, copy.lgpdDialogTitle, copy.lgpdText)),
                  const Text('|', style: TextStyle(color: Color(0xFF79A1D8), fontSize: 12.5)),
                  _LegalLink(label: copy.privacyLabel, onTap: () => _showLegalDialog(context, copy.privacyDialogTitle, copy.privacyText)),
                  const Text('|', style: TextStyle(color: Color(0xFF79A1D8), fontSize: 12.5)),
                  _LegalLink(label: copy.termsLabel, onTap: () => _showLegalDialog(context, copy.termsDialogTitle, copy.termsText)),
                  const Text('|', style: TextStyle(color: Color(0xFF79A1D8), fontSize: 12.5)),
                  _LegalLink(label: copy.cookiesLabel, onTap: () => _showLegalDialog(context, copy.cookiesDialogTitle, copy.cookiesText)),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                copy.rightsReserved,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF9EB2D9)),
              ),
              const SizedBox(height: 10),
              Text(
                copy.portugueseCompany,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFF79A1D8), fontSize: 13),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  const _ContactCard({required this.icon, required this.title, required this.value, required this.onTap});

  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool hover = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final cardWidth = math.min(340.0, math.max(0.0, width - 64));

    return MouseRegion(
      onEnter: (_) => setState(() => hover = true),
      onExit: (_) => setState(() => hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          transform: Matrix4.identity()..translateByDouble(0.0, hover ? -3.0 : 0.0, 0.0, 1.0),
          width: cardWidth,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: hover ? const Color(0x5521234D) : const Color(0x44141B33),
            border: Border.all(color: hover ? const Color(0xFF00E5FF) : const Color(0x553E5C99)),
            boxShadow: [
              if (hover)
                const BoxShadow(color: Color(0x5500E5FF), blurRadius: 20, offset: Offset(0, 8)),
            ],
          ),
          child: Row(
            children: [
              Icon(widget.icon, color: const Color(0xFF00E5FF)),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title, style: const TextStyle(color: Color(0xFFAAC9FF))),
                    Text(
                      widget.value,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CookieBanner extends StatelessWidget {
  const _CookieBanner({required this.copy, required this.onAccept, required this.onReject});

  final AppCopy copy;
  final VoidCallback onAccept;
  final VoidCallback onReject;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 1),
        duration: const Duration(milliseconds: 380),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) => Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * 28),
            child: child,
          ),
        ),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF0D1733),
            border: Border(top: BorderSide(color: const Color(0xFF00E5FF).withValues(alpha: 0.4), width: 1.2)),
            boxShadow: const [BoxShadow(color: Color(0x2200E5FF), blurRadius: 24, offset: Offset(0, -4))],
          ),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 16,
            runSpacing: 10,
            children: [
              Text(
                copy.cookieMessage,
                style: const TextStyle(color: Color(0xFFD4E3FF), fontSize: 13.5),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  TextButton(
                    onPressed: onReject,
                    style: TextButton.styleFrom(foregroundColor: const Color(0xFF79A1D8)),
                    child: Text(copy.cookieReject),
                  ),
                  ElevatedButton(
                    onPressed: onAccept,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E5FF),
                      foregroundColor: const Color(0xFF0D1733),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: Text(copy.cookieAccept, style: const TextStyle(fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ScanlineOverlay extends StatelessWidget {
  const _ScanlineOverlay();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _HoloGridOverlay extends StatelessWidget {
  const _HoloGridOverlay();

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink();
  }
}

class _LegalLink extends StatefulWidget {
  const _LegalLink({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;
  @override
  State<_LegalLink> createState() => _LegalLinkState();
}

class _LegalLinkState extends State<_LegalLink> {
  bool _hover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.label,
          style: TextStyle(
            color: _hover ? const Color(0xFF00E5FF) : const Color(0xFF79A1D8),
            fontSize: 12.5,
            decoration: _hover ? TextDecoration.underline : TextDecoration.none,
            decorationColor: const Color(0xFF00E5FF),
          ),
        ),
      ),
    );
  }
}

class _NeonGradientButton extends StatefulWidget {
  const _NeonGradientButton({
    required this.onTap,
    required this.icon,
    required this.label,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;

  @override
  State<_NeonGradientButton> createState() => _NeonGradientButtonState();
}

class _NeonGradientButtonState extends State<_NeonGradientButton> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 2100))
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final t = _controller.value;
        final pulse = 0.45 + 0.55 * math.sin(t * math.pi);
        return DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                Color.lerp(const Color(0xFF00E5FF), const Color(0xFF46F9FF), t)!,
                Color.lerp(const Color(0xFFFF3D9A), const Color(0xFFFF70B8), 1 - t)!,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color(0x8800E5FF).withValues(alpha: 0.25 + pulse * 0.45),
                blurRadius: 24,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: FilledButton.icon(
            onPressed: widget.onTap,
            icon: Icon(widget.icon),
            label: Text(widget.label),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
            ),
          ),
        );
      },
    );
  }
}

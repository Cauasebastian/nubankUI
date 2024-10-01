import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
          icon: const Icon(Icons.person_outline, color: Colors.white),
          onPressed: () {
            // Ação do ícone principal
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.visibility_outlined, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.question_mark_rounded, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white, // Fundo de todo o body como branco
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Seção: Conta
            _buildSectionHeader(
              title: 'Conta',
              onPressed: () {
                // Ação ao clicar na seta
              },
              icon: Icons.chevron_right,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Text(
                'R\$1000,00',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaçamento reduzido

            // Botões principais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.pix, 'Área Pix'), // Mantido conforme solicitado
                  _buildIconButton(Icons.money, 'Pagamentos'),
                  _buildIconButton(Icons.qr_code, 'QRCode'),
                  _buildIconButton(Icons.attach_money, 'Transferir'),
                ],
              ),
            ),
            const SizedBox(height: 20), // Espaçamento reduzido

            // Seção: Meus Cartões
            _buildCardSection(
              leadingIcon: Icons.credit_card,
              title: 'Meus Cartões',
              subtitle: '',
              onPressed: () {},
            ),
            const SizedBox(height: 20),

            // Seção: Guarde seu dinheiro em caixinhas
            _buildCardSection(
              leadingIcon: null,
              //diminua o tamanho desse ou me diga onde modificar
              title: 'Guarde seu dinheiro em caixinhas',
              subtitle: 'Acessando a área de planejamento',
              titleColor: const Color(0xFF8A05BE),
              onPressed: () {},
            ),
            const SizedBox(height: 20),

            // Seção: Cartão de Crédito
            _buildDetailedSection(
              title: 'Cartão de Crédito',
              amount: 'R\$2.123,39',
              dueDate: 'Vencimento dia 15',
              buttonLabel: 'Renegociar',
              onPressed: () {},
            ),
            const Divider(height: 1, color: Colors.black12),

            // Seção: Empréstimo
            _buildDetailedSection(
              title: 'Empréstimo',
              amount: 'Tudo certo! Você está em dia',
              dueDate: '',
              buttonLabel: '',
              onPressed: null,
              isSmallAmount: true,
            ),
            const Divider(height: 1, color: Colors.black12),
            const SizedBox(height: 20),

            // Seção: Descubra Mais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: _buildDiscoverMore(context),
            ),
            const SizedBox(height: 20), // Espaço no final
          ],
        ),
      ),
    );
  }

  // Método para construir o cabeçalho das seções com título e seta
  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onPressed,
    required IconData icon,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Padding ajustado
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          IconButton(
            icon: Icon(icon, color: Colors.black),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  // Método para construir os botões principais
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple[100],
          radius: 28,
          child: Icon(icon, color: Colors.deepPurple, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Método para construir as seções de cartão simples
  Widget _buildCardSection({
    IconData? leadingIcon,
    required String title,
    required String subtitle,
    Color titleColor = Colors.black,
    required VoidCallback onPressed,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListTile(
            leading: leadingIcon != null ? Icon(leadingIcon) : null,
            title: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
            subtitle: subtitle.isNotEmpty
                ? Text(
              subtitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            )
                : null,
            onTap: onPressed,
          ),
        ),
      ),
    );
  }

  // Método para construir as seções detalhadas (Cartão de Crédito e Empréstimo)
  Widget _buildDetailedSection({
    required String title,
    required String amount,
    required String dueDate,
    required String buttonLabel,
    required VoidCallback? onPressed,
    bool isSmallAmount = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        width: double.infinity,
        color: Colors.white, // Fundo branco
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Linha superior com título e seta
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right, color: Colors.black),
                  onPressed: onPressed,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              amount,
              style: TextStyle(
                fontSize: isSmallAmount ? 18 : 24, // Fonte ajustada
                fontWeight: FontWeight.bold,
              ),
            ),
            if (dueDate.isNotEmpty) ...[
              const SizedBox(height: 5),
              Text(
                dueDate,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            ],
            if (buttonLabel.isNotEmpty) ...[
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple[100],
                ),
                child: Text(
                  buttonLabel,
                  style: const TextStyle(color: Colors.deepPurple),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  // Método para construir a seção "Descubra Mais"
  Widget _buildDiscoverMore(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white, // Fundo branco
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Descubra Mais',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.deepPurple[50],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Certifique-se de que a imagem está na pasta correta
                  Image.asset(
                    'lib/assets/seguroVida.png',
                    fit: BoxFit.cover,
                    height: 150, // Defina uma altura adequada
                    width: double.infinity,
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Seguro de Vida',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Cuide bem de quem você ama de um jeito simples',
                    style: TextStyle(fontSize: 18, color: Colors.black54),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      // Ação ao clicar em "Conhecer"
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    child: const Text(
                      'Conhecer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Conta e saldo
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Conta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right, color: Colors.black),
                    onPressed: () {
                      // Ação ao clicar no ícone de seta
                    },
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'R\$1000,00',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              // Botões principais
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.pix, 'Área Pix'),
                  _buildIconButton(Icons.money, 'Pagamentos'),
                  _buildIconButton(Icons.qr_code, 'QRCode'),
                  _buildIconButton(Icons.attach_money, 'Transferir'),
                ],
              ),
              const SizedBox(height: 30),
              // Card Meus Cartões
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: const Icon(Icons.credit_card),
                    title: const Text(
                      'Meus Cartões',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Card Guarde seu dinheiro
              Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListTile(
                    leading: const Icon(Icons.savings),
                    title: const Text(
                      'Guarde seu dinheiro em caixinhas',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8A05BE),
                      ),
                    ),
                    subtitle: const Text(
                      'Acessando a área de planejamento',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black54,
                      ),
                    ),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Seção de Cartão de Crédito
              _buildSection(
                title: 'Cartão de Crédito',
                amount: 'R\$2.123,39',
                dueDate: 'Vencimento dia 15',
                buttonLabel: 'Renegociar',
                onPressed: () {},
              ),
              const SizedBox(height: 15),
              // Seção de Empréstimo
              _buildSection(
                title: 'Empréstimo',
                amount: 'Tudo certo! Você está em dia',
                dueDate: '',
                buttonLabel: '',
                onPressed: null,
              ),
              const SizedBox(height: 30),
              // Descubra Mais
              _buildDiscoverMore(context),
            ],
          ),
        ),
      ),
    );
  }

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

  Widget _buildSection({
    required String title,
    required String amount,
    required String dueDate,
    required String buttonLabel,
    required void Function()? onPressed,
  }) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            if (dueDate.isNotEmpty)
              Text(
                dueDate,
                style: const TextStyle(fontSize: 18, color: Colors.black54),
              ),
            if (buttonLabel.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purple[100],
                  ),
                  child: Text(
                    buttonLabel,
                    style: const TextStyle(color: Colors.deepPurple),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoverMore(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
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
                    Image.asset(
                      'lib/assets/seguroVida.png', // Substitua com a imagem correta
                      fit: BoxFit.cover,
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
      ),
    );
  }
}

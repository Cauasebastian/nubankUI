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
        leading: IconButton(
          icon: const Icon(Icons.account_circle),
          onPressed: () {
            // Ação do ícone principal
          },
        ),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.mark_email_read_outlined),
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
              const Text(
                'Nome da Conta',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                'R\$1000,00',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildIconButton(Icons.pix, 'Área Pix'),
                  _buildIconButton(Icons.payments, 'Pagamentos'),
                  _buildIconButton(Icons.qr_code, 'QRCode'),
                  _buildIconButton(Icons.send, 'Transferir'),
                ],
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text('Meus Cartões'),
                  onTap: () {},
                ),
              ),
              const SizedBox(height: 16),
              Card(
                elevation: 2,
                child: ListTile(
                  leading: const Icon(Icons.credit_card),
                  title: const Text('Guarde seu dinheiro em caixinhas'),
                  subtitle: const Text('Acessando a área de planejamento'),
                  onTap: () {
                    print('Item tapped');
                  },
                ),
              ),
              const SizedBox(height: 16),
              // Esse container agora vai ocupar toda a largura da tela
              Container(
                width: double.infinity, // Define a largura total da tela
                child: _buildSection(
                  title: 'Cartão de Crédito',
                  amount: 'R\$2.123,39',
                  dueDate: 'Vencimento dia 15',
                  buttonLabel: 'Renegociar',
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 16),
              _buildSection(
                title: 'Empréstimo',
                amount: 'Tudo certo! Você está em dia',
                dueDate: '',
                buttonLabel: '',
                onPressed: null,
              ),
              const SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, -1),
                      blurRadius: 4,
                    ),
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 1),
                      blurRadius: 4,
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

  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.deepPurple[100],
          radius: 28,
          child: Icon(icon, color: Colors.deepPurple, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 14)),
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
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              amount,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              dueDate,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            if (buttonLabel.isNotEmpty)
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
        ),
      ),
    );
  }
}

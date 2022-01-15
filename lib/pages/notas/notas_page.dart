import 'package:flutter/material.dart';

import 'notas_controller.dart';

class NotasPage extends StatefulWidget {
  const NotasPage({Key? key}) : super(key: key);

  @override
  State<NotasPage> createState() => _NotasPageState();
}

class _NotasPageState extends State<NotasPage> {
  late final NotasController controller;

  @override
  void initState() {
    super.initState();

    controller = NotasController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await controller.fetch();
        },
      ),
      body: ValueListenableBuilder<bool>(
        valueListenable: controller.loading,
        builder: (context, loading, child) => loading == true
            ? const Center(child: CircularProgressIndicator())
            : ValueListenableBuilder<List>(
                valueListenable: controller.notas,
                builder: (context, notas, child) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: notas.isEmpty
                      ? const Center(
                          child: Text(
                            'Nenhuma nota encontrada.',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        )
                      : ListView.separated(
                          itemCount: notas.length,
                          separatorBuilder: (context, index) => const Divider(height: 24),
                          itemBuilder: (context, index) => Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  notas[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).textTheme.bodyText1!.color,
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}

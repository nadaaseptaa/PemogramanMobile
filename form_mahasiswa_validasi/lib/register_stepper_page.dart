import 'package:flutter/material.dart';

class RegisterStepperPage extends StatefulWidget {
  const RegisterStepperPage({super.key});

  @override
  State<RegisterStepperPage> createState() => _RegisterStepperPageState();
}

class _RegisterStepperPageState extends State<RegisterStepperPage> {
  int currentStep = 0;

  final formKey1 = GlobalKey<FormState>();
  final formKey2 = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String? selectedJurusan;
  double semester = 1;

  List<String> hobi = [];
  bool agree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text(
          "Form Mahasiswa",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),

      body: Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(primary: Colors.pink.shade400),
        ),
        child: Stepper(
          currentStep: currentStep,
          type: StepperType.vertical,
          controlsBuilder: (context, details) {
            return Row(
              children: [
                ElevatedButton(
                  onPressed: details.onStepContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(currentStep == 2 ? "Submit" : "Next"),
                ),
                const SizedBox(width: 12),
                if (currentStep != 0)
                  OutlinedButton(
                    onPressed: details.onStepCancel,
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.pink),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
              ],
            );
          },

          onStepContinue: () {
            if (currentStep == 0) {
              if (formKey1.currentState!.validate()) {
                setState(() => currentStep++);
              }
            } else if (currentStep == 1) {
              if (formKey2.currentState!.validate()) {
                setState(() => currentStep++);
              }
            } else if (currentStep == 2) {
              if (hobi.isEmpty) {
                _showSnack("Pilih minimal satu hobi!");
                return;
              }
              if (!agree) {
                _showSnack("Setujui syarat & ketentuan terlebih dahulu!");
                return;
              }

              _showSnack("Registrasi Berhasil!");

              debugPrint("=== DATA MAHASISWA ===");
              debugPrint("Nama: ${nameController.text}");
              debugPrint("Email: ${emailController.text}");
              debugPrint("HP: ${phoneController.text}");
              debugPrint("Jurusan: $selectedJurusan");
              debugPrint("Semester: $semester");
              debugPrint("Hobi: $hobi");
              debugPrint("Persetujuan: $agree");
            }
          },

          onStepCancel: () {
            if (currentStep > 0) setState(() => currentStep--);
          },

          steps: _buildSteps(),
        ),
      ),
    );
  }

  List<Step> _buildSteps() {
    return [
      Step(
        title: _pinkTitle("Data Pribadi"),
        isActive: currentStep >= 0,
        content: Form(
          key: formKey1,
          child: Column(
            children: [
              _pinkTextField(
                controller: nameController,
                label: "Nama",
                validator: (v) => v!.isEmpty ? "Nama wajib diisi" : null,
              ),
              const SizedBox(height: 10),
              _pinkTextField(
                controller: emailController,
                label: "Email",
                validator: (v) {
                  if (v!.isEmpty) return "Email wajib diisi";
                  if (!v.contains('@')) return "Email tidak valid";
                  return null;
                },
              ),
              const SizedBox(height: 10),
              _pinkTextField(
                controller: phoneController,
                label: "Nomor HP",
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v!.isEmpty) return "Nomor HP wajib diisi";
                  if (double.tryParse(v) == null) return "Harus angka";
                  return null;
                },
              ),
            ],
          ),
        ),
      ),

      Step(
        title: _pinkTitle("Data Akademik"),
        isActive: currentStep >= 1,
        content: Form(
          key: formKey2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButtonFormField(
                decoration: _pinkDropdownDecoration("Jurusan"),
                value: selectedJurusan,
                items: const [
                  DropdownMenuItem(
                    value: "Informatika",
                    child: Text("Informatika"),
                  ),
                  DropdownMenuItem(
                    value: "Sistem Informasi",
                    child: Text("Sistem Informasi"),
                  ),
                  DropdownMenuItem(
                    value: "Teknik Komputer",
                    child: Text("Teknik Komputer"),
                  ),
                  DropdownMenuItem(
                    value: "Sains Data",
                    child: Text("Sains Data"),
                  ),
                ],
                onChanged: (value) => setState(() => selectedJurusan = value),
                validator: (value) => value == null ? "Pilih jurusan" : null,
              ),

              const SizedBox(height: 15),
              Text("Semester", style: _pinkLabelStyle()),

              Slider(
                min: 1,
                max: 8,
                activeColor: Colors.pink,
                value: semester,
                divisions: 7,
                label: semester.toString(),
                onChanged: (v) => setState(() => semester = v),
              ),
            ],
          ),
        ),
      ),

      Step(
        title: _pinkTitle("Preferensi"),
        isActive: currentStep >= 2,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hobi", style: _pinkLabelStyle()),

            _pinkCheckbox("Membaca"),
            _pinkCheckbox("Olahraga"),
            _pinkCheckbox("Menulis"),
            _pinkCheckbox("Gaming"),

            const SizedBox(height: 10),

            SwitchListTile(
              title: Text(
                "Saya setuju dengan syarat & ketentuan",
                style: TextStyle(color: Colors.pink.shade700),
              ),
              activeColor: Colors.pink,
              value: agree,
              onChanged: (value) => setState(() => agree = value),
            ),
          ],
        ),
      ),
    ];
  }

  // ---------- COMPONENTS PINK ----------

  InputDecoration _pinkInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.pink.shade700),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink.shade400),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink.shade200),
      ),
    );
  }

  Widget _pinkTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      decoration: _pinkInputDecoration(label),
    );
  }

  Widget _pinkCheckbox(String label) {
    return CheckboxListTile(
      title: Text(label, style: TextStyle(color: Colors.pink.shade700)),
      activeColor: Colors.pink,
      value: hobi.contains(label),
      onChanged: (value) {
        setState(() {
          value! ? hobi.add(label) : hobi.remove(label);
        });
      },
    );
  }

  Text _pinkTitle(String text) => Text(
    text,
    style: TextStyle(
      color: Colors.pink.shade700,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    ),
  );

  TextStyle _pinkLabelStyle() => TextStyle(
    color: Colors.pink.shade800,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  InputDecoration _pinkDropdownDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.pink.shade700),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.pink.shade400),
      ),
    );
  }

  void _showSnack(String msg) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.pink));
  }
}

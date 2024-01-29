class AdminModel {
  final String name;
  final String email;
  final String uid;
  final String phone;
  final String? selectedUserType;

  AdminModel({
    required this.name,
    required this.email,
    required this.uid,
    required this.phone,
    this.selectedUserType,
  });
}

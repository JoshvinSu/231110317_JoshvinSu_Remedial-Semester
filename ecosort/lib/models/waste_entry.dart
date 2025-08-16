class WasteEntry {
  final String id;
  final String wasteType; // 'Organik', 'Plastik', 'Kertas'
  final String description;
  final DateTime date;

  WasteEntry({
    required this.id,
    required this.wasteType,
    required this.description,
    required this.date,
  });
}

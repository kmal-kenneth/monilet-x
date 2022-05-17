class Cpu {
  double used = 0;
  int frequency = 0;
  String name = '';
  int coresCount = 0;
  List<Cpu> cores = [];

  DateTime timeOfLastRefresh = DateTime.now();
  final List<CpuRecord> _records = [];

  get records => _records.toList();

  addRecord(CpuRecord record) {
    _records.add(record);
    if (_records.length > 60) {
      _records.removeAt(0);
    }
  }
}

class CpuRecord {
  CpuRecord(this.x, this.y);
  final DateTime x;
  final double y;
}

String buildMemoryLabel(int memory) {
  const int decimals = 1;
  const int mb = 1000;
  const int gb = mb * 1000;
  const int tb = gb * 1000;
  const int pb = tb * 1000;
  const int eb = pb * 1000;

  if (memory >= eb) {
    return "${(memory / eb).toStringAsFixed(decimals)} EB";
  } else if (memory >= pb) {
    return "${(memory / pb).toStringAsFixed(decimals)} PB";
  } else if (memory >= tb) {
    return "${(memory / tb).toStringAsFixed(decimals)} TB";
  } else if (memory >= gb) {
    return "${(memory / gb).toStringAsFixed(decimals)} GB";
  } else if (memory >= mb) {
    return "${(memory / mb).toStringAsFixed(decimals)} MB";
  } else {
    return "$memory KB";
  }
}

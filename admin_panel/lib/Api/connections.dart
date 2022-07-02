class Connection {
  static const String _host = "http://167.235.74.243:5000";

  static const String dashboard = "$_host/web/dashboardproduct";
  static const String dashboardvender = "$_host/web/dashboardvenders";

  static const String getweeksales = "$_host/api/getweekbar";
  static const String getdaysales = "$_host/api/getdaybar";
  static const String getmonthsales = "$_host/api/getmonthbar";
  static const String getyearsales = "$_host/api//getyearbar";
  static const String createproduct = "$_host/web/setproduct";
  static const String uplaodpic = "$_host/web/uploadpic";
  static const String acceptvender = "$_host/venders/accept";
  static const String rejectvender = "$_host/venders/reject";
  static const String getapprovedvender = "$_host/venders/getapprovenders";
  static const String getpendingvender = "$_host/venders/getverifvender";
}

// ignore_for_file: file_names, camel_case_types

class con {
  static const String _host = "http://167.235.74.243:5000";

  static const String loginapi = "$_host/admin/adminlogin";
  static const String registerapi = "$_host/admin/adminregister";
  static const String uploadDocument = "$_host/admin/adminuploadDocument";
  static const String uploadDocumentDetails =
      "$_host/admin/adminupdatedocuments";
//home
  static const String productcountapi = "$_host/api/dailystock";
//get bar sales
  static const String getweeksales = "$_host/api/getweekbar";
  static const String getdaysales = "$_host/api/getdaybar";
  static const String getmonthsales = "$_host/api/getmonthbar";
  static const String getyearsales = "$_host/api//getyearbar";

  static const String getproduct = "$_host/product/getproduct";
  static const String sellproduct = "$_host/sell/sellproduct";

  static const String getvenderorders = "$_host/venders/getvendersorders";
  static const String sendcomplaints = "$_host/complaints/sendcomplaint";

  //getsubadmin
  static const String getsubadmin = "$_host/admin/getactivesubadmin";
}

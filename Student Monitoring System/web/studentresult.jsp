<%-- 
    Document   : studentresult
    Created on : Aug 4, 2018, 4:13:49 PM
    Author     : MOBASSIR
--%>
<%-- 
    Document   : index
    Created on : Jul 29, 2018, 9:32:42 PM
    Author     : MOBASSIR
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "smsswedepartment";
String userid = "root";
String password = "root";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>
       <style>
       body{height:100%;
   width:100%;
   background-image:url(result.jpg);/*your background image*/  
   background-repeat:no-repeat;/*we want to have one single image not a repeated one*/  
   background-size:cover;/*this sets the image to fullscreen covering the whole screen*/  
   /*css hack for ie*/     
   filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='.image.jpg',sizingMethod='scale');
   -ms-filter:"progid:DXImageTransform.Microsoft.AlphaImageLoader(src='image.jpg',sizingMethod='scale')";
}
        </style>

<h1 style="background-color:powderblue;color:green;">Getting Students RESULT  From Database : </h1>
<table border="1">
<tr>
<td style="background-color:powderblue;color:red;">Student Name </td>
<td style="background-color:powderblue;color:red;">Student Id  </td>
<td style="background-color:powderblue;color:red;">Student CGPA</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from studentResult";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("cgpa") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>
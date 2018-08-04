<%-- 
    Document   : index
    Created on : Jul 29, 2018, 9:32:42 PM
    Author     : MOBASSIR
--%>
<%@page import = "java.sql.*" %>
<%@page import = "java.util.Date" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Monitoring System</title>
    </head>
    <body>
           <style>
        body{
            /* The image used */
    background-image: url("sweslogan.jpg");

    /* Full height */
    height: 90%;

    /* Center and scale the image nicely */
    background-position: center bottom;
    background-repeat: no-repeat;
    background-size: cover;
        }
        </style>
        <h1 style="color:green;">Student Monitoring System for Guardians</h1>
        <%!
            public class Actor {

                String URL = "jdbc:mysql://localhost:3306/smsSWEDepartment";
                String USERNAME = "root";
                String PASSWORD = "root";

                Connection connection;
                PreparedStatement insertActors = null;

                public Actor() {

                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertActors = connection.prepareStatement(
                                "INSERT INTO guardians (first_name,last_name,id,guardianstype)"
                                + "VALUES (?, ?, ?, ?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String first, String last, String id, String guardianstype) {
      if((first == null ) || (last == null) || (id == null) || (guardianstype == null)) return 0;
                    int result = 0;
                    try {
    
                        insertActors.setString(1, first);
                        insertActors.setString(2, last);
                        insertActors.setString(3, id);
                        insertActors.setString(4, guardianstype);
                        result = insertActors.executeUpdate();
                    
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    return result;

                }

            }
        %>

        <%
            int result = 0;

            if (request.getParameter("submit") != null) {
                String firstName = ""; 
                String lastName = "";
                String id = "";
                String guardianstype = "";

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");

                }
                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }
                if (request.getParameter("guardianstype") != null) {
                    guardianstype = request.getParameter("guardianstype");
                }
                if (request.getParameter("id") != null) {
                    id = request.getParameter("id");
                }
               
                Actor actor = new Actor();
                
               
                result = actor.setActors(firstName, lastName, id, guardianstype);
                
            }
        %>


        <form name="myForm" action="index.jsp" method="POST">
            <h2 style="color:red;"> Registration Form : </h2>
            <table border="0">

                <tbody>
                    <tr>
                        <td style="color:red;">Guardians First Name : </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td style="color:red;">Guardians Last Name : </td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>student ID of the Guardians Child : </td>
                        <td><input type="text" name="id" value="" size="50" /></td>
                    </tr>
                </tbody>
                <p style="color:green;"> Guardians Type : </p>
            <select name="guardianstype">
                <option>Father / Mother</option>
                <option>Local Guardian</option>
            </select>
                 <p style="background-color:powderblue;color:green;"> Guardians Relation With The Student? : </p>
                  <input type="checkbox" name="relation" value="father" checked="checked"> Father
                 <input type="checkbox" name="relation" value="mother">Mother
                 <input type="checkbox" name="relation" value="brother">Brother
                 <input type="checkbox" name="relation" value="sister">Sister
                 <input type="checkbox" name="relation" value="local">Local
            </table>
            
            <input type="hidden" name="hidden" value="<%= result%>" />

            <input type="reset" value="clear" name="clear" />
            <input type="submit" value="submit" name="submit" />
        </form>
            <h3 style="background-color:powderblue;color:red;"> Select Option Below : </h3> 
             <form name="myForm1" action="index1.jsp" method="POST">
                
            <input type="submit" value="LOGIN" name="LOGIN" />
        </form>
            
            <form name="myForm2" action="sweoffice.jsp" method="POST">
                
            <input type="submit" value="SWEOFFICE" name="SWE OFFICE" />
        </form>
             <form name="myForm3" action="studentresult.jsp" method="POST">
                
            <input type="submit" value="STUDENTS RESULT" name="STUDENTS RESULT" />
        </form>
            <form name="myForm3" action="studentAttendance.jsp" method="POST">
        
            <input type="submit" value="studentAttendance" name="student Attendance" />
            </form>
            <form name="myForm3" action="regCourse.jsp" method="POST">
             
            <input type="submit" value="regCourse" name="Reg Course" />
            </form>
            <form name="myForm3" action="advisors.jsp" method="POST"  >
             
            <input type="submit" value="advisors" name="advisors"/>
            </form>
            
    </body> 
        
    
      
</html>

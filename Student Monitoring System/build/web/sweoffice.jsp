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
        <title>SWE OFFICE</title>
    </head>
    <body>
         <style>
        body{
            /* The image used */
    background-image: url("University-of-Melbourne.jpg");

    /* Full height */
    height: 100%;

    /* Center and scale the image nicely */
    background-position: center;
    background-repeat: no-repeat;
    background-size: cover;
        }
        </style>
        <h1 style="background-color:powderblue;">>>>>>>>>>>>>>>>>>>>SWE OFFICE<<<<<<<<<<<<<<<<<<<<</h1>
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
                                "INSERT INTO sweoffice (student_advisor)"
                                + "VALUES (?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String first) {

                    int result = 0;
                    try {
                        insertActors.setString(1, first);     
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

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");

                }
                Actor actor = new Actor();
                if((firstName != null ))
                result = actor.setActors(firstName);
                
            }
        %>


        <form name="myForm" action="sweoffice.jsp" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td style="background-color:powderblue;" style="color:white;">Students Advisors Name : </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    
                </tbody>
            </table>

            <input type="hidden" name="hidden" value="<%= result%>" />

            <input type="reset" value="clear" name="clear" />
            <input type="submit" value="submit" name="submit" />
        </form>
        
    </body>
      
</html>

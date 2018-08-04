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
        <title>LOGIN FORM</title>
    </head>
    <body>
           <style>
        body{
            /* The image used */
    background-image: url("diu.jpg");

    /* Full height */
    height: 100%;

    /* Center and scale the image nicely */
    background-position: right bottom;
    background-repeat: no-repeat;
    background-size: cover;
        }
        </style>
        <h1>LOGIN FORM FOR GUARDIAN</h1>
        <%!
            public class Actor {

                String URL = "jdbc:mysql://localhost:3306/test";
                String USERNAME = "root";
                String PASSWORD = "root";

                Connection connection;
                PreparedStatement insertActors = null;

                public Actor() {

                    try {

                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertActors = connection.prepareStatement(
                                "INSERT INTO actor (first_name,last_name,last_update)"
                                + "VALUES (?, ?, ?)");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }

                public int setActors(String first, String last, Timestamp timestamp) {

                    int result = 0;
                    try {
                        insertActors.setString(1, first);
                        insertActors.setString(2, last);
                        insertActors.setTimestamp(3, timestamp);
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

                if (request.getParameter("first") != null) {
                    firstName = request.getParameter("first");

                }
                if (request.getParameter("last") != null) {
                    lastName = request.getParameter("last");
                }

                Date date = new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());
                Actor actor = new Actor();
                if((firstName != null ) || (lastName != null) || (timeStamp != null))
                result = actor.setActors(firstName, lastName, timeStamp);
                
            }
        %>


        <form name="myForm" action="index1.jsp" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td>First Name : </td>
                        <td><input type="text" name="first" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Last Name : </td>
                        <td><input type="text" name="last" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>

            <input type="hidden" name="hidden" value="<%= result%>" />

            <input type="reset" value="clear" name="clear" />
            <input type="submit" value="submit" name="submit" />
        </form>
        
    </body>
      
</html>

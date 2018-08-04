package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.Date;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


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
        
  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
 Class.forName("com.mysql.jdbc.Driver"); 
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<html>\n");
      out.write(" \n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Student Monitoring System</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("           <style>\n");
      out.write("        body{\n");
      out.write("            /* The image used */\n");
      out.write("    background-image: url(\"sweslogan.jpg\");\n");
      out.write("\n");
      out.write("    /* Full height */\n");
      out.write("    height: 90%;\n");
      out.write("\n");
      out.write("    /* Center and scale the image nicely */\n");
      out.write("    background-position: center bottom;\n");
      out.write("    background-repeat: no-repeat;\n");
      out.write("    background-size: cover;\n");
      out.write("        }\n");
      out.write("        </style>\n");
      out.write("        <h1 style=\"color:green;\">Student Monitoring System for Guardians</h1>\n");
      out.write("        ");
      out.write("\n");
      out.write("\n");
      out.write("        ");

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
        
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("        <form name=\"myForm\" action=\"index.jsp\" method=\"POST\">\n");
      out.write("            <h2 style=\"color:red;\"> Registration Form : </h2>\n");
      out.write("            <table border=\"0\">\n");
      out.write("\n");
      out.write("                <tbody>\n");
      out.write("                    <tr>\n");
      out.write("                        <td style=\"color:red;\">Guardians First Name : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"first\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td style=\"color:red;\">Guardians Last Name : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"last\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                    <tr>\n");
      out.write("                        <td>student ID of the Guardians Child : </td>\n");
      out.write("                        <td><input type=\"text\" name=\"id\" value=\"\" size=\"50\" /></td>\n");
      out.write("                    </tr>\n");
      out.write("                </tbody>\n");
      out.write("                <p style=\"color:green;\"> Guardians Type : </p>\n");
      out.write("            <select name=\"guardianstype\">\n");
      out.write("                <option>Father / Mother</option>\n");
      out.write("                <option>Local Guardian</option>\n");
      out.write("            </select>\n");
      out.write("                 <p style=\"background-color:powderblue;color:green;\"> Guardians Relation With The Student? : </p>\n");
      out.write("                  <input type=\"checkbox\" name=\"relation\" value=\"father\" checked=\"checked\"> Father\n");
      out.write("                 <input type=\"checkbox\" name=\"relation\" value=\"mother\">Mother\n");
      out.write("                 <input type=\"checkbox\" name=\"relation\" value=\"brother\">Brother\n");
      out.write("                 <input type=\"checkbox\" name=\"relation\" value=\"sister\">Sister\n");
      out.write("                 <input type=\"checkbox\" name=\"relation\" value=\"local\">Local\n");
      out.write("            </table>\n");
      out.write("            \n");
      out.write("            <input type=\"hidden\" name=\"hidden\" value=\"");
      out.print( result);
      out.write("\" />\n");
      out.write("\n");
      out.write("            <input type=\"reset\" value=\"clear\" name=\"clear\" />\n");
      out.write("            <input type=\"submit\" value=\"submit\" name=\"submit\" />\n");
      out.write("        </form>\n");
      out.write("            <h3 style=\"background-color:powderblue;color:red;\"> Select Option Below : </h3> \n");
      out.write("             <form name=\"myForm1\" action=\"index1.jsp\" method=\"POST\">\n");
      out.write("                \n");
      out.write("            <input type=\"submit\" value=\"LOGIN\" name=\"LOGIN\" />\n");
      out.write("        </form>\n");
      out.write("            \n");
      out.write("            <form name=\"myForm2\" action=\"sweoffice.jsp\" method=\"POST\">\n");
      out.write("                \n");
      out.write("            <input type=\"submit\" value=\"SWEOFFICE\" name=\"SWE OFFICE\" />\n");
      out.write("        </form>\n");
      out.write("             <form name=\"myForm3\" action=\"studentresult.jsp\" method=\"POST\">\n");
      out.write("                \n");
      out.write("            <input type=\"submit\" value=\"STUDENTS RESULT\" name=\"STUDENTS RESULT\" />\n");
      out.write("        </form>\n");
      out.write("            <form name=\"myForm3\" action=\"studentAttendance.jsp\" method=\"POST\">\n");
      out.write("        \n");
      out.write("            <input type=\"submit\" value=\"studentAttendance\" name=\"student Attendance\" />\n");
      out.write("            </form>\n");
      out.write("            <form name=\"myForm3\" action=\"regCourse.jsp\" method=\"POST\">\n");
      out.write("             \n");
      out.write("            <input type=\"submit\" value=\"regCourse\" name=\"Reg Course\" />\n");
      out.write("            </form>\n");
      out.write("            <form name=\"myForm3\" action=\"advisors.jsp\" method=\"POST\"  >\n");
      out.write("             \n");
      out.write("            <input type=\"submit\" value=\"advisors\" name=\"advisors\"/>\n");
      out.write("            </form>\n");
      out.write("            \n");
      out.write("    </body> \n");
      out.write("        \n");
      out.write("    \n");
      out.write("      \n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}

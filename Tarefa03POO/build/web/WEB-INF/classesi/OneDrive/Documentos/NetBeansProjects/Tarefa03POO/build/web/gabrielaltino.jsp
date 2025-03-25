<%-- 
    Document   : gabrielaltino
    Created on : 25 de mar. de 2025, 06:53:42
    Author     : gabri
--%>
<!DOCTYPE html>
<%@ page import="java.util.Calendar" %>
<%@ page contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <title>Calendário</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Calendário</h2>
    <%
        String yearParam = request.getParameter("year");
        String monthParam = request.getParameter("month");
        
        int year = (yearParam != null) ? Integer.parseInt(yearParam) : Calendar.getInstance().get(Calendar.YEAR);
        int month = (monthParam != null) ? Integer.parseInt(monthParam) - 1 : Calendar.getInstance().get(Calendar.MONTH);
        
        Calendar calendar = Calendar.getInstance();
        calendar.set(year, month, 1);
        
        int firstDayOfWeek = calendar.get(Calendar.DAY_OF_WEEK);
        int daysInMonth = calendar.getActualMaximum(Calendar.DAY_OF_MONTH);
        String[] weekDays = {"Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"};
    %>
    
    <h3><%= month + 1 %> / <%= year %></h3>
    <table>
        <tr>
            <% for (String day : weekDays) { %>
                <th><%= day %></th>
            <% } %>
        </tr>
        <tr>
            <% 
                int dayCounter = 1;
                for (int i = 1; i < firstDayOfWeek; i++) {
                    out.print("<td></td>");
                }
                for (int i = firstDayOfWeek; i <= 7; i++) {
                    out.print("<td>" + dayCounter + "</td>");
                    dayCounter++;
                }
            %>
        </tr>
        <%
            while (dayCounter <= daysInMonth) {
                out.print("<tr>");
                for (int i = 1; i <= 7 && dayCounter <= daysInMonth; i++) {
                    out.print("<td>" + dayCounter + "</td>");
                    dayCounter++;
                }
                out.print("</tr>");
            }
        %>
    </table>
</body>
</html>


<%-- 
    Document   : juros_compostos
    Created on : 1 de abr. de 2025, 01:52:48
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="WEB-INF/jspf/menu.jspf" %>
<html>
<head>
    <title>Juros Compostos</title>
</head>
<body>
    <h2>Cálculo de Juros Compostos</h2>
    <form method="post">
        Montante Inicial: <input type="number" name="capital" step="0.01"><br>
        Taxa de Juros (%): <input type="number" name="taxa" step="0.01"><br>
        Tempo (meses): <input type="number" name="tempo"><br>
        <input type="submit" value="Calcular">
    </form>
    <% 
        if(request.getMethod().equals("POST")) {
            double capital = Double.parseDouble(request.getParameter("capital"));
            double taxa = Double.parseDouble(request.getParameter("taxa")) / 100;
            int tempo = Integer.parseInt(request.getParameter("tempo"));
    %>
    <h3>Resultados:</h3>
    <table border="1">
        <tr><th>Mês</th><th>Valor Acumulado</th></tr>
        <% for(int i = 1; i <= tempo; i++) { %>
        <tr>
            <td><%= i %></td>
            <td><%= capital * Math.pow((1 + taxa), i) %></td>
        </tr>
        <% } %>
    </table>
    <% } %>
</body>
</html>


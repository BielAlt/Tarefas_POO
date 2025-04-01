<%-- 
    Document   : juros_simples.jsp
    Created on : 1 de abr. de 2025, 01:51:47
    Author     : gabri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="WEB-INF/jspf/menu.jspf" %>
<html>
<head>
    <title>Juros Simples</title>
</head>
<body>
    <h2>Cálculo de Juros Simples</h2>
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
            double montante = capital + (capital * taxa * tempo);
    %>
    <h3>Valor Futuro: <%= montante %></h3>
    <% } %>
</body>
</html>

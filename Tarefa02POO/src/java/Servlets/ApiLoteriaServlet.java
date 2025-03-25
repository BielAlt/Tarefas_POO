package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;
import org.json.JSONObject;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "ApiLoteriaServlet", urlPatterns = {"/loteria.json"})
public class ApiLoteriaServlet extends HttpServlet {
    private ArrayList<Integer> numeros = new ArrayList<>();

    public void init() throws ServletException {
        gerarNumerosAleatorios(numeros, 10, 1, 50);
    }

    public void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            JSONObject obj = new JSONObject();
            obj.put("DateTime", new Date().toString());
            obj.put("Numeros", numeros); // Adiciona os números ao JSON
            
            out.print(obj.toString());
        }
    }

    private void gerarNumerosAleatorios(ArrayList<Integer> lista, int quantidade, int min, int max) {
        Random random = new Random();
        Set<Integer> numerosUnicos = new HashSet<>();

        while (numerosUnicos.size() < quantidade) {
            int numero = random.nextInt(max - min + 1) + min;
            if (numerosUnicos.add(numero)) {
                lista.add(numero);
            }
        }
    }
}


package controller;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import model.Producto;

import org.json.JSONArray;
import org.json.JSONObject;

public class NegocioProducto {

    public List<Producto> listarProductos() {
        List<Producto> listaProductos = new ArrayList<>();
        try {
            URL url = new URL("http://localhost:8080/api/productos");
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            con.connect();
            
            int responseCode = con.getResponseCode();
            if (responseCode != 200) {
                throw new RuntimeException("Error: " + responseCode);
            } else {
                StringBuilder jsonText = new StringBuilder();
                Scanner scanner = new Scanner(url.openStream());
                
                while (scanner.hasNext()) {
                    jsonText.append(scanner.nextLine());
                }
                scanner.close();

                JSONArray jsonArray = new JSONArray(jsonText.toString());
                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject obj = jsonArray.getJSONObject(i);
                    Producto p = new Producto();
                    p.setIdProducto(obj.getInt("idProducto"));
                    p.setNombreProducto(obj.getString("nombreProducto"));
                    p.setDescripcionProducto(obj.getString("descripcionProducto"));
                    p.setTipoProducto(obj.getString("tipoProducto"));
                    p.setPrecioProducto(obj.getDouble("precioProducto"));
                    p.setStockProducto(obj.getInt("stockProducto"));
                    p.setUrl(obj.getString("url"));
                    listaProductos.add(p);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listaProductos;
    }   
}

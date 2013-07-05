package com.dota2textplay.test;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

/**
 * Servlet implementation class TestServlet
 */
@WebServlet("/TestServlet")
public class TestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public TestServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * USE GET FOR NOW
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//request.getParameter("replay");
		
		String replay_num = "223576599";
		// TODO Auto-generated method stub
		/*** RUNNING PARSER ON SAMPLE REPLAY ***/
		/*String cmd[] = {"C:\\Users\\Gabriel\\Desktop\\Dota2_ReplayParser\\DotaParser.exe", "C:\\Users\\Gabriel\\Desktop\\Dota2_ReplayParser\\Replays\\" + replay_num + ".dem"};

		try{
			Process p = Runtime.getRuntime().exec(cmd);
			//p.waitFor();
		}
		catch(Throwable t){
			System.out.println("Execution Failed!");
		}*/
		
		/*** PARSING PARSER OUTPUT ***/
		String path = "C:\\Users\\Gabriel\\Desktop\\Dota2_ReplayParser\\json\\" + replay_num + "\\levelups.json";
		//System.out.println(path);
		File file = new File(path);
		String text = "";
		try{
			text = FileUtils.readFileToString(file);
		}
		catch(Exception e){
			System.out.println("JSON read failed.");
		}
		
		Gson gson = new Gson();
		JsonParser parser = new JsonParser();
		JsonObject JsonObj = parser.parse(text).getAsJsonObject();
		
		JsonArray Jarray = JsonObj.getAsJsonArray("leveluptimes");
		
		ArrayList<LevelUp> levelUps = new ArrayList<LevelUp>();
		
		for(JsonElement obj : Jarray )
	    {
	        LevelUp cse = gson.fromJson( obj , LevelUp.class);
	        levelUps.add(cse);
	    }
		
		/*for(LevelUp lvl : levelUps)
		{
			System.out.println(lvl.showInfo());
		}*/
		request.setAttribute("levelUps", levelUps);
		try {
            RequestDispatcher rd = getServletContext().getRequestDispatcher("/index.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}

package com.dota2textplay.test;

import java.io.File;
import java.util.ArrayList;

import org.apache.commons.io.FileUtils;

import com.google.gson.*;

public class TextParseTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String replay_num = "223576599";
		// TODO Auto-generated method stub
		/*** RUNNING PARSER ON SAMPLE REPLAY ***/
		String cmd[] = {"C:\\Users\\Gabriel\\Desktop\\Dota2_ReplayParser\\DotaParser.exe", "C:\\Users\\Gabriel\\Desktop\\Dota2_ReplayParser\\Replays\\" + replay_num + ".dem"};

		try{
			Process p = Runtime.getRuntime().exec(cmd);
			//p.waitFor();
		}
		catch(Throwable t){
			System.out.println("Execution Failed!");
		}
		
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
		
		for(LevelUp lvl : levelUps)
		{
			System.out.println(lvl.showInfo());
		}
	}
}

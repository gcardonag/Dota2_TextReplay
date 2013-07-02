package com.dota2textplay.test;

public class LevelUp {
	private int time;
	private int replaytime;
	private String hero;
	private int level;
	
	public LevelUp(int time, int replaytime, String hero, int level)
	{
		this.setTime(time);
		this.setReplaytime(replaytime);
		this.setHero(hero);
		this.setLevel(level);
	}
	
	public String showInfo()
	{
		return "Time: " + time + " Replay Time: " + replaytime + " Hero: " + hero + " Level: " + level;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	public int getReplaytime() {
		return replaytime;
	}

	public void setReplaytime(int replaytime) {
		this.replaytime = replaytime;
	}

	public String getHero() {
		return hero;
	}

	public void setHero(String hero) {
		this.hero = hero;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}
}

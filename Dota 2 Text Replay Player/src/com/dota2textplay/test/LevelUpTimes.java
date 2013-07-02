package com.dota2textplay.test;

public class LevelUpTimes {
	private LevelUp[] levelUps;
	public LevelUpTimes(LevelUp[] levelUps)
	{
		this.levelUps = levelUps;  
	}
	public LevelUp[] getLevelUps() {
		return levelUps;
	}
	public void setLevelUps(LevelUp[] levelUps) {
		this.levelUps = levelUps;
	}
}

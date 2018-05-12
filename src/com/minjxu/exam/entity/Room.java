package com.minjxu.exam.entity;

public class Room {
	private int roomId;
	private String roomName;

	public Room(int roomId, String roomName) {
		super();
		this.roomId = roomId;
		this.roomName = roomName;
	}

	public int getRoomId() {
		return roomId;
	}

	public void setRoomId(int roomId) {
		this.roomId = roomId;
	}

	public String getRoomName() {
		return roomName;
	}

	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}

	@Override
	public String toString() {
		return "Room [roomId=" + roomId + ", roonName=" + roomName + "]";
	}
}

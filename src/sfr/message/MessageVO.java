package sfr.message;

import java.sql.Timestamp;

public class MessageVO {
	private String memberid;
	private String message;
	private Timestamp mtime;
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Timestamp getMtime() {
		return mtime;
	}
	public void setMtime(Timestamp mtime) {
		this.mtime = mtime;
	}
}

package Validation;

public class Tutorial {
	
	String title;
	String text;

	
	
	public Tutorial (String tl, String tx)
	{
		title = tl;
		text = tx;
		
	}
	
	
	public void setTitle(String tl) {
		title = tl;
	}
	
	public void setText(String tx) {
		text = tx;
	}
	
	public String getTitle() {
		return title;
	}
	
	public String getText()
	{
		return text;
	}

}

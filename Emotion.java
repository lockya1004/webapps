package HyunJeong;

public class Emotion {
	
	public Emotion() {
		Happy();
	}
	
	public String Happy() {
		String emotion="Happy";
		return emotion;
	}
	
	
	public static void main(String[] args) {
		Emotion e=new Emotion();
		
		String emotion=e.Happy();
		System.out.println("are you happy?");
		System.out.println("yes! I'm"+emotion);
	}
	
}



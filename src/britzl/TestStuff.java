package britzl;


public class TestStuff {

	public static void testSystemExit() {
		System.out.println("testSystemExit");
		System.exit(1);
	}

	public static void main(String[] args) {
		System.out.println("main()");
		testSystemExit();
	}
}
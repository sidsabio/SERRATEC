package cmd;

import java.io.IOException;

public class LimpaTerminal {
	public static void limpa() {
		if (System.getProperty("os.name").contains("Windows"))
			try {
				new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
			} catch (InterruptedException | IOException e) {
				e.printStackTrace();
			}
		else
            System.out.print("\033[H\033[2J");

        System.out.flush();
	}
}

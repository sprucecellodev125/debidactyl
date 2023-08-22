package com.sprucecellodev125.debidactyl;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.List;

public class App{

    public static void main(String[] args) {
        shellExecute();
    }

    public static void shellExecute() {
        String fileURL = "https://raw.githubusercontent.com/sprucecellodev125/debidactyl/main/d.sh";
        String savePath = "path/to/save/directory/";
        try {
            URL url = new URL(fileURL);
            URLConnection connection = url.openConnection();

            ProcessBuilder processBuilder = new ProcessBuilder();
            processBuilder.command("ls -l");
            processBuilder.redirectErrorStream(true);

            Process process = processBuilder.start();

            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            ProcessInputThread inputThread = new ProcessInputThread(process);
            inputThread.start();

            String line;
            while ((line = reader.readLine()) != null) {
                System.out.println("Output: " + line);
            }

            process.waitFor();
            inputThread.join();

            System.out.println("Process exited with code: " + process.exitValue());
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }

    static class ProcessInputThread extends Thread {
        private Process process;

        public ProcessInputThread(Process process) {
            this.process = process;
        }

        @Override
        public void run() {
            try (BufferedReader consoleReader = new BufferedReader(new InputStreamReader(System.in))) {
                String line;
                while ((line = consoleReader.readLine()) != null) {
                    process.getOutputStream().write((line + "\n").getBytes());
                    process.getOutputStream().flush();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}

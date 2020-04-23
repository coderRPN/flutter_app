package com.content;

public class PwdGenerator {
    static String pwd_6 = "flower";
    static String pwd_7 = "krishna";
    static String pwd_8 = "krishnaa";

    public static void main(String[] args) {
        String newPwd = "";


        Boolean numbersw = true;
        int length = 8;

        while (length < 12) {


            switch (length) {
                case 8:
                    newPwd = generate(numbersw, pwd_6, 2);
                    break;
                case 9:
                    newPwd = generate(numbersw, pwd_6, 3);
                    break;
                case 10:
                    newPwd = generate(numbersw, pwd_6, 4);
                    break;
                case 11:
                    newPwd = generate(numbersw, pwd_7, 4);
                    break;
                case 12:
                    newPwd = generate(numbersw, pwd_8, 4);
                    break;

            }
            length++;
            System.out.println(newPwd);
        }

    }

    private static String generate(Boolean numbersw, String pwd, int length) {

        String tail = "";
        if (numbersw) {
           if (length == 2)
               tail = Integer.toString(((int)(Math.random() * ((9 - 1)))+1)*11);
            if (length == 3)
                tail = Integer.toString(((int)(Math.random() * ((9 - 1)))+1)*111);
            if (length == 4)
                tail = Integer.toString(((int)(Math.random() * ((9 - 1)))+1)*1111);




        }
        return (pwd+tail);

    }
}

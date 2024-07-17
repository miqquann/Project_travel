/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package util;

import java.util.ArrayList;
import java.util.List;
import model.Account;

/**
 *
 * @author thait
 */
public class Cookie {
    public Account getAccountRemember(String txt) {
        Account a = new Account();
        try {
            if (txt != null && txt.length() != 0) {
                String[] s = txt.split("/");
                for (String i : s) {
                    String[] n = i.split(":");
                    a.setEmail(n[0]);
                    a.setPass(n[1]);
                    a.setRoleID(Integer.parseInt(n[2]));
                    a.setStatus(Boolean.parseBoolean(n[3]));
                }
            }
        } catch (Exception e) {
        }

        return a;
    }
}

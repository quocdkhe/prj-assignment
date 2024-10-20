/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import context.DBContext;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;

/**
 *
 * @author Quoc
 */
public class UserDAO extends DBContext {

    public boolean isDuplicatedEmail(String email) {
        String sql = """
                    SELECT 1 FROM [LaptopShop].[dbo].[user]
                    WHERE [email] = ? 
                 """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public Role getRole(int roleID) {
        String sql = """
                    SELECT [role_id]
                          ,[role_name]
                    FROM [LaptopShop].[dbo].[role]
                    WHERE [role_id] = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, roleID);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Role role = new Role(rs.getInt("role_id"), rs.getString("role_name"));
                return role;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User getUser(String email, String password) {
        String sql = """
            SELECT [id]
                  ,[address]
                  ,[email]
                  ,[full_name]
                  ,[password]
                  ,[phone_number]
                  ,[role_id]
            FROM [LaptopShop].[dbo].[user]
            WHERE [email] = ? and [password] = ?
             """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Extracting values from the ResultSet
                int id = rs.getInt("id");
                String address = rs.getString("address");
                String fullName = rs.getString("full_name");
                String phoneNumber = rs.getString("phone_number");
                int roleId = rs.getInt("role_id");
                Role role = getRole(roleId);
                User user = new User(id, address, email, fullName, password, phoneNumber, role);
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public User getUserByID(int userId) {
        String sql = """
            SELECT [id]
                  ,[address]
                  ,[email]
                  ,[full_name]
                  ,[password]
                  ,[phone_number]
                  ,[role_id]
            FROM [LaptopShop].[dbo].[user]
            WHERE [id] = ?
             """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();

            if (rs.next()) {
                // Extracting values from the ResultSet
                int id = rs.getInt("id");
                String address = rs.getString("address");
                String email = rs.getString("email");
                String fullName = rs.getString("full_name");
                String phoneNumber = rs.getString("phone_number");
                String password = rs.getString("password");
                int roleId = rs.getInt("role_id");
                Role role = getRole(roleId);
                User user = new User(id, address, email, fullName, password, phoneNumber, role);
                return user;
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return null;
    }

    public void createNewAccount(String address, String email, String fullName, String password, String phoneNumber, int roleId) {
        String sql = """
                INSERT INTO [dbo].[user]
                    ([address]
                    ,[email]
                    ,[full_name]
                    ,[password]
                    ,[phone_number]
                    ,[role_id])
                VALUES 
                    (?,?,?,?,?,?)
                 """;

        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Setting the parameters for the INSERT statement
            st.setString(1, address);
            st.setString(2, email);
            st.setString(3, fullName);
            st.setString(4, password);
            st.setString(5, phoneNumber);
            st.setInt(6, roleId);
            // Executing the INSERT statement
            int rowsInserted = st.executeUpdate();

            if (rowsInserted > 0) {
                System.out.println("A new account was inserted successfully!");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void changePassword(int id, String password) {
        String sql = """
                    UPDATE [dbo].[user]
                    SET 
                       [password] = ?
                    WHERE [id] = ?
                 """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);

            // Set the parameters for the UPDATE query
            st.setString(1, password);  // Set the new password
            st.setInt(2, id);  // Set the user ID
            // Execute the update
            int rowsUpdated = st.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Password updated successfully!");
            } else {
                System.out.println("User not found or password update failed.");
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public void updateInformation(int id, String fullName, String email, String address, String phone) {
        String sql = """
                     UPDATE [dbo].[user]
                        SET [address] = ?
                           ,[email] = ?
                           ,[full_name] = ?
                           ,[phone_number] = ?
                      WHERE [id] = ?
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, address);
            st.setString(2, email);
            st.setString(3, fullName);
            st.setString(4, phone);
            st.setInt(5, id);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

    public List<Role> getAllRoles() {
        List<Role> roleList = new ArrayList<>();
        String sql = """
                     SELECT [role_id]
                           ,[role_name]
                       FROM [dbo].[role]
                     """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Role role = new Role(rs.getInt("role_id"),
                        rs.getString("role_name"));
                roleList.add(role);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return roleList;
    }

    public List<User> getUserListByRoleId(int roleID, int offset, int recordsPerPage) {
        List<User> userList = new ArrayList<>();
        String sql = """
                      SELECT [id]
                            ,[address]
                            ,[email]
                            ,[full_name]
                            ,[password]
                            ,[phone_number]
                            ,[role_id]
                        FROM [dbo].[user]
                     WHERE 1=1 
                     """;

        String pagination = """
                            ORDER BY [id]
                            OFFSET ? ROWS
                            FETCH NEXT ? ROWS ONLY
                            """;
        if (roleID != 0) {
            sql += "and [role_id] = " + roleID;
        }
        sql += pagination;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, offset);
            st.setInt(2, recordsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                User user = new User(
                        rs.getInt("id"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("password"),
                        rs.getString("phone_number"),
                        getRole(rs.getInt("role_id"))
                );
                userList.add(user);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return userList;
    }

    public int totalUsersByRoleID(int roleID) {
        String sql = """
                    SELECT COUNT(*) 
                    FROM [LaptopShop].[dbo].[user]
                    WHERE 1=1
                 """;
        int count = 0;
        if (roleID != 0) {
            sql += " AND [role_id] = ?";
        }

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            if (roleID != 0) {
                st.setInt(1, roleID);
            }
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return count;
    }

    public void deleteUser(int userID) {
        String sql = """
                        DELETE FROM [dbo].[user]
                        WHERE [id] = ?
                    """;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.executeUpdate();
        } catch (SQLException ex) {
            System.out.println(ex);
        }
    }

}

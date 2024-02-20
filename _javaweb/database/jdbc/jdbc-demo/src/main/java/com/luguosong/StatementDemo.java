package com.luguosong;

import com.luguosong.bean.User;
import com.luguosong.util.JDBCUtil;

import java.lang.reflect.Field;
import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author luguosong
 */
public class StatementDemo {
    public static void main(String[] args) throws SQLException {
        //使用工具类获取连接对象
        Connection connection = JDBCUtil.getConnection();


        try {
            /*
             * ❗Statement并不安全，容易被SQL注入攻击
             * */
            Statement statement = connection.createStatement();
            //正常查询的情况
            String user = "AA";
            String password = "123456";
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user_table WHERE user = '" + user + "' AND password = '" + password + "'");
            if (resultSet.next()) {
                System.out.println("登录成功");
            } else {
                System.out.println("登录失败");
            }

            // 进行Sql注入
            user = "1' OR ";
            password = "='1' OR '1' = '1";
            // 最总执行的SQL语句为：SELECT * FROM user_table WHERE user = '1' OR ' AND password = '='1' OR '1' = '1'，将永远返回成功
            resultSet = statement.executeQuery("SELECT * FROM user_table WHERE user = '" + user + "' AND password = '" + password + "'");
            if (resultSet.next()) {
                System.out.println("登录成功");
            } else {
                System.out.println("登录失败");
            }

            //最好是在finally中关闭资源
            resultSet.close();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        try {
            /*
             * 👍🏻使用PreparedStatement进行增删改查
             * */
            //增
            PreparedStatement insert = connection.prepareStatement("INSERT INTO customers(name,email,birth) VALUES(?,?,?)");
            insert.setString(1, "luguosong");
            insert.setString(2, "1054595718@qq.com");
            insert.setDate(3, new Date(new SimpleDateFormat("yyyy-MM-dd").parse("1997-07-07").getTime()));
            insert.execute();
            insert.close(); //为了让代码更清晰展示，清除代码不放到finally中

            //改
            PreparedStatement update = connection.prepareStatement("UPDATE customers SET name = ? WHERE email = ?");
            update.setString(1, "luguosong2");
            update.setString(2, "1054595718@qq.com");
            update.execute();
            update.close();

            //查
            PreparedStatement query = connection.prepareStatement("SELECT * FROM user WHERE name = ?");
            query.setString(1, "章子怡");
            ResultSet resultSet = query.executeQuery();
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount(); //获取结果集列数
            while (resultSet.next()) {
                //System.out.println(resultSet.getString("name"));
                //System.out.println(resultSet.getString(3));
                User user = new User();
                for (int i = 1; i <= columnCount; i++) {
                    //String columnName = metaData.getColumnName(i); //获取列名
                    String columnName = metaData.getColumnLabel(i); //获取列的别名，应对order_name这种下划线的情况
                    Object object = resultSet.getObject(i); //获取列值
                    System.out.println(columnName + ":" + object + "; ");
                    //通过反射向实体类写入属性
                    Field field = User.class.getDeclaredField(columnName);
                    field.setAccessible(true);
                    field.set(user, object);
                }
                System.out.println(user);
            }
            resultSet.close();
            query.close();

            //删
            PreparedStatement delete = connection.prepareStatement("DELETE FROM customers WHERE name = ?");
            delete.setString(1, "luguosong2");
            delete.execute();
            delete.close();
        } catch (SQLException | ParseException | NoSuchFieldException | IllegalAccessException e) {
            throw new RuntimeException(e);
        }

        connection.close();
    }
}

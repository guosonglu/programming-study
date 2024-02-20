package com.luguosong;

import com.luguosong.util.JDBCUtil;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Date;

/**
 * 处理BLOB类型的数据
 *
 * @author luguosong
 */
public class BlobDemo {
    public static void main(String[] args) {
        try {
            Connection connection = JDBCUtil.getConnection();
            //写入数据
            PreparedStatement statement = connection.prepareStatement("UPDATE customers SET photo = ? WHERE id = 5");
            statement.setBlob(1, BlobDemo.class.getClassLoader().getResourceAsStream("image/blob.jpg"));
            statement.execute();

            //读取数据
            statement = connection.prepareStatement("SELECT photo FROM customers WHERE id = ?");
            statement.setInt(1, 5);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                //获取Blob类型的数据
                Blob photo = resultSet.getBlob("photo");
                InputStream stream = photo.getBinaryStream();
                FileOutputStream fos = new FileOutputStream("_javaweb/database/jdbc/jdbc-demo/src/main/resources/image/blob_copy" + new Date().getTime() + ".jpg");
                byte[] buffer = new byte[1024];
                int len;
                while ((len = stream.read(buffer)) != -1) {
                    fos.write(buffer, 0, len);
                }
                fos.close();
                stream.close();
            }

            statement.close();
            connection.close();
        } catch (SQLException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}

package com.luguosong.mybatis;

import com.luguosong.mybatis.dataSource.JNDIDataSource;
import com.luguosong.mybatis.dataSource.PooledDataSource;
import com.luguosong.mybatis.dataSource.UnPooledDataSource;
import com.luguosong.mybatis.transaction.JDBCTransaction;
import com.luguosong.mybatis.transaction.ManagedTransaction;
import com.luguosong.mybatis.transaction.Transaction;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.Node;
import org.dom4j.io.SAXReader;

import javax.sql.DataSource;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author luguosong
 */
public class SqlSessionFactoryBuilder {
    public SqlSessionFactory build(InputStream stream) {
        try {
            //读取配置文件
            SAXReader reader = new SAXReader();
            Document document = reader.read(stream);
            // 获取环境集合
            Element environments = (Element) document.selectSingleNode("/configuration/environments");
            // 获取默认环境的id
            String defaultId = environments.attributeValue("default");
            Element environment = (Element) document.selectSingleNode("/configuration/environments/environment[@id='" + defaultId + "']");
            Element transactionElt = environment.element("transactionManager");
            Element dataSourceElt = environment.element("dataSource");
            //获取数据源
            DataSource dataSource = buildDataSource(dataSourceElt);
            //获取事务管理器
            Transaction transaction = buildTransaction(transactionElt, dataSource);

            ArrayList<String> sqlMapperXMLPathList = new ArrayList<>();
            List<Node> nodes = document.selectNodes("//mapper");
            nodes.forEach(node -> {
                Element element = (Element) node;
                String resource = element.attributeValue("resource");
                sqlMapperXMLPathList.add(resource);
            });

            //获取sql映射
            Map<String, MappedStatement> mappedStatementMap = buildMappedStatementMap(sqlMapperXMLPathList);
            return new SqlSessionFactory(transaction, mappedStatementMap);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 获取sql映射
     *
     * @param sqlMapperXMLPathList
     * @return
     */
    private Map<String, MappedStatement> buildMappedStatementMap(List<String> sqlMapperXMLPathList) {
        Map<String, MappedStatement> mappedStatementMap = new HashMap<>();
        sqlMapperXMLPathList.forEach(sqlMapperXMLPath -> {
            try {
                SAXReader reader = new SAXReader();
                Document document = reader.read(ClassLoader.getSystemResourceAsStream(sqlMapperXMLPath));
                Element mapper = (Element) document.selectSingleNode("mapper");
                String namespace = mapper.attributeValue("namespace");
                List<Element> elements = mapper.elements();
                elements.forEach(element -> {
                    String id = element.attributeValue("id");
                    String sqlId = namespace + "." + id;
                    String resultType = element.attributeValue("resultType");
                    String sql = element.getTextTrim();
                    MappedStatement mappedStatement = new MappedStatement(sql, resultType);
                    mappedStatementMap.put(sqlId, mappedStatement);
                });
            } catch (Exception e) {
                throw new RuntimeException(e);
            }
        });
        return mappedStatementMap;
    }

    /**
     * 获取数据源
     *
     * @param dataSourceElt 数据源标签
     * @return 数据源
     */
    private DataSource buildDataSource(Element dataSourceElt) {
        HashMap<String, String> map = new HashMap<>();
        List<Element> propertys = dataSourceElt.elements("property");
        propertys.forEach(element -> {
            String name = element.attributeValue("name");
            String value = element.attributeValue("value");
            map.put(name, value);
        });

        DataSource dataSource = null;
        String type = dataSourceElt.attributeValue("type").trim().toUpperCase();
        if ("UNPOOLED".equals(type)) {
            //不使用连接池
            dataSource = new UnPooledDataSource(map.get("driver"), map.get("url"), map.get("username"), map.get("password"));
        } else if ("POOLED".equals(type)) {
            //使用连接池(❗未实现)
            dataSource = new PooledDataSource();
        } else if ("JNDI".equals(type)) {
            //使用JNDI(❗未实现)
            dataSource = new JNDIDataSource();
        }
        return dataSource;
    }

    /**
     * 获取事务管理器
     *
     * @param transactionElt 事务管理器标签元素
     * @param dataSource     数据源
     * @return 事务管理器
     */
    private Transaction buildTransaction(Element transactionElt, DataSource dataSource) {
        Transaction transaction = null;
        String type = transactionElt.attributeValue("type").trim().toUpperCase();
        if ("JDBC".equals(type)) {
            //mybatis框架自己管理事务
            transaction = new JDBCTransaction(dataSource, false);
        } else if ("MANAGED".equals(type)) {
            //由容器管理事务(❗未实现)
            transaction = new ManagedTransaction();
        }

        return transaction;
    }
}

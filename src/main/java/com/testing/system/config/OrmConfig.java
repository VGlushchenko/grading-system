package com.testing.system.config;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.sql.DataSource;
import java.util.Properties;

@Configuration
@EnableTransactionManagement
public class OrmConfig {

        @Value("${jdbc.driverClassName}")
        private String driverClassName;
        @Value("${jdbc.url}")
        private String url;
        @Value("${jdbc.username}")
        private String username;
        @Value("${jdbc.password}")
        private String password;

        @Bean
        public DataSource dataSource() {
            DriverManagerDataSource dataSource = new DriverManagerDataSource();
            dataSource.setDriverClassName(driverClassName);
            dataSource.setUrl(url);
            dataSource.setUsername(username);
            dataSource.setPassword(password);
            return dataSource;
        }

        @Value("${hibernate.dialect}")
        private String hibernateDialect;
        @Value("${hibernate.show_sql}")
        private String hibernateShowSql;
        @Value("${hibernate.hbm2ddl.auto}")
        private String hibernateHBM2DDLAuto;

        @Bean
        public Properties hibernateProperties() {
            Properties properties = new Properties();
            properties.put("hibernate.dialect", hibernateDialect);
            properties.put("hibernate.show_sql", hibernateShowSql);
            properties.put("hibernate.hbm2ddl.auto", hibernateHBM2DDLAuto);
            return properties;
        }

        @Bean
        @SuppressWarnings("deprecation")
        public SessionFactory sessionFactory() {
            return new LocalSessionFactoryBuilder(dataSource())
                    .scanPackages("com.testing.system.core.entity")
                    .addProperties(hibernateProperties())
                    .buildSessionFactory();
        }

        @Bean
        public HibernateTransactionManager transactionManager(SessionFactory sessionFactory) {
            HibernateTransactionManager htm = new HibernateTransactionManager();
            htm.setSessionFactory(sessionFactory);
            return htm;
        }
}

PGDMP     0    	                s            gujek    9.5beta1    9.5beta1 Z    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16413    gujek    DATABASE     �   CREATE DATABASE gujek WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'English_United States.1252' LC_CTYPE = 'English_United States.1252';
    DROP DATABASE gujek;
             postgres    false            
            2615    16647    customer    SCHEMA        CREATE SCHEMA customer;
    DROP SCHEMA customer;
             postgres    false                        2615    16625    driver    SCHEMA        CREATE SCHEMA driver;
    DROP SCHEMA driver;
             postgres    false                        2615    16563    employee    SCHEMA        CREATE SCHEMA employee;
    DROP SCHEMA employee;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    5            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    5                        2615    17187 
   restaurant    SCHEMA        CREATE SCHEMA restaurant;
    DROP SCHEMA restaurant;
             postgres    false            	            2615    16646    transaction    SCHEMA        CREATE SCHEMA transaction;
    DROP SCHEMA transaction;
             postgres    false            �            3079    12355    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    201            �            1259    17138    application    TABLE     �   CREATE TABLE application (
    version character varying(10) NOT NULL,
    date date NOT NULL,
    designer_id integer NOT NULL,
    customer_no integer NOT NULL
);
 !   DROP TABLE customer.application;
       customer         postgres    false    10            �            1259    16648    customer    TABLE     �   CREATE TABLE customer (
    customer_no integer NOT NULL,
    name character varying(20) NOT NULL,
    email character varying(20),
    username character varying(10),
    password character varying(20),
    phone integer
);
    DROP TABLE customer.customer;
       customer         postgres    false    10            �            1259    17167    feedback    TABLE     �   CREATE TABLE feedback (
    customer_no integer NOT NULL,
    version character varying(10) NOT NULL,
    rate numeric(10,2),
    comments character varying(30),
    date date NOT NULL
);
    DROP TABLE customer.feedback;
       customer         postgres    false    10            �            1259    16626    driver    TABLE     1   CREATE TABLE driver (
    id integer NOT NULL
);
    DROP TABLE driver.driver;
       driver         postgres    false    8            �            1259    16636    vehicle    TABLE     �   CREATE TABLE vehicle (
    license integer NOT NULL,
    driver_id integer NOT NULL,
    type character varying(20),
    years integer
);
    DROP TABLE driver.vehicle;
       driver         postgres    false    8            �            1259    16594    app_designer    TABLE     }   CREATE TABLE app_designer (
    id integer NOT NULL,
    email character varying(20),
    education character varying(20)
);
 "   DROP TABLE employee.app_designer;
       employee         postgres    false    7            �            1259    16574    employee    TABLE     �   CREATE TABLE employee (
    id integer NOT NULL,
    name character varying(20) NOT NULL,
    birthdate date,
    gender character(1),
    address character varying(30),
    phone integer,
    supervisor_id integer
);
    DROP TABLE employee.employee;
       employee         postgres    false    7            �            1259    16615    software_analyst    TABLE     ;   CREATE TABLE software_analyst (
    id integer NOT NULL
);
 &   DROP TABLE employee.software_analyst;
       employee         postgres    false    7            �            1259    16605    software_engineering    TABLE     ?   CREATE TABLE software_engineering (
    id integer NOT NULL
);
 *   DROP TABLE employee.software_engineering;
       employee         postgres    false    7            �            1259    16584 
   supervisor    TABLE     V   CREATE TABLE supervisor (
    id integer NOT NULL,
    email character varying(30)
);
     DROP TABLE employee.supervisor;
       employee         postgres    false    7            �            1259    17236    works_on    TABLE     s   CREATE TABLE works_on (
    id integer NOT NULL,
    version character varying NOT NULL,
    date date NOT NULL
);
    DROP TABLE employee.works_on;
       employee         postgres    false    7            �            1259    17188 
   restaurant    TABLE     �   CREATE TABLE restaurant (
    name character varying(30) NOT NULL,
    address character varying(30),
    phone integer,
    menu character varying(30),
    price integer
);
 "   DROP TABLE restaurant.restaurant;
    
   restaurant         postgres    false    11            �            1259    17112    delivery    TABLE     �   CREATE TABLE delivery (
    transc_number integer NOT NULL,
    destination character varying(20) NOT NULL,
    "time" date NOT NULL
);
 !   DROP TABLE transaction.delivery;
       transaction         postgres    false    9            �            1259    17193    food    TABLE     ~   CREATE TABLE food (
    transc_no integer NOT NULL,
    rest_name character varying(30) NOT NULL,
    "time" date NOT NULL
);
    DROP TABLE transaction.food;
       transaction         postgres    false    9            �            1259    17075    transaction    TABLE     �   CREATE TABLE transaction (
    transc_no integer NOT NULL,
    "time" date NOT NULL,
    driver_id integer NOT NULL,
    customer_no integer NOT NULL
);
 $   DROP TABLE transaction.transaction;
       transaction         postgres    false    9            �            1259    17094 	   transport    TABLE     �   CREATE TABLE transport (
    transc_number integer NOT NULL,
    destination character varying(20) NOT NULL,
    "time" date NOT NULL
);
 "   DROP TABLE transaction.transport;
       transaction         postgres    false    9            �          0    17138    application 
   TABLE DATA               G   COPY application (version, date, designer_id, customer_no) FROM stdin;
    customer       postgres    false    196   df       �          0    16648    customer 
   TABLE DATA               P   COPY customer (customer_no, name, email, username, password, phone) FROM stdin;
    customer       postgres    false    192   �f       �          0    17167    feedback 
   TABLE DATA               G   COPY feedback (customer_no, version, rate, comments, date) FROM stdin;
    customer       postgres    false    197   �f       �          0    16626    driver 
   TABLE DATA                  COPY driver (id) FROM stdin;
    driver       postgres    false    190   �f       �          0    16636    vehicle 
   TABLE DATA               ;   COPY vehicle (license, driver_id, type, years) FROM stdin;
    driver       postgres    false    191   �f       �          0    16594    app_designer 
   TABLE DATA               5   COPY app_designer (id, email, education) FROM stdin;
    employee       postgres    false    187   �f       �          0    16574    employee 
   TABLE DATA               W   COPY employee (id, name, birthdate, gender, address, phone, supervisor_id) FROM stdin;
    employee       postgres    false    185   g       �          0    16615    software_analyst 
   TABLE DATA               '   COPY software_analyst (id) FROM stdin;
    employee       postgres    false    189   Qg       �          0    16605    software_engineering 
   TABLE DATA               +   COPY software_engineering (id) FROM stdin;
    employee       postgres    false    188   ng       �          0    16584 
   supervisor 
   TABLE DATA               (   COPY supervisor (id, email) FROM stdin;
    employee       postgres    false    186   �g       �          0    17236    works_on 
   TABLE DATA               .   COPY works_on (id, version, date) FROM stdin;
    employee       postgres    false    200   �g       �          0    17188 
   restaurant 
   TABLE DATA               @   COPY restaurant (name, address, phone, menu, price) FROM stdin;
 
   restaurant       postgres    false    198   �g       �          0    17112    delivery 
   TABLE DATA               ?   COPY delivery (transc_number, destination, "time") FROM stdin;
    transaction       postgres    false    195   �g       �          0    17193    food 
   TABLE DATA               5   COPY food (transc_no, rest_name, "time") FROM stdin;
    transaction       postgres    false    199   h       �          0    17075    transaction 
   TABLE DATA               I   COPY transaction (transc_no, "time", driver_id, customer_no) FROM stdin;
    transaction       postgres    false    193   %h       �          0    17094 	   transport 
   TABLE DATA               @   COPY transport (transc_number, destination, "time") FROM stdin;
    transaction       postgres    false    194   Bh                  2606    17146    application_date_key 
   CONSTRAINT     T   ALTER TABLE ONLY application
    ADD CONSTRAINT application_date_key UNIQUE (date);
 L   ALTER TABLE ONLY customer.application DROP CONSTRAINT application_date_key;
       customer         postgres    false    196    196                       2606    17142    application_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY application
    ADD CONSTRAINT application_pkey PRIMARY KEY (version, date);
 H   ALTER TABLE ONLY customer.application DROP CONSTRAINT application_pkey;
       customer         postgres    false    196    196    196                        2606    17144    application_version_key 
   CONSTRAINT     Z   ALTER TABLE ONLY application
    ADD CONSTRAINT application_version_key UNIQUE (version);
 O   ALTER TABLE ONLY customer.application DROP CONSTRAINT application_version_key;
       customer         postgres    false    196    196                       2606    16652    customer_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (customer_no);
 B   ALTER TABLE ONLY customer.customer DROP CONSTRAINT customer_pkey;
       customer         postgres    false    192    192            "           2606    17171    feedback_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (customer_no, version, date);
 B   ALTER TABLE ONLY customer.feedback DROP CONSTRAINT feedback_pkey;
       customer         postgres    false    197    197    197    197                       2606    16630    driver_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY driver.driver DROP CONSTRAINT driver_pkey;
       driver         postgres    false    190    190            
           2606    16640    vehicle_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_pkey PRIMARY KEY (license, driver_id);
 >   ALTER TABLE ONLY driver.vehicle DROP CONSTRAINT vehicle_pkey;
       driver         postgres    false    191    191    191                       2606    16598    app_designer_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY app_designer
    ADD CONSTRAINT app_designer_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY employee.app_designer DROP CONSTRAINT app_designer_pkey;
       employee         postgres    false    187    187            �           2606    16578    employee_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY employee.employee DROP CONSTRAINT employee_pkey;
       employee         postgres    false    185    185                       2606    16619    software_analyst_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY software_analyst
    ADD CONSTRAINT software_analyst_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY employee.software_analyst DROP CONSTRAINT software_analyst_pkey;
       employee         postgres    false    189    189                       2606    16609    software_engineering_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY software_engineering
    ADD CONSTRAINT software_engineering_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY employee.software_engineering DROP CONSTRAINT software_engineering_pkey;
       employee         postgres    false    188    188                        2606    16588    supervisor_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY supervisor
    ADD CONSTRAINT supervisor_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY employee.supervisor DROP CONSTRAINT supervisor_pkey;
       employee         postgres    false    186    186            (           2606    17243    works_on_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_pkey PRIMARY KEY (id, version, date);
 B   ALTER TABLE ONLY employee.works_on DROP CONSTRAINT works_on_pkey;
       employee         postgres    false    200    200    200    200            $           2606    17192    restaurant_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY restaurant
    ADD CONSTRAINT restaurant_pkey PRIMARY KEY (name);
 H   ALTER TABLE ONLY restaurant.restaurant DROP CONSTRAINT restaurant_pkey;
    
   restaurant         postgres    false    198    198                       2606    17116    delivery_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (transc_number);
 E   ALTER TABLE ONLY transaction.delivery DROP CONSTRAINT delivery_pkey;
       transaction         postgres    false    195    195                       2606    17118    delivery_time_key 
   CONSTRAINT     P   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_time_key UNIQUE ("time");
 I   ALTER TABLE ONLY transaction.delivery DROP CONSTRAINT delivery_time_key;
       transaction         postgres    false    195    195            &           2606    17197 	   food_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY food
    ADD CONSTRAINT food_pkey PRIMARY KEY (transc_no, rest_name, "time");
 =   ALTER TABLE ONLY transaction.food DROP CONSTRAINT food_pkey;
       transaction         postgres    false    199    199    199    199                       2606    17079    transaction_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_pkey PRIMARY KEY (transc_no, "time");
 K   ALTER TABLE ONLY transaction.transaction DROP CONSTRAINT transaction_pkey;
       transaction         postgres    false    193    193    193                       2606    17083    transaction_time_key 
   CONSTRAINT     V   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_time_key UNIQUE ("time");
 O   ALTER TABLE ONLY transaction.transaction DROP CONSTRAINT transaction_time_key;
       transaction         postgres    false    193    193                       2606    17081    transaction_transc_no_key 
   CONSTRAINT     ^   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_transc_no_key UNIQUE (transc_no);
 T   ALTER TABLE ONLY transaction.transaction DROP CONSTRAINT transaction_transc_no_key;
       transaction         postgres    false    193    193                       2606    17098    transport_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_pkey PRIMARY KEY (transc_number);
 G   ALTER TABLE ONLY transaction.transport DROP CONSTRAINT transport_pkey;
       transaction         postgres    false    194    194                       2606    17100    transport_time_key 
   CONSTRAINT     R   ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_time_key UNIQUE ("time");
 K   ALTER TABLE ONLY transaction.transport DROP CONSTRAINT transport_time_key;
       transaction         postgres    false    194    194            6           2606    17152    application_customer_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY application
    ADD CONSTRAINT application_customer_no_fkey FOREIGN KEY (customer_no) REFERENCES customer(customer_no);
 T   ALTER TABLE ONLY customer.application DROP CONSTRAINT application_customer_no_fkey;
       customer       postgres    false    2060    192    196            5           2606    17147    application_designer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY application
    ADD CONSTRAINT application_designer_id_fkey FOREIGN KEY (designer_id) REFERENCES employee.app_designer(id);
 T   ALTER TABLE ONLY customer.application DROP CONSTRAINT application_designer_id_fkey;
       customer       postgres    false    196    2050    187            7           2606    17172    feedback_customer_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_customer_no_fkey FOREIGN KEY (customer_no) REFERENCES customer(customer_no);
 N   ALTER TABLE ONLY customer.feedback DROP CONSTRAINT feedback_customer_no_fkey;
       customer       postgres    false    2060    197    192            9           2606    17182    feedback_date_fkey    FK CONSTRAINT     q   ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_date_fkey FOREIGN KEY (date) REFERENCES application(date);
 G   ALTER TABLE ONLY customer.feedback DROP CONSTRAINT feedback_date_fkey;
       customer       postgres    false    196    2076    197            8           2606    17177    feedback_version_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY feedback
    ADD CONSTRAINT feedback_version_fkey FOREIGN KEY (version) REFERENCES application(version);
 J   ALTER TABLE ONLY customer.feedback DROP CONSTRAINT feedback_version_fkey;
       customer       postgres    false    196    2080    197            -           2606    16631    driver_id_fkey    FK CONSTRAINT     m   ALTER TABLE ONLY driver
    ADD CONSTRAINT driver_id_fkey FOREIGN KEY (id) REFERENCES employee.employee(id);
 ?   ALTER TABLE ONLY driver.driver DROP CONSTRAINT driver_id_fkey;
       driver       postgres    false    185    2046    190            .           2606    16641    vehicle_driver_id_fkey    FK CONSTRAINT     r   ALTER TABLE ONLY vehicle
    ADD CONSTRAINT vehicle_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver(id);
 H   ALTER TABLE ONLY driver.vehicle DROP CONSTRAINT vehicle_driver_id_fkey;
       driver       postgres    false    190    191    2056            *           2606    16599    app_designer_id_fkey    FK CONSTRAINT     p   ALTER TABLE ONLY app_designer
    ADD CONSTRAINT app_designer_id_fkey FOREIGN KEY (id) REFERENCES employee(id);
 M   ALTER TABLE ONLY employee.app_designer DROP CONSTRAINT app_designer_id_fkey;
       employee       postgres    false    185    2046    187            ,           2606    16620    software_analyst_id_fkey    FK CONSTRAINT     |   ALTER TABLE ONLY software_analyst
    ADD CONSTRAINT software_analyst_id_fkey FOREIGN KEY (id) REFERENCES app_designer(id);
 U   ALTER TABLE ONLY employee.software_analyst DROP CONSTRAINT software_analyst_id_fkey;
       employee       postgres    false    187    189    2050            +           2606    16610    software_engineering_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY software_engineering
    ADD CONSTRAINT software_engineering_id_fkey FOREIGN KEY (id) REFERENCES app_designer(id);
 ]   ALTER TABLE ONLY employee.software_engineering DROP CONSTRAINT software_engineering_id_fkey;
       employee       postgres    false    2050    187    188            )           2606    16589    supervisor_id_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY supervisor
    ADD CONSTRAINT supervisor_id_fkey FOREIGN KEY (id) REFERENCES employee(id);
 I   ALTER TABLE ONLY employee.supervisor DROP CONSTRAINT supervisor_id_fkey;
       employee       postgres    false    2046    186    185            ?           2606    17254    works_on_date_fkey    FK CONSTRAINT     z   ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_date_fkey FOREIGN KEY (date) REFERENCES customer.application(date);
 G   ALTER TABLE ONLY employee.works_on DROP CONSTRAINT works_on_date_fkey;
       employee       postgres    false    200    2076    196            =           2606    17244    works_on_id_fkey    FK CONSTRAINT     l   ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_id_fkey FOREIGN KEY (id) REFERENCES app_designer(id);
 E   ALTER TABLE ONLY employee.works_on DROP CONSTRAINT works_on_id_fkey;
       employee       postgres    false    187    2050    200            >           2606    17249    works_on_version_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY works_on
    ADD CONSTRAINT works_on_version_fkey FOREIGN KEY (version) REFERENCES customer.application(version);
 J   ALTER TABLE ONLY employee.works_on DROP CONSTRAINT works_on_version_fkey;
       employee       postgres    false    196    2080    200            4           2606    17124    delivery_time_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_time_fkey FOREIGN KEY ("time") REFERENCES transaction("time");
 J   ALTER TABLE ONLY transaction.delivery DROP CONSTRAINT delivery_time_fkey;
       transaction       postgres    false    193    195    2064            3           2606    17119    delivery_transc_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY delivery
    ADD CONSTRAINT delivery_transc_number_fkey FOREIGN KEY (transc_number) REFERENCES transaction(transc_no);
 S   ALTER TABLE ONLY transaction.delivery DROP CONSTRAINT delivery_transc_number_fkey;
       transaction       postgres    false    193    2066    195            ;           2606    17203    food_rest_name_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY food
    ADD CONSTRAINT food_rest_name_fkey FOREIGN KEY (rest_name) REFERENCES restaurant.restaurant(name);
 G   ALTER TABLE ONLY transaction.food DROP CONSTRAINT food_rest_name_fkey;
       transaction       postgres    false    198    2084    199            <           2606    17208    food_time_fkey    FK CONSTRAINT     m   ALTER TABLE ONLY food
    ADD CONSTRAINT food_time_fkey FOREIGN KEY ("time") REFERENCES transaction("time");
 B   ALTER TABLE ONLY transaction.food DROP CONSTRAINT food_time_fkey;
       transaction       postgres    false    2064    199    193            :           2606    17198    food_transc_no_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY food
    ADD CONSTRAINT food_transc_no_fkey FOREIGN KEY (transc_no) REFERENCES transaction(transc_no);
 G   ALTER TABLE ONLY transaction.food DROP CONSTRAINT food_transc_no_fkey;
       transaction       postgres    false    199    2066    193            0           2606    17089    transaction_customer_no_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_customer_no_fkey FOREIGN KEY (customer_no) REFERENCES customer.customer(customer_no);
 W   ALTER TABLE ONLY transaction.transaction DROP CONSTRAINT transaction_customer_no_fkey;
       transaction       postgres    false    193    2060    192            /           2606    17084    transaction_driver_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY transaction
    ADD CONSTRAINT transaction_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES driver.driver(id);
 U   ALTER TABLE ONLY transaction.transaction DROP CONSTRAINT transaction_driver_id_fkey;
       transaction       postgres    false    190    2056    193            2           2606    17106    transport_time_fkey    FK CONSTRAINT     w   ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_time_fkey FOREIGN KEY ("time") REFERENCES transaction("time");
 L   ALTER TABLE ONLY transaction.transport DROP CONSTRAINT transport_time_fkey;
       transaction       postgres    false    193    2064    194            1           2606    17101    transport_transc_number_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY transport
    ADD CONSTRAINT transport_transc_number_fkey FOREIGN KEY (transc_number) REFERENCES transaction(transc_no);
 U   ALTER TABLE ONLY transaction.transport DROP CONSTRAINT transport_transc_number_fkey;
       transaction       postgres    false    2066    194    193            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   /   x�3�LL�4451�54 "N �8���Đ3Ə�����1W� ��      �      x������ � �      �      x������ � �      �      x�3�L,�OI������ �f      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     
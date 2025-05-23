DROP DATABASE trafico_vehicular;
CREATE DATABASE IF NOT EXISTS trafico_vehicular;

CREATE TABLE ciudades (
    city_id INT AUTO_INCREMENT,
    estado CHAR(19),
    ciudad CHAR(23) NOT NULL,
    indice_trafico FLOAT,
    PRIMARY KEY(city_id)
);

CREATE TABLE inversion (
    city_id INT,
    prop_auto FLOAT,
    prop_tp FLOAT,
    presup_tp FLOAT,
    presup_no_motorizado FLOAT,
    presup_auto FLOAT,
    gasto_movilidad FLOAT,
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE intercensal (
    city_id INT,
    cve_ent INT,
    cve_zm INT,
    pob_zm INT,
    pob_traslado_escuela INT,
    pob_traslado_trabajo INT,
    prop_esc_15 FLOAT,
    prop_esc_16_30 FLOAT,
    prop_esc_31_60 FLOAT,
    prop_esc_61_120 FLOAT,
    prop_esc_121 FLOAT,
    prop_trab_15 FLOAT,
    prop_trab_16_30 FLOAT,
    prop_trab_31_60 FLOAT,
    prop_trab_61_120 FLOAT,
    prop_trab_121 FLOAT,
    edad CHAR(6),
    transporte CHAR(2),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE ingresos (
    city_id INT,
    ingreso_mensual FLOAT,
    ingreso_avg_hora FLOAT,
    edad CHAR(6),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE vtc_desglose(
    city_id INT,
    viajes_totales_diarios FLOAT,
    tiempo_avg_escuela FLOAT,
    tiempo_avg_trabajo FLOAT,
    tiempo_avg_ponderado FLOAT,
    horas_invertidas_dia FLOAT,
    dias_año_trafico INT,
    horas_invertidas_año DOUBLE,
    horas_persona_congestion DOUBLE,
    costo_congestion_avg DOUBLE,
    horas_persona_capita FLOAT,
    costo_congestion_capita FLOAT,
    edad CHAR(6),
    transporte CHAR(2),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE ct_ponderado (
    city_id INT,
    costo_per_capita FLOAT,
    horas_per_capita FLOAT,
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);
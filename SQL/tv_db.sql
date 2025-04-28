DROP DATABASE trafico_vehicular;
CREATE DATABASE IF NOT EXISTS trafico_vehicular;

CREATE TABLE ciudades (
    city_id INT AUTO_INCREMENT,
    estado CHAR(19),
    ciudad CHAR(23) NOT NULL,
    indice_trafico DECIMAL(7,6),
    PRIMARY KEY(city_id)
);

CREATE TABLE inversion (
    city_id INT,
    prop_auto DECIMAL,
    prop_tp DECIMAL,
    presup_tp DECIMAL,
    presup_no_motorizado DECIMAL,
    presup_auto DECIMAL,
    gasto_movilidad DECIMAL,
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE intercensal (
    city_id INT,
    cve_ent INT,
    cve_zm INT,
    pob_zm INT,
    pob_traslado_escuela INT,
    pob_traslado_trabajo INT,
    prop_esc_15 DECIMAL,
    prop_esc_16_30 DECIMAL,
    prop_esc_31_60 DECIMAL,
    prop_esc_61_120 DECIMAL,
    prop_esc_121 DECIMAL,
    prop_trab_15 DECIMAL,
    prop_trab_16_30 DECIMAL,
    prop_trab_31_60 DECIMAL,
    prop_trab_61_120 DECIMAL,
    prop_trab_121 DECIMAL,
    edad CHAR(6),
    transporte CHAR(2),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE ingresos (
    city_id INT,
    ingreso_mensual DECIMAL,
    ingreso_avg_hora DECIMAL,
    edad CHAR(6),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE vtc_desglose(
    city_id INT,
    viajes_totales_diarios DECIMAL,
    tiempo_avg_escuela DECIMAL,
    tiempo_avg_trabajo DECIMAL,
    tiempo_avg_ponderado DECIMAL,
    horas_invertidas_dia DECIMAL,
    dias_año_trafico INT,
    horas_invertidas_año DOUBLE,
    horas_persona_congestion DOUBLE,
    costo_congestion_avg DOUBLE,
    horas_persona_capita DECIMAL,
    costo_congestion_capita DECIMAL,
    edad CHAR(6),
    transporte CHAR(2),
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);

CREATE TABLE ct_ponderado (
    city_id INT,
    costo_per_capita DECIMAL,
    horas_per_capita DECIMAL,
    FOREIGN KEY(city_id) REFERENCES ciudades(city_id)
);
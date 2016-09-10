
*Sociodemográfica (Con estas se seleccionan las variables que permanecen y se le ponen etiquetas)
keep  loc mun est sex eda nac_dia nac_mes nac_anio cs_p13_1 zona salario fac clase1 clase2 pos_ocu rama ing7c rama_est1 rama_est2 sub_o dispo nodispo c_inac5c anios_esc hrsocup ingocup ing_x_hrs t_tra sec_ins cd_a ent con v_sel n_hog h_mud n_ren par_c  l_nac_c cs_p12 cs_p17 n_hij e_con emple7c ambito1 tue2 tue3 d_ant_lab dur_des niv_ins domestico scian emp_ppal tue_ppal cs_p13_2 cs_p14_c cd_a ent con v_sel n_hog h_mud n_ren 

label variable  loc "localidad"
label variable   mun "municipio"
label variable    est"estrato"
label variable   cd_a"Ll-Ciudad autorepresentada"
label variable   ent"Ll-Entidad"
label variable   con"Ll-Control"
label variable   v_sel"Ll-Vivienda seleccionada"
label variable   n_hog"Ll-Numero de hogar"
label variable   h_mud"Ll-Hogar mudado"
label variable   n_ren"Ll-Numero de entrevista"
label variable   sex"sexo"
label variable   par_c"clave de parentesco"
label variable    eda"edad"
label variable    l_nac_c"lugar de nacimiento"
label variable   cs_p12"¿sabe leer y escribir un recado?"
label variable   cs_p13_1"¿hasta que grado aprobo la escuela?"
label variable   cs_p17"¿asiste a la escuela actualmente?"
label variable   n_hij"numero de hijos"
label variable   e_con"estado conyugal"
label variable   zona"zona salarial"
label variable   salario"salario minimo mensual"
label variable   fac"factor de expansion"
label variable   clase1"Clasificación en PEA o PNEA"
label variable   clase2"Clasificación en ocupada, desocupada, disponible y no disponible"
label variable   pos_ocu"posición laboral"
label variable   rama"rama economica"
label variable   ing7c"clasificación por ingreso"
label variable   emple7c"clasificacion por numero de trabajos"
label variable   rama_est1"clasificación por sectores totales"
label variable   rama_est2"clasificación por sectores subtotales"
label variable   ambito1"clasificación sector agropecuario - no agropecuario"
label variable   tue2"clasificacion por tipo de unidad economica - subtotal"
label variable   tue3"clasificacion por tipo de unidad economica - adm gobierno o no"
label variable   d_ant_lab"clasificacion antecedentes - experiencia"
label variable   dur_des"duracion del desempleo"
label variable   sub_o"poblacion subocupada"
label variable   dispo"poblacion PNEA disponible"
label variable    nodispo"poblacion PNEA no disponible"
label variable   c_inac5c"PNEA causa de inactividad"
label variable   niv_ins"nivel de instruccion +5años"
label variable   domestico"clasificacion por condicion de PNEA, PEA y otros"
label variable   anios_esc"años escolaridad"
label variable   hrsocup"horas trabajadas a la semana"
label variable   ingocup"ingreso mensual"
label variable   ing_x_hrs"ingreso por hora trabajada"
label variable   scian"clasificacion de actividad economica por segun el sistema industrial de América del Norte"
label variable   t_tra"total de trabajo"
label variable   emp_ppal"clasificacion en empleos formales e informales"
label variable   tue_ppal"tipo de actividad informal-formal del trabajo principal"
label variable   sec_ins"sector del trabajo principal"
label variable    cs_p13_2"¿hasta que año aprobo la escuela?"
label variable     cs_p14_c"clave de la carrera"

*Quitar el String en cada base
destring, replace

*Género y jefe hogar (Crea las variables de género y jefe de hogar)
gen d_hombre=0
replace d_hombre=1 if  sex==1
gen d_jefe=0
replace d_jefe=1 if  par_c==101
gen edad2= eda* eda
gen d_mujer=0
replace d_mujer=1 if  sex==2
gen varedu=0

*Años educación (Crea la variable añosedu)
g añosedu=0
 replace añosedu=1 if cs_p13_1==1
 replace añosedu=6 if cs_p13_1==2
 replace añosedu=12 if cs_p13_1==3
 replace añosedu=12 if cs_p13_1==4
 replace añosedu=12 if cs_p13_1==5
 replace añosedu=15 if cs_p13_1==6
 replace añosedu=17 if cs_p13_1==7
 replace añosedu=21 if cs_p13_1==8
 replace añosedu=21 if cs_p13_1==9
 replace añosedu=99 if cs_p13_1==99
 tab añosedu
 
*Experiencia (Crea la variable de experiencia)
gen exp= eda- añosedu-6
replace exp=0 if exp<0
gen exp2= exp*exp

*Rama (Genera las dummys por rama de producción)
gen d_agricultura=0
replace d_agricultura =1 if scian==1
gen d_mineria=0
replace d_mineria =1 if scian==2
gen d_electricidad=0
replace d_electricidad =1 if scian==3
gen d_construccion=0
replace d_construccion =1 if scian==4
gen d_manufacturera=0
replace d_manufacturera =1 if scian==5
gen d_comercio=0
replace d_comercio=1 if scian==6
replace d_comercio=1 if scian==7
gen d_transporte=0
replace d_transporte =1 if scian==8
gen d_informacion=0
replace d_informacion =1 if scian==9
gen d_serFinancieros=0
replace d_serFinancieros =1 if scian==10
gen d_serInmobiliarios=0
replace d_serInmobiliarios =1 if scian==11
gen d_serProfesionales=0
replace d_serProfesionales =1 if scian==12
gen d_serApoyo=0
replace d_serApoyo =1 if scian==13
replace d_serApoyo =1 if scian==14
gen d_SerInformacion=0
replace d_SerInformacion =1 if scian==14
gen d_SerEducativos=0
replace d_SerEducativos =1 if scian==15
gen d_SerSalud=0
replace d_SerSalud =1 if scian==16
gen d_SerEsparcimiento=0
replace d_SerEsparcimiento =1 if scian==17
gen d_SerHospedaje=0
replace d_SerHospedaje =1 if scian==18
gen d_SerOtros=0
replace d_SerOtros =1 if scian==19
gen d_ActGubernamentales=0
replace d_ActGubernamentales =1 if scian==20
gen d_ActNoEsp=0
replace d_ActNoEsp =1 if scian==21
*Guardar aquí como Dummie

replace añosedu=. if añosedu==99
replace añosedu=21 if añosedu>21
rename eda edad

*Ojo corregir salario para imputar
sum salario

*Borrar salario minimo
g ingre=ingocup
replace ingre=. if ingocup<920
g lningre= log(ingre)

*Imputar ingresos
mi query
mi set flong
mi register imputed lningre
mi register regular exp exp2 d_hombre añosedu d_jefe 
mi describe
set seed 54433
mi impute regress lningre exp exp2 d_hombre añosedu, add(20) force 
drop if _mi_m~=20
drop _mi_id _mi_miss _mi_m
sum lningre

*Guardar aquí como Imp año



keep if clase1==1
drop if edad<16
drop if edad>62

*Zona rural
gen d_rural=0
replace d_rural=1 if cd_a==81
replace d_rural=1 if cd_a==82
replace d_rural=1 if cd_a==83
replace d_rural=1 if cd_a==84
replace d_rural=1 if cd_a==85
replace d_rural=1 if cd_a==86

*Rango Etario
gen d_menor25=0
replace d_menor25 =1 if edad<25

gen d_25_50=0
replace d_25_50 =1 if edad<50
replace d_25_50 =1 if edad==50
replace d_25_50 =0 if edad<25

gen d_mayor50=0
replace d_mayor50 =1 if edad>50

*Dummie Heckman
gen d_heckman=0
replace d_heckman=1 if clase2==1



*Ingreso real se utilizaron datos de http://www.datosmacro.com/ipc-paises/mexico?sector=IPC+General&sc=IPC-IG&anio=2007
*Seleccione el año de la base y ejecute el código desde gen. El IPC es el interanual a septiembre
2007 gen ipc=1.038
2008 gen ipc=1.055
2009 gen ipc=1.036
2010 gen ipc=1.037
2011 gen ipc=1.038
2012 gen ipc=1.048
2013 gen ipc=1.034
2014 gen ipc=1.042


*Está sacando el ln salario real a partir de la imputación del ln salario nominal
rename lningre lningre_nominal
gen ingreso_nominal=exp(lningre_nominal)
gen ingreso_real=ingreso_nominal/ipc
gen lningre=log(ingreso_real)

*___________________________________ Estimando las tasas ___________________________________

heckman lningre añosedu eduexp exp exp2, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma

*Hallando la minceriana
gen est_lningre= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]

*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduG=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpG=2*_b[exp2]*exp

gen TDKHG=TDañoseduG+TDexpG
sum TDKHG TDañoseduG TDexpG





*Género 
*Para Hombre

heckman lningre añosedu eduexp exp exp2 if d_hombre==1, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma

*Hallando la minceriana
gen est_lningreH= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduH=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpH=2*_b[exp2]*exp

gen TDKHH=TDañoseduH+TDexpH 
sum TDKHH TDañoseduH TDexpH if d_hombre==1

*Para Mujer
heckman lningre añosedu eduexp exp exp2 if d_hombre==0, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma

*Hallando la minceriana
gen est_lningreM= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduM=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpM=2*_b[exp2]*exp

gen TDKHM=TDañoseduM+TDexpM
sum TDKHM TDañoseduM TDexpM if d_hombre==0



*Rango Etario
*Para Menor 25 (usar cuando d_menor25=1)
regress lningre añosedu eduexp exp exp2 if d_menor25==1 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningreM25= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduM25=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpM25=2*_b[exp2]*exp

gen TDKHM25=TDañoseduM25+TDexpM25
sum TDKHM25 TDañoseduM25 TDexpM25 if d_menor25==1

*Para 25-50 (usar cuando d_25_50=1)
regress lningre añosedu eduexp exp exp2 if d_25_50==1 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningre2550= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañosedu2550=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexp2550=2*_b[exp2]*exp

gen TDKH2550=TDañosedu2550+TDexp2550
sum TDKH2550 TDañosedu2550 TDexp2550 if d_25_50==1

*Para Mayor 50 (usar cuando d_mayor50=1)
regress lningre añosedu eduexp exp exp2 if d_mayor50==1 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningreM50= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduM50=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpM50=2*_b[exp2]*exp

gen TDKHM50=TDañoseduM50+TDexpM50
sum TDKHM50 TDañoseduM50 TDexpM50 if d_mayor50==1




*Urbano
*Para urbano (usar cuando d_rural==0)
regress lningre añosedu eduexp exp exp2 if d_rural==0 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningreUrb= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduUrb=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpUrb=2*_b[exp2]*exp

gen TDKHUrb=TDañoseduUrb+TDexpUrb
sum TDKHUrb TDañoseduUrb TDexpUrb if d_rural==0

*Rural
*Para Rural (usar cuando d_rural==1)
regress lningre añosedu eduexp exp exp2 if d_rural==1 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningreRu= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañoseduRu=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexpRu=2*_b[exp2]*exp

gen TDKHRu=TDañoseduRu+TDexpRu
sum TDKHRu TDañoseduRu TDexpRu if d_rural==1






*Sector Primario
regress lningre añosedu eduexp exp exp2 if rama_est1==1 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningre1= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañosedu1=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexp1=2*_b[exp2]*exp

gen TDKH1=TDañosedu1+TDexp1
sum TDKH1 TDañosedu1 TDexp1 if rama_est1==1

*Sector secundario
regress lningre añosedu eduexp exp exp2 if rama_est1==2 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningre2= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañosedu2=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexp2=2*_b[exp2]*exp

gen TDKH2=TDañosedu2+TDexp2
sum TDKH2 TDañosedu2 TDexp2 if rama_est1==2

*Sector terciario
regress lningre añosedu eduexp exp exp2 if rama_est1==3 [aweight = fac], vce(robust)

*Hallando la minceriana
gen est_lningre3= _b[añosedu]*añosedu + _b[eduexp]*eduexp + _b[exp]*exp + _b[exp2]*exp2 +_b[_cons]
 
*tasa de depreciación por un año más de educación - Usa coef. eduexp
gen TDañosedu3=_b[eduexp]*añosedu

*Tasa de Depreciación de la experiencia - usa coef exp2
gen TDexp3=2*_b[exp2]*exp

gen TDKH3=TDañosedu3+TDexp3
sum TDKH3 TDañosedu3 TDexp3 if rama_est1==3





*Observando las tasas
heckman lningre añosedu eduexp exp exp2, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma
heckman lningre añosedu eduexp exp exp2 if d_hombre==1, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma
heckman lningre añosedu eduexp exp exp2 if d_hombre==0, twostep select(d_heckman = exp añosedu d_hombre d_jefe d_rural) rhosigma
regress lningre añosedu eduexp exp exp2 if d_menor25==1 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if d_25_50==1 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if d_mayor50==1 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if d_rural==0 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if d_rural==1 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if rama_est1==1 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if rama_est1==2 [aweight = fac], vce(robust)
regress lningre añosedu eduexp exp exp2 if rama_est1==3 [aweight = fac], vce(robust)


*Estadísticas descriptivas
* Observaciones
tab sex
tab d_menor25
tab d_25_50
tab d_mayor50
tab d_rural
tab rama_est1
tab clase2

*Añosedu (descriptivas)
sum añosedu
sum añosedu if d_hombre==1
sum añosedu if d_hombre==0
sum añosedu if d_menor25==1
sum añosedu if d_25_50==1
sum añosedu if d_mayor50==1
sum añosedu if d_rural==0
sum añosedu if d_rural==1
sum añosedu if rama_est1 ==1
sum añosedu if rama_est1 ==2
sum añosedu if rama_est1 ==3

*Experiencia (descriptivas)
sum exp
sum exp if d_hombre==1
sum exp if d_hombre==0
sum exp if d_menor25==1
sum exp if d_25_50==1
sum exp if d_mayor50==1
sum exp if d_rural==0
sum exp if d_rural==1
sum exp if rama_est1 ==1
sum exp if rama_est1 ==2	
sum exp if rama_est1 ==3

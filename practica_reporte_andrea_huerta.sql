select b.name as car_model, c.name as car_brand, g.name as car_group, a.dt_purchase , a.car_registration , 
d.name as colour, a.km , h.name as insurance_company, f.n_policy  
from practica.cars a
left join practica.car_models b 
on a.id_model = b.id_model 
left join practica.brands c 
on b.id_brand = c.id_brand 
left join practica.colours d 
on a.id_color = d.id_color 
left join practica.hist_cars_policies e
on a.id_car = e.id_car
left join practica.insurance_policies f 
on e.id_policy = f.id_policy
left join practica.companies g
on c.id_company = g.id_company 
left join practica.companies h 
on f.id_insurance_company = h.id_company 
where e.dt_end = '4000-12-31';
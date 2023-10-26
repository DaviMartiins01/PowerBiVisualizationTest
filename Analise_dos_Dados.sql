#Qual hotel atraiu mais crianças?
SELECT  hotel as "Hotel", 
		SUM(children) as "Total de Crianças no Segundo Semestre de 2018" 
        FROM hotel_revenue
GROUP BY hotel;

#Qual mês (no segundo semestre de 2018) cada hotel teve mais reservas efetivadas (O guest apareceu no hotel e saiu do hotel)?
SELECT  hotel as "Hotel", 
        arrival_date_month as "Mês", 
        COUNT(reservation_status) as "Total de Reservas Efetivadas"
        FROM hotel_revenue
WHERE reservation_status = "Check-Out"
GROUP BY hotel, arrival_date_month, reservation_status
ORDER BY CASE WHEN arrival_date_month = "July" then 1
WHEN arrival_date_month = "August" then 2
WHEN arrival_date_month = "September" then 3
WHEN arrival_date_month = "October" then 4
WHEN arrival_date_month = "November" then 5
WHEN arrival_date_month = "December" then 6
ELSE NULL END;

#Nacionalidade que mais visita cada Hotel.
SELECT hotel, country,  COUNT(country) as "Visitantes no Segundo Semestre de 2018" FROM hotel_revenue
WHERE country IS NOT NULL
GROUP BY hotel, country
Order by COUNT(country) DESC
LIMIT 2;

#Qual o hotel tem mais taxa de retorno no segundo semestre de 2018
SELECT hotel, COUNT(is_repeated_guest) FROM hotel_revenue
WHERE is_repeated_guest != 0
Group by hotel, is_repeated_guest;


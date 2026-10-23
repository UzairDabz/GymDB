-- Questions
USE GymDB;
#1 Which members have booked which gym sessions? 
select members.FirstName, members.LastName, sessions.SessionName from members
join Bookings
	on members.MemberID = Bookings.MemberID
join sessions 
	on Bookings.SessionID = Sessions.SessionID;
    
#2 Which trainer is assigned to each session?
select trainers.FirstName, trainers.LastName, sessions.SessionName from sessions
join trainers 
	on sessions.TrainerID = trainers.TrainerID;
    
#3 What payments have members made?
select members.FirstName, members.LastName, payments.Amount from Members
join payments
	on members.MemberID = Payments.MemberID;
    
#4 How many sessions has each member booked?
select members.FirstName, members.LastName, count(Bookings.memberID) as Total_Sessions From members
join Bookings
	on members.MemberID = Bookings.MemberID
group by members.memberID;
			
#5 Which members have paid more than 600 in total?
select members.FirstName, members.LastName, sum(payments.Amount) as TotalSpent from members
join Payments
	on members.memberID = Payments.memberID
    group by members.memberID
    having sum(payments.Amount) > 600;
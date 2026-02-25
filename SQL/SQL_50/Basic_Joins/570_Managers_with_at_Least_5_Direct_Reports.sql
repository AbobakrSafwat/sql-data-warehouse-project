Select e1.name
From Employee e1
Left JOIN Employee e2
ON e2.managerId = e1.id
GROUP BY e1.id, e1.name
HAVING Count(e2.id) >= 5
function [wedge] = insertwedge(historical, business)
baseline = historical(end, 2);
wedge = business;
for n = 1:50
    wedge(n,2) = wedge(n,2) -  (wedge(n,2)- baseline)/15;
end

end
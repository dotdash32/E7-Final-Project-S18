function [historical, business] = inserthistorical(historical, syr, eyr)
%text is historical.txt in a struct array?

%text = cell2mat(struct2cell(historical);
text = historical;
%for testing purposes, text in array format
[n,m] = size(text);
for sindex = 1:n
    if text(sindex,1) == syr 
        break
    end
end
for eindex = sindex:n
    if text(eindex,1) == eyr
        break
    end
end

%plot( text((sindex:eindex), 1) , text(sindex:eindex,2) );
%xlabel('year'); %label of struct array
%ylabel('fossil fuel and industry GtC/yr'); %label of struct array
%xlim([syr (eyr+50)]);

historicalplot = text(sindex:eindex, :);

%estimate business as usual **doubles every 50 years
business = zeros(50,2);
for n = 1:50
    business(n,1) = eyr+n;
    business(n,2) = text(eindex+n-51,2) * 2;
end
%plot( business(:, 1), business(:,2) );
end


    
function [fig] = plothistorical(historical, syr, eyr)
%text is historical.txt in a struct array?

%text = cell2mat(struct2cell(historical);
text = historical
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

sindex
eindex

plot( text((sindex:eindex), 1) , text(sindex:eindex,2) );
xlabel('year'); %label of struct array
ylabel('fossil fuel and industry GtC/yr'); %label of struct array
xlim([syr (eyr+50)]);

%estimate business as usual **doubles every 50 years

end

    
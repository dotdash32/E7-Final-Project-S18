function [fig] = plotting(historical, business, wedge);
historical
business
wedge
plot( historical(:, 1) , historical(:,2) );
xlabel('year'); %label of struct array
ylabel('fossil fuel and industry GtC/yr'); %label of struct array
xlim([historical(1,1) (historical(end, 1) + 50)]);

plot( business(:, 1), business(:,2) );

%loop length of varargin for multiple wedges
plot( wedge(:,1), wedge(:,2) )
end
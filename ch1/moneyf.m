function [output] = moneyf(x)
    output=(300/(x/12))*((1+(x/12))^240-1)*(1+x/12);
end


am = zeros(151);
for i=1:length(list_falloutnv)
    for k = list_falloutnv{i,1}
%         am(i,k) = 1;
        am(i,k) = c2(i);
    end
end

for i = 1:length(list_falloutnv)
    for k = 1:i
        am(i,k) = am(k,i);
    end
end
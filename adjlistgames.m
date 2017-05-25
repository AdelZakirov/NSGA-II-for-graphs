i = 0;
f = falloutnv;
f{1,1} = f{1,1}(2:end);
f{1,end} = f{1,end}(1:end-2);
list = cell(1,length(f))';

for k = 1:length(f)
    ff = f{1,k};
    ind_eq = find(ff == '=');
    ind_com = find(ff == ',');
    ind = [ind_eq, ind_com, length(ff)+1];
    num = [];
    for i=1:length(ind)-1
        num = [num, str2num(ff(ind(i)+2:ind(i+1)-1)) + 1];
    end

    list{str2num(ff(1:ind_eq-1))+1} = num;
end

last_res = res800.pops(end,:);
filename_obj = strcat('ecoli/obj.txt');
obj_write = [];
for i = 1:length(last_res)
    filename_ch = strcat('ecoli/chromosome_',int2str(i),'.txt');
    chromosome = last_res(i).var;
    obj = last_res(i).obj;      
    if(last_res(i).rank == 1)
        fileID_ch = fopen(filename_ch,'w');
%         fileID_obj = fopen(filename_obj,'w');
        fprintf(fileID_ch,'%i\n',chromosome);
%         fprintf(fileID_obj,'%i\t',obj);
        fclose(fileID_ch);
%         fclose(fileID_obj);
        obj_write = [obj_write; obj];
    end
end
fileID_obj = fopen(filename_obj,'w');
fprintf(fileID_obj,'%12.8f%12.8f\n',obj_write') ;
fclose(fileID_obj);
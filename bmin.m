function [posm,men] = bmin(dist,pos,dio,poo)
    global volume
    men=dio;
    posm=poo;
    var=1;
    control=0;
    for i=1:length(dist)
       aux2(:)=pos(i,:);

        if i==var && volume(aux2(1),aux2(2),aux2(3))==255
           men=dist(i);
           posm=i;
           control=1;
        else
            if volume(aux2(1),aux2(2),aux2(3))==0 || volume(aux2(1),aux2(2),aux2(3))==180 && control==0 && i<26
                 var=var+1;
            else
                if i>var
                    if dist(i)<men && volume(aux2(1),aux2(2),aux2(3))==255
                       men=dist(i) ;
                       posm=i;
                    end
                end
            end
        end
    end

end


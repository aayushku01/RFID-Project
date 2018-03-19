%n = 3;
%Q = [0,0,0];
tags = [];
ST = [];
avg = 0;
for n = 0:4:8
    %while avg <= 5
        Q = randi(0:1,1,n);
        Tc = zeros(size(Q));
        F = zeros(size(Q));
        ID = zeros(size(Q));
        SID = zeros(size(Q));
        a = 0;
        for i = 1:n
            while Q(i) ~= 'y'
                A = [];
                B = [];
                for o = 1:n
                    if Q(o)==0
                        A = [A,o];
                    elseif Q(o) ==1
                        B = [B,o];
                    end
                end
                if length(A) > 1
                    for k = A
                        Q(k) = randi(0:1);
                        %a= a+1;
                    end
                elseif length(A)== 1
                    for k = A
                        Tc(k) = Tc(k)+Q(k);
                        F(k) = 1;
                        Q(k) = 'y';
                        SID(k) = randi([0 65535]);
                        a=a+1;
                    end
                end
                if length(B) > 1
                    for k = B
                        Q(B) = randi(0:1);
                        %a=a+1;
                    end
                elseif length(B)== 1
                    for k = B
                        Q(k) = randi(0:1);
                        a=a+1;
                        if Q(k) ==0
                            Tc(k) = Tc(k)+Q(k);
                            F(k) = 1;
                            Q(k) = 'y';
                            SID(k) = randi([0 65535]);
                            a=a+1;
                        end
                    end
                end
                for k = A
                    for j = A
                        if k ~= j
                            if SID(k) == SID(j)
                                F(k) = 0;
                                Q(k) = randi(0:1);
                                Tc(k) = 0;
                            end
                        end
                    end
                end
                for k = 1:n
                    if Tc(k)==0 && F(k)==1
                        ID(k) = 1;
                        Tc(k) = Tc(k) - 1;
                        F(k) = 'y';
                        a = a+1;
                        for j = 1:n
                            if Tc(j)>0
                                Tc(j) = 0;
                            end
                        end
                    end
                end
            end
        end
        %ST = [ST,n/a]
        %tags = [tags,n];
    %end
    %avg = avg + 1;
    ST = [ST,n/a]
    tags = [tags,n];
end
plot(tags,ST,'g--s')
ylim([0 0.5])
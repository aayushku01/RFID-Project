%n = 3;
tags1 = []; %fOR pLOT
ST1 = [];    %For Plot System Throughput
for n = 1000:150:2200
    A=[];   %For maintaining Records Of SC <=0
    B=[];   %For making SC=0
    a=0;    %For counting slots
    %Q=randi([0 15]); %Random Q gen
    Q = 4;
    SC = randi([0 (2^(Q)-1)],1,n); %Random No generator
    %SC = [0,0,1]
    TR = zeros(size(SC));   %For Making the tag silent after inventory
    for i = 1:n
        while TR(i) ~= 'x'
            for k = 1:n
                if SC(k) == 0
                    TR(k) = 1;
                    B = [B,k];
                    %C = [C,k]
                    a=a+1;
                end
            end
            if length(B) == 1
                for e = B
                    TR(e) = 'x';
                    A = [A,e];
                    SC = SC - 1;
                    B = [];
                end
            elseif length(B) > 1
                a=a+1;
                Q = min(15,Q+(0.1+(rand(1,1))*(0.5-0.1)));
                if length(A) > 0
                    for j = 1:n
                        %if length(A) > 0
                        %for l = A
                        if SC(j) >= 0
                            SC(j) = randi([0 (2^(fix(Q))-1)]);
                        end
                        %end
                    end
                elseif length(A) == 0
                    for j = 1:n
                        SC(j) = randi([0 (2^(fix(Q))-1)]);
                    end
                end
                B = [];
            elseif isempty(B)
                a=a+1;
                Q=max(0, Q-(0.1+(rand(1,1))*(0.5-0.1)));
                if length(A) > 0
                    for j = 1:n
                        %if length(A) > 0
                        %for l = A
                        if SC(j) >= 0
                            SC(j) = randi([0 (2^(fix(Q))-1)]);
                        end
                        %end
                    end
                elseif length(A) == 0
                    for j = 1:n
                        SC(j) = randi([0 (2^(fix(Q))-1)]);
                    end
                end
            end
        end
    end
    ST1 = [ST1,n/a]
    tags1 = [tags1,n];
end
plot(tags1,ST1,'g--s')
ylim([0 0.42])
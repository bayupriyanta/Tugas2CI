%Algoritma Genetika 
%Ida Bagus Gede Bayu Priyanta
%388482

%Variabel Algen
popsize=10;
kromsize=3;
populasi=zeros(popsize,kromsize);
fitnes=zeros(popsize,1);
probmutasi=0.2;
penunjukmutasi=0;
probcrossover=0.6;
crossoveroperator=[0 1 0];
parent=zeros(probcrossover*popsize,kromsize);
offspring=zeros(probcrossover*popsize,kromsize);
offspringfitness=zeros(probcrossover*popsize,1);
allgeneration=zeros(popsize+(probcrossover*popsize),kromsize);
allgenerationfitness=zeros(popsize+(probcrossover*popsize),1);
bantuansort=zeros(popsize+(probcrossover*popsize),kromsize+1);


%inisialisasi populasi awal
for i=1:popsize
    for j=1:kromsize
        if(j==1)
            populasi(i,j)=(rand(1)*100)+20;
        elseif(j==2)
            populasi(i,j)=(rand(1)*80);
        else
            populasi(i,j)=(rand(1)*100);
        end
            
    end
end


%Proses Iterasi
max=5000;
for iterasi=1:max
    
    %penalty boundary & Pemberian nilai Fitness Populasi
    for i=1:popsize
        if(populasi(i,1)<20||populasi(i,2)>80)
            fitnes(i,1)=0;
        else
            fitnes(i,1)= (120*populasi(i,1))+ (150*populasi(i,2)) + (25*populasi(i,3));
        end
    end 
    

    %Pemberian porsi terpilih dalam Roulette Wheel
    porsiparent=zeros(popsize,1);
    for i=1:popsize
        if(i==1)
            porsiparent(i,1)=fitnes(i,1)/sum(fitnes);
        else
            porsiparent(i,1)=porsiparent(i-1,1)+(fitnes(i,1)/sum(fitnes));
        end

    end
   
    %Pemutaran Roulette Wheel
    for i=1:(probcrossover*popsize)
        dart=rand();
        j=1;
        while(dart>porsiparent(j,1))
            j=j+1;
        end
        parent(i,:)=populasi(j,:);    
    end
    
    
    %Proses Crossover dari Parent terpilih
    par1=1;
    par2=2;
    while(par1<=5)
        for cekflag=1:kromsize
            if(crossoveroperator(1,cekflag)==1)
                offspring(par1,cekflag)=parent(par2,cekflag);
                offspring(par2,cekflag)=parent(par1,cekflag);
            else
                offspring(par1,cekflag)=parent(par1,cekflag);
                offspring(par2,cekflag)=parent(par2,cekflag);
            end
        end
        par1=par1+2;
        par2=par2+2;
    end
    
    %Proses Mutasi Individu di populasi awal
    for i=1:probmutasi*popsize
        
        penunjukmutasi=round(rand(1)*kromsize*popsize);
        
        %pencarian gen termutasi
        baris=1;
        kolom=1;
        j=1;
        while(j<penunjukmutasi)
            j=j+1;
            if(mod(j,kromsize)==0)
                baris=baris+1;
                kolom=1;
            else
                kolom=kolom+1;
            end
        end
        
        %Pembangkitan nilai gen secara acak
        populasi(baris,kolom)=rand(1)*100;
        
    end
    
    %Penggabungan dan pengurutan offspring dari crossover dengan populasi awal
    for i=1:popsize+(probcrossover*popsize)
        if(i<=popsize)
            allgeneration(i,:)=populasi(i,:);
        else
            allgeneration(i,:)=offspring(i-popsize,:);
        end
    end
    
    %Perhitungan nilai fitness seluruh individu
    for i=1:popsize+(probcrossover*popsize)
        if(allgeneration(i,1)<20||allgeneration(i,2)>80)
            allgenerationfitness(i,1)=0;
        else
            allgenerationfitness(i,1)= (120*allgeneration(i,1))+ (150*allgeneration(i,2)) + (25*allgeneration(i,3));
        end        
    end
    
    %sorting seluruh generasi sesuai nilai fitness
    for i=1:kromsize+1;
        if(i==kromsize+1)
            bantuansort(:,i)=allgenerationfitness(:,1);
        else
            bantuansort(:,i)=allgeneration(:,i);
        end
    end
    bantuansort=sortrows(bantuansort,kromsize+1); %hanya bisa ascending, jadi individu terbaik ada di matrix terbawah
    
    %Proses Elitism dengan memilih 10 (Jumlah populasi awal) individu dengan Nilai Fitness tertinggi 
    i=1;
    j=popsize+(probcrossover*popsize);
    while(i<=popsize)
        populasi(i,1)=bantuansort(j,1);
        populasi(i,2)=bantuansort(j,2);
        populasi(i,3)=bantuansort(j,3);
        j=j-1;
        i=i+1;
    end
    %Populasi sudah terurut secara Descending Kembali
    
end

%Cetak Solusi
clc;
disp('Solusi adalah : ');
disp('X =');
disp(populasi(1,1));
disp('Y =');
disp(populasi(1,2));
disp('Z =');
disp(populasi(1,3));
disp('Dengan nilai fitness : ');
disp(bantuansort(popsize+(probcrossover*popsize),kromsize+1));
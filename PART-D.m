%CHE 636A TERM PROJECT
% PART (D) 
close all;
clc
%GIVEN DATA
N=100; %Number of nodes 
tmax=60000;%final time
L=1000; %Length of reservoir
dx=L/N;%step size
dy=100; %width of reservoir
h=10; %thickness of reservoir
phi=0.1; %porosity
vt=(dx*dy*h); %Reservoir volume
vp=phi*vt; %pore volume
ct=2*10^-9; %Total compressibility
Pin=13*10^6; %Initial Pressure
prompt = "Enter the value of Viscosity in Pa.s = ";
myu = input(prompt);%Enter 0.01 and 0.001
Qvalue = -5; % Constant flow production
J=1.3*10^-10; %Productivity index
k=9.6*10^-14; %Permeability
pbhp=0.1*10^-6; %Bottom hole pressure
dt=50; %given

nt=round((60000/dt),0)+1;%Number of time steps

   
Pres=zeros(nt,N); % Pressure matrix
Pres(1,:)=Pin; %initialising pressure.

%Solve by Implicit method AX=B in this case TxPr=b;

%Creating Tx matrix    
Tx=zeros(N,N);
k_array = zeros(1,100);
    m_array = zeros(1,100); %To store variable mi values bcoz of variable k
for i=1:100
k_array(1,i) =k*( 1-(0.9*(i/N)) );
end
temp = (2*h*dy)/(myu*dx);
m_array = temp*k_array;
txminus1by2=0;
tx1by2=0;

    
    for l=1:N
        if l<N
            tx1by2= (m_array(l)*m_array(l+1))/(m_array(l)+m_array(l+1));
        else
            tx1by2=0;
        end
    
        Tx(l,l)=((txminus1by2 +tx1by2) + ((vp*ct)/dt));
        if l==N
            Tx(N,N-1)=-1*txminus1by2;
            Tx(l,l)=((vp*ct)/dt)+(txminus1by2 + tx1by2);

        elseif l==1
            Tx(1,2)=-1*tx1by2;
            Tx(l,l)=((vp*ct)/dt)+ (txminus1by2 + tx1by2);
        else
            Tx(l,l-1)=-1*txminus1by2;
            Tx(l,l+1)=-1*tx1by2;
        end
        txminus1by2=tx1by2;
    end
   %Creating b matrix 
   b=zeros(N,1);
   
                
    for g=2:nt
        for l=1:N
            if l==N
                b(l,:)=Pres(g-1,l)*((vp*ct)/dt)+Qvalue;
                %well at last grid block const flow condition
            elseif l==1
                b(l,:)=Pres(g-1,l)*((vp*ct)/dt);
                
            else
                b(l,:)=Pres(g-1,l)*((vp*ct)/dt);
            end
        end
       
    Pr=Tx\b; %Calculating solution 
    Pres(g,:)=Pr; %Matrix to plot for time steps
    end
    

P1_plot = linspace(0,tmax,nt);
plot(P1_plot,Pres(:,end),'-r');
grid on;
title('(D) Pressure variation with time for last gridblock myu = ',num2str(myu));
xlabel("Time (seconds)");
ylabel("Pressure (Pa)");
hold on;



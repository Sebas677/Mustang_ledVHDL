library IEEE;
use IEEE.std_logic_1164.all;

entity 	FINAL_CAR is port 
	(clk, rst, vi, vd, int, enc: in std_logic;
     LD, LI : out std_logic_vector (3 downto 0)
);
end entity;

architecture  procc of FINAL_CAR is 
	type stateType is (S0,S1,S2,S3,S4,S5,S6,S7,S8);
    signal currentState, nextState : stateType;
	 signal count: integer:=1;
begin
	internProcess: process (rst, clk)
    begin
      if rst ='1' then
          currentState <=S0;
      elsif (rising_Edge(clk)) then
			count <=count+1;
			if (count =25000000) then
				count <=1;
				currentState<=nextState;
			end if;
      end if;
    end process internProcess;
    
    activeProcess : process (currentState, vi, vd, int)
    begin
    	nextState <= currentState;
        LD<="0000";
        LI<="0000";
    case currentState is

    	when s0 => --TODO APAGADO
        
        LI<="0000";
        LD<="0000";
		  
		  if enc='1' then
			nextState<=s7;
			
			--elsif vi='1' then
				--nextState <= S3;
			--elsif vd='1' then
				--nextState <= S4;
			elsif int='1' then
				nextState <= s7;
				
				
			  
         else 
         	nextState <=S0;
         end if;
        
        
        when s1 => --IZQUIERDO IZQ ENCENDIDO
        
        LI<="1111";
        LD<="0001";
        
        if vi='1' then
        	nextState <= S7;
            
         else 
         	nextState <=S0;
         end if;
        
        when s2 => --IZQUIERDO EN MEDIO ENCENDIDO
        
        LI<="0111";
        LD<="0001";

        
        if vi='1' then
        	nextState <= S1;
			
         else 
         	nextState <=S0;
         end if;
        
        when s3 => --IZQUIERDO DER ENCENDIDO
        
        LI<="0011";
        LD<="0001";

        
        if vi='1' then
        	nextState <= S2;
            
         else 
         	nextState <=S0;
         end if;
        
        when s4 => --DERECHO IZQ ENCENDIDO

        
        LI<="0001";
        LD<="1001";

        if vd ='1' then
         	nextState <= S5;
            
         else 
         	nextState <=S0;
            
         end if;
        
        when s5 => --DERECHO MEDIO ENCENDIDO
        
        LI<="0001";
        LD<="1101";
        

        if vd='1' then
         	nextState <= S6;
            
         else 
         	nextState <=S0;
            
         end if;
        
        when s6 => --DERECHO DER ENCENDIDO
        
        LI<="0001";
        LD<="1111";

        

         if vd='1' then
         	nextState <= S7;
            
         else 
         	nextState <=S0;
            
       	end if;
        
        when s7 => --CONTORNO DE AMBOS ENCENDIDO
        
        LI<="0001";
        LD<="0001";
        
        if enc='1' then
			nextState <=currentState;
		  
			if int='1' then
         	nextState <= s8;
         elsif vi='1' then
        		nextState <= S3;
			elsif vd='1' then
         		nextState <= S4;         
         end if;
             
        
         else 
         	nextState <=S0;
         end if;
        
        when s8 => --TODO ENCENDIDO
        
        LI<="1111";
        LD<="1111";

        
            
        if int='1' then
         	nextState <= s7;
            
         else 
         	nextState <=S0;
            
         end if;
        
        
        when others =>
        	nextState<=S0;
    end case;
    end process activeProcess;
end procc;
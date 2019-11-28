
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity clk_div is
    Port ( clk : in STD_LOGIC;
           clk1 : buffer STD_LOGIC :='1';  --saida de 2MHz
           clk2 : buffer STD_LOGIC :='1';  -- saia de 100Hz
           clk3 : buffer STD_LOGIC :='1'  -- saida de 2Hz 
           );  
           
end clk_div;

architecture Behavioral of clk_div is
    signal contador1 : integer :=0;
    signal contador2 : integer :=0;
    signal contador3 : integer :=0; 
    
    
begin
-- sinais de clock clk_div
    process(clk)
    begin
        if rising_edge(clk) then
            if contador1 < 25-1 then -- contador para sinal de 2MHz
                contador1 <= contador1 + 1;
            else
                clk1<= not clk1; 
                contador1<=0;
            end if;
        end if;
        
    end process;
    
    process(clk1)
    begin
        if rising_edge(clk1) then
            if contador2< 10000-1 then -- contador para sinal de 100Hz
                    contador2<= contador2+1;
                    
                    else
                        clk2 <= not clk2;
                        contador2 <= 0;
                        
            end if;
        end if;
        
    end process;
    
    process(clk2)
    begin
        if rising_edge(clk2) then
            if contador3 < 24 then -- contador para sinal de 2Hz
                contador3 <= contador3 + 1;
                else
                    clk3 <= not clk3;
                    contador3 <= 0;
                    
            end if;   
         end if;
         
    end process;
    
  
    
end Behavioral;

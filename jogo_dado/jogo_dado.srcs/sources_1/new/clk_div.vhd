
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity clk_div is
    Port ( clk : in STD_LOGIC;
           clk1 : buffer STD_LOGIC :='0';  --saida de 2MHz
           clk2 : buffer STD_LOGIC :='0';  -- saia de 100Hz
           clk3 : buffer STD_LOGIC :='0'  -- saida de 2Hz 
           );  
           
end clk_div;

architecture Behavioral of clk_div is
    signal contador1 : integer :=0;
    signal contador2 : integer :=0;
    signal contador3 : integer :=0; 
    
    
begin
-- sinais de clock clk_div
    process(clk, clk1, clk2, clk3)
    begin
        if rising_edge(clk) then
            if contador1 < 50 then -- contador para sinal de 2MHz
                contador1 <= contador1 + 1;
            else
                contador1<=0;
                clk1<= not clk1;
                if contador2< 20000 then -- contador para sinal de 100Hz
                    contador2<= contador2+1;
                    else
                        contador2 <= 0;
                        clk2 <= not clk2;
                        if contador3< 50 then -- contador para sinal de 2Hz
                            contador3 <= contador3 + 1;
                            else
                                contador3 <= 0;
                                clk3 <= not clk3;
                        end if;        
                end if;    
            end if;
        end if;
    end process;
    
    
end Behavioral;

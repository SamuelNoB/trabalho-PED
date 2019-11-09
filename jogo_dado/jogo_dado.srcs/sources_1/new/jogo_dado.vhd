
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity jogo_dado is
    Port ( signal clk : in STD_LOGIC;
           clk1 : inout STD_LOGIC;  --saida de 2MHz
           clk2 : inout STD_LOGIC;  -- saia de 100Hz
           clk3 : inout STD_LOGIC;  -- saida de 2Hz 
           jogador1 : in std_logic;
           jogador2 : in std_logic;
           load1: inout std_logic := '1';
           load2: inout std_logic := '0';
           chTime : inout std_logic;
           time1, time2 : buffer std_logic
           );  
           
end jogo_dado;

architecture Behavioral of jogo_dado is
    signal contador1 : integer :=0;
    signal contador2 : integer :=0;
    signal contador3 : integer :=0; 
    constant T : bit := '1';
    
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
    
    process(jogador1, jogador2) -- componente num_load
    begin
        load1 <= jogador1 and time1;
        load2 <= jogador2 and time2;
        
        chTime <= load1 nor load2;
        time1 <= not time2;
        
    end process;
    
    process(chTime) -- componente parte de num_load
    begin
        if (chTime'event and chTime = '0') then  
            time2<= not time2;
            time1 <=not time1;
        end if;
    end process;
    
    
end Behavioral;

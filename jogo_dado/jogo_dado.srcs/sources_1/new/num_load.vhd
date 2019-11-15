
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity num_load is
    Port (
    jogador1 : in std_logic;
    jogador2 : in std_logic;
    load1: inout std_logic;
    load2: inout std_logic;
    time1: out std_logic 
     );
end num_load;

architecture Behavioral of num_load is
    --constant T : bit := '1';
    signal chTime : std_logic;
    signal time1_temp : std_logic :='1';
    signal time2 : std_logic :='0';
begin

    
    process(jogador1, jogador2)  -- componente num_load
    begin
        load1 <= jogador1 and time1_temp;
        load2 <= jogador2 and time2;
        
    end process;
    
    chTime <= load1 or load2;
    
    process(chTime) -- componente parte de num_load
    begin
        if (chTime'event and chTime = '0') then  
            time2<= not time2;
            time1_temp <=not time1_temp;
            time1 <= time1_temp;
        end if;
    end process;
end Behavioral;

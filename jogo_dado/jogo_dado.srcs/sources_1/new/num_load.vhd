
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity num_load is
    Port (
    jogador1 : in std_logic;
    jogador2 : in std_logic;
    load1: inout std_logic;
    load2: inout std_logic;
    chTime : buffer std_logic := '0';
    time1: buffer std_logic := '1';
    time2 : buffer std_logic := '0' 
     );
end num_load;

architecture Behavioral of num_load is
    --constant T : bit := '1';
begin
    
    process(jogador1, jogador2)  -- componente num_load
    begin
        load1 <= jogador1 and time1;
        load2 <= jogador2 and time2;
        
        chTime <= load1 or load2;
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

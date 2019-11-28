

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity num_load_tb is
end num_load_tb;

architecture Behavioral of num_load_tb is
 component num_load
 port(
    jogador1 : in std_logic :='0';
    jogador2 : in std_logic :='0';
    load1: buffer std_logic :='0';
    load2: buffer std_logic :='0';
    time1: buffer std_logic 
 );
 end component;
 
    signal jogador1 : std_logic := '0' ;
    signal jogador2 : std_logic :='0';
    
    signal load1 : std_logic :='0';   
    signal load2 : std_logic :='0';
    signal time1 : std_logic :='1';
 
begin
    loader:  num_load port map(
        jogador1 => jogador1,
        jogador2 => jogador2,
        load1 => load1,
        load2 => load2,
        time1 => time1
    );
    
    estimulo: process
    begin
        
        wait for 100 ns;
        jogador1 <= '1';
        wait for 100 ns;
        jogador1 <= '0';
        wait for 50 ns;
        jogador2 <= '1';
        wait for 100 ns;
        jogador2 <= '0';
         wait for 50 ns;
         jogador2 <= '1';
        wait for 100 ns;
        jogador2 <= '0';
         wait for 50 ns;
        jogador1 <= '1';
        wait for 100 ns;
        jogador1 <= '0';
        wait for 50 ns;
        jogador1 <= '1';
        wait for 100 ns;
        jogador1 <= '0';

        wait;
        
    end process;


end Behavioral;

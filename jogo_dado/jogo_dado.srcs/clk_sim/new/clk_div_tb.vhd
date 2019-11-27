-- feito por Samuel Nogueira Bacelar
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity clk_div_tb is
end clk_div_tb;

architecture Behavioral of clk_div_tb is
    
    component clk_div
    port(
           clk : in STD_LOGIC :='0';
           clk1 : buffer STD_LOGIC :='1';  --saida de 2MHz
           clk2 : buffer STD_LOGIC :='1';  -- saia de 100Hz
           clk3 : buffer STD_LOGIC :='1' 
    );
    end component;

    signal clk: std_logic :='0';
    signal clk1: std_logic :='0';
    signal clk2: std_logic :='0';
    signal clk3: std_logic :='0';

    constant clk_period : time:= 10 ns; -- clk 100 MHz

begin
    divisor_clock: clk_div
    port map(
        clk=> clk,
        clk1=>clk1,
        clk2=>clk2,
        clk3=>clk3
    );

    clk_process: process
    begin
        clk<='0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;

end Behavioral;

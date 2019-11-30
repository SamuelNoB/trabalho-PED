library ieee;
use ieee.std_logic_1164.all;

entity num_gen_tb is
end num_gen_tb;
architecture Behavioral of num_gen_tb is
component num_gen
 Port ( 
    clk1 : in STD_LOGIC;
    load1 : in STD_LOGIC;
    load2 : in STD_LOGIC;
    num1, num2 : out STD_LOGIC_VECTOR(2 DOWNTO 0) 
 );
end component;

    signal clk1: std_logic :='0';
    signal load1, load2: std_logic :='0';
    signal num1, num2: std_logic_vector(2 downto 0) :="000";
    constant clk1_period : time := 500 ns;

begin

num_geneator:  num_gen port map(

        clk1 => clk1,
        load1 => load1,
        load2 => load2,
        num1 => num1,
        num2 => num2
);

 clk1_process :process
    begin 
        clk1 <= '0';
        wait for clk1_period/2;
        clk1 <= '1';
        wait for clk1_period/2;
    end process;
    
    load_process :process
    begin 
        load1<='1';
        load2<='0';
        wait for 1ms;
        load1<='0';
        wait for 1ms;
        load2<= '1'; 
        wait for 1ms;
        load2<= '0';
        wait for 1ms;
        load1 <= '1';
        wait for 1ms;
        load1<= '0';
        wait for 500 us;
        load2<= '1';
        wait for 1 ms;
        load2<='0';
        wait;
        
    end process;
    
end Behavioral;
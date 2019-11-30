library Ieee;
use ieee.std_logic_1164.all;

entity referee_tb is
end referee_tb;

architecture Behavioral of referee_tb is
 component referee

    Port ( num1 : in STD_LOGIC_vector(2 downto 0);
           num2 : in STD_LOGIC_vector(2 downto 0);
           time1, clk3 : in std_logic;
           val1, val2: out STD_LOGIC_vector(2 downto 0)
           );
end component;


   signal num1 : STD_LOGIC_vector(2 downto 0):="000";
   signal num2 : STD_LOGIC_vector(2 downto 0):="000";
   signal time1: std_logic := '1';
   signal clk3 : std_logic := '0';
   signal val1, val2: STD_LOGIC_vector(2 downto 0) := "000";

constant clk3_period : time := 500 ms;

begin

referencia:  referee port map(
    num1 => num1,
    num2 => num2,
    time1 => time1,
    clk3 => clk3,
    val1 => val1,
    val2 => val2

);

clk3_process :process
begin 
    clk3 <= '0';
    wait for clk3_period/2;
    clk3 <= '1';
    wait for clk3_period/2;
end process;


estimulos : process
begin
    num1 <= "110";
    time1 <='0';
    wait for 100 ms;
    num2 <= "101";
    time1 <='1';
    wait for 2000 ms;
    num1 <= "001";
    time1 <='0';
    wait for 100 ms;
    num2 <= "110";
    time1 <='1';
    wait for 2000 ms;
    wait;
end process;

end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder_tb is
end decoder_tb;

architecture Behavioral of decoder_tb is

component decoder
     Port ( clk2: IN STD_LOGIC ;
            val1 : in STD_LOGIC_VECTOR (2 downto 0);
            val2 : in STD_LOGIC_VECTOR (2 downto 0);
            an : out std_logic_vector(3 downto 0);
            seg : out STD_LOGIC_VECTOR (6 downto 0) 
    ); 
end component;


    signal clk2: STD_LOGIC ;
    signal val1 :  STD_LOGIC_VECTOR (2 downto 0);
    signal val2 :  STD_LOGIC_VECTOR (2 downto 0);
    signal an :  std_logic_vector(3 downto 0);
    signal seg :  STD_LOGIC_VECTOR (6 downto 0);
    
    constant clk_period : time:= 10 ms; -- clk 100 MHz
begin

    decodificador: decoder
    port map(
    clk2 =>clk2,
    val1 =>val1,
    val2=>val2,
    an=>an,
    seg=>seg
    );
    
    clk_process: process
    begin
        clk2<='0';
        wait for clk_period/2;
        clk2<='1';
        wait for clk_period/2;
    end process;

    decoder_process: process
    begin
        wait for 50 ms;
        val1 <="110";
        val2 <="001";
        wait for 50 ms;
        val1 <="001";
        val2 <="110";
        wait for 50 ms;
        val1 <="101";
        val2 <="010";
        wait for 50 ms;
        val1 <="010";
        val2 <="011";
        
    end process;


end Behavioral;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity decoder is
    Port ( clk2: IN STD_LOGIC ;
            val1 : in STD_LOGIC_VECTOR (2 downto 0);
            val2 : in STD_LOGIC_VECTOR (2 downto 0);
            an : out std_logic_vector(3 downto 0);
            seg : out STD_LOGIC_VECTOR (6 downto 0) ); 
end decoder;

architecture Behavioral of decoder is

signal BCDin : STD_LOGIC_VECTOR (2 downto 0);

begin

an(2 downto 1) <="11";
an(0) <= clk2;
an(3) <= not clk2;

BCDin <= val1 when clk2='1'else
        val2 when clk2='0';

    process(BCDin)
        begin       
        case BCDin is
        when "001" =>
        seg <= "0111111"; ---1
        when "010" =>
        seg <= "1110110"; ---2
        when "011" =>
        seg <= "0110110"; ---3
        when "100" =>
        seg <= "1001001"; ---4
        when "101" =>
        seg <= "0001001"; ---5
        when "110" =>
        seg <= "1000000"; ---6
        when others =>
        seg <= "1111111"; ---null
        end case;
         
    end process;

end Behavioral;

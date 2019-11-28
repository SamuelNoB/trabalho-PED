
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

    process(clk2)
    begin
        case clk2 is
        when '0' =>
            an <= "1110";
            BCDin <= val2;
        when '1'=>
            an <= "0111";
            BCDin <= val1;
        when others =>
             an <= "1111";
        end case;
    end process;
        
    process(BCDin)
        begin
         
        case BCDin is
        when "001" =>
        seg <= "1111110"; ---1
        when "010" =>
        seg <= "0110111"; ---2
        when "011" =>
        seg <= "0110110"; ---3
        when "100" =>
        seg <= "1001001"; ---4
        when "101" =>
        seg <= "1001000"; ---5
        when "110" =>
        seg <= "0000001"; ---6
        when others =>
        seg <= "1111111"; ---null
        end case;
         
    end process;

end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.11.2019 08:09:32
-- Design Name: 
-- Module Name: decoder - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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
        if clk2 = '0' then
            an <= "1110";
            BCDin <= val2;
                else if clk2 = '1' then
                    an <= "0111";
                    BCDin <= val1;
                end if;
        end if;
        
    --BCDin <=   w0 WHEN "000" ;
        --w1 WHEN OTHERS ;
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

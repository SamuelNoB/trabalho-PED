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
            val1 : in STD_LOGIC_VECTOR (3 downto 0);
            val2 : in STD_LOGIC_VECTOR (3 downto 0);
            -- V : OUT STD_LOGIC;
            -- BCDin : inout STD_LOGIC_VECTOR (3 downto 0);
            seg : out STD_LOGIC_VECTOR (6 downto 0) ); 
end decoder;

architecture Behavioral of decoder is

signal BCDin : STD_LOGIC_VECTOR (3 downto 0);

begin

    process(clk2)
    begin
        if clk2 = '0' then
            BCDin <= val2;
                else if clk2 = '1' then
                    BCDin <= val1;
                end if;
        end if;
        
    --BCDin <=   w0 WHEN "0000" ;
        --w1 WHEN OTHERS ;
    end process;
        
    process(BCDin)
        begin
         
        case BCDin is
        when "0001" =>
        seg <= "1001111"; ---1
        when "0010" =>
        seg <= "0010010"; ---2
        when "0011" =>
        seg <= "0000110"; ---3
        when "0100" =>
        seg <= "1001100"; ---4
        when "0101" =>
        seg <= "0100100"; ---5
        when "0110" =>
        seg <= "0100000"; ---6
        when others =>
        seg <= "1111111"; ---null
        end case;
         
    end process;

end Behavioral;

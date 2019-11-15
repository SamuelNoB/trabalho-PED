----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.11.2019 22:01:26
-- Design Name: 
-- Module Name: jogo_dado - Behavioral
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

entity jogo_dado is
--  Port ( );
end jogo_dado;

architecture Behavioral of jogo_dado is
    component clk_div is
        Port (
            signal clk : in STD_LOGIC;
           clk1 : inout STD_LOGIC :='0';  --saida de 2MHz
           clk2 : inout STD_LOGIC :='0';  -- saia de 100Hz
           clk3 : inout STD_LOGIC :='0'  -- saida de 2Hz 
        );
    end component;
    
    component num_load is
        Port (
            jogador1 : in std_logic;
            jogador2 : in std_logic;
            load1: inout std_logic;
            load2: inout std_logic;
            CLK : IN std_logic
        );
    end component;
    --descomentar os components e adicionar as portas
    --component num_gen is
        --Port (
           -- colocar todas as declaracoes contidas na entity do componente aqui
        --);
    --end component;
    --component referee is
       -- Port (
                -- colocar todas as declaracoes contidas na entity do componente aqui
       -- );
    --end component;
    --component decoder is
        --Port (
               -- colocar todas as declaracoes contidas na entity do componente aqui
        --);
    --end component;
begin
    c1 : clk_div port map();
    c2 : num_load port map();
    c2 : num_gen port map();
    c4 : referee port map();
    c5: decoder port map();

end Behavioral;

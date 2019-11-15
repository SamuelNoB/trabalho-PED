library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jogo_dado is
Port ( 
    signal clk : in std_logic;
    jogador1 : in std_logic;
    jogador2 : in std_logic;
    an0, an1, an2, an3, seg : out std_logic
);
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
            load2: inout std_logic
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

    --signal clock : std_logic;
    signal clk1out , clk2out, clk3out : std_logic; -- saidas de clock. todas correspondem com seus numeros no diagrama
    signal loadout1, loadout2 : std_logic; -- sinais de load do num_load

begin
    c1 : clk_div port map(
        clk => clk,
        clk1 => clk1out,
        clk2 => clk2out,
        clk3 => clk3out
    );
    
    c2 : num_load port map(
    jogador1 => jogador1,
    jogador2 => jogador2,
    load1    =>loadout1,
    load2    => loadout2
    
    );
    --c2 : num_gen port map();
    --c4 : referee port map();
    --c5: decoder port map();

end Behavioral;

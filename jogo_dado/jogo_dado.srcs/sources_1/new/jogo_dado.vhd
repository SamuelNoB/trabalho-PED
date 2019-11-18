library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity jogo_dado is
Port ( 
    signal clk : in std_logic;
    jogador1 : in std_logic;
    jogador2 : in std_logic;
    an0, an1, an2, an3 : out std_logic;
    seg : out std_logic_vector(6  downto 0)
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
            load2: inout std_logic;
            time1 : out std_logic
        );
    end component;
    --descomentar os components e adicionar as portas
    component num_gen is
        Port (
          clk1 : in std_logic;
          load1, load2 : in std_logic;
          num1, num2: out std_logic_vector(3 downto 0)
          
        );
    end component;
    component referee is
       Port (
       num1, num2 : in STD_LOGIC_VECTOR (3 downto 0);
       clk3, time1 : in std_logic;
       val1, val2: out STD_LOGIC_VECTOR (3 downto 0)
       );
    end component;
    component decoder is
        Port (
               clk2: IN STD_LOGIC ;
            val1 : in STD_LOGIC_VECTOR (3 downto 0);
            val2 : in STD_LOGIC_VECTOR (3 downto 0);
            seg : out STD_LOGIC_VECTOR (6 downto 0)
        );
    end component;

    signal clk1out , clk2out, clk3out : std_logic; -- saidas de clock. todas correspondem com seus numeros no diagrama
    signal loadout1, loadout2 : std_logic; -- sinais de load do num_load
    signal val1, val2 : STD_LOGIC_VECTOR (3 downto 0);
    signal segout: STD_LOGIC_VECTOR (6 downto 0);
    signal num1, num2 : STD_LOGIC_VECTOR (3 downto 0);
    signal time1: std_logic;

begin
    
    an0 <= clk2out;
    an3 <= not clk2out;
    an1 <='1';
    an2 <= '1';
    
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
    load2    => loadout2,
    time1    => time1
    
    
    );
    c3 : num_gen port map(
    clk1 => clk1out,
    load1 =>loadout1,
    load2=>loadout2,
    num1 => num1,
    num2 =>num2
    );
    c4 : referee port map(
    clk3 => clk3out,
    num1 => num1,
    num2 => num2,
    val2 => val2,
    val1 => val1,
    time1=> time1
    );
    c5: decoder port map(
        clk2 => clk2out,
        val1 => val1,
        val2 => val2, 
        seg =>segout
    );
    
    seg <= segout;

end Behavioral;

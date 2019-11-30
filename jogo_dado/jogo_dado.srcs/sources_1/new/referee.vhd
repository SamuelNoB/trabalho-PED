library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity referee is
    Port ( num1 : in STD_LOGIC_vector(2 downto 0);
           num2 : in STD_LOGIC_vector(2 downto 0);
           time1, clk3 : in std_logic;
           val1, val2: out STD_LOGIC_vector(2 downto 0)
           );
end referee;



architecture Behavioral of referee is

signal win1 : STD_LOGIC;
signal win2 : STD_LOGIC;
signal A, B :  STD_LOGIC_vector(2 downto 0);

signal blink: std_logic;
signal caseout1, caseout2: std_logic;

begin

A <= num1;
B<= num2;


process(num1, num2)
begin       
  if num1 > num2 then
    caseout1 <='1';
    caseout2 <='0';
    else if num1 < num2 then
        caseout1 <='0';
        caseout2 <='1';
        else
            caseout1 <='0';
            caseout2 <='0';
    end if;
  end if;
end process;

        
process(blink)
begin        
     win1 <= blink and caseout1;
     win2 <= blink and caseout2;      
end process;            
blink <= time1 and clk3;

process(win1, win2)
begin
    if win1 = '1' then
        val1<= "000";
        else
            val1<= A;
    end if;
    if win2 = '1' then
        val2 <= "000";
        else  
            val2 <= B;    
    end if;
end process;



end Behavioral;

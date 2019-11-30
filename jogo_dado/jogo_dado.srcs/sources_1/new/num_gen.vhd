library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all ;

entity num_gen is
 Port (
 
    clk1 : in STD_LOGIC;
    load1 : in STD_LOGIC;
    load2 : in STD_LOGIC;
    num1, num2 : out STD_LOGIC_VECTOR(2 DOWNTO 0) 
    
  );
end num_gen;

architecture Behavioral of num_gen is

SIGNAL Count: STD_LOGIC_VECTOR (2 DOWNTO 0):="000" ;
--signal resetn : STD_LOGIC;

begin
PROCESS ( Clk1)
        begin        
        IF (Clk1'EVENT AND Clk1 = '1') THEN
            IF Count = "110" THEN
                Count <= "001";	
            ELSE
                Count <= Count + 1 ;
            END IF;
        END IF ;
           
END PROCESS ;

PROCESS ( load1 ) 
    BEGIN 
    IF load1'EVENT AND load1 = '1' THEN 
        num1 <= Count ; 
     END IF ; 
END PROCESS ; 
    
PROCESS ( load2 ) 
    BEGIN 
    IF load2'EVENT AND load2 = '1' THEN 
        num2 <= Count ; 
     END IF ; 
END PROCESS ; 


end Behavioral;

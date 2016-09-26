
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity source_mux is
    Port ( inHF : in  STD_LOGIC_VECTOR (31 downto 0);
           inLF : in  STD_LOGIC_VECTOR (31 downto 0);
			  pointHF : in  STD_LOGIC_VECTOR (3 downto 0);
			  pointLF : in  STD_LOGIC_VECTOR (3 downto 0);
			  tooLowHF, tooHighHF,tooLowLF, tooHighLF : in STD_LOGIC;
           tooLow : out  STD_LOGIC;
           tooHigh : out  STD_LOGIC;
           srcHF : out  STD_LOGIC;
           srcLF : out  STD_LOGIC;
			  o : out  STD_LOGIC_VECTOR (31 downto 0);
			  pointPosition : out STD_LOGIC_VECTOR (3 downto 0));

end source_mux;

architecture Behavioral of source_mux is

--signal tempLF : unsigned (31 downto 0);
--signal tempHF : unsigned (31 downto 0);

begin

--tempLF <= unsigned(inLF);
--tempHF <= unsigned(inHF);

--o <= inHF when ((unsigned(o) > 10000) and (unsigned(o) < 100000000))
o <= inHF when (tooHighLF = '1' and tooLowHF = '0')	else inLF;
pointPosition <= pointHF when (tooHighLF = '1' and tooLowHF = '0')	else pointLF;
		
srcLF <= '0' when (tooHighLF = '1') else '1'; 
srcHF <= '1' when (tooHighLF = '1') else '0'; 

tooLow <= '1' when (tooLowLF = '1') else '0';
tooHigh <= '1' when (tooHighHF = '1') else '0';


end Behavioral;


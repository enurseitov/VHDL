
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity afficheur is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (6 downto 0));
end afficheur;

architecture Behavioral of afficheur is



begin

o <= "0000001" when (i = "0000") --0
	else "1001111" when (i = "0001") --1
	else "0010010" when (i = "0010") --2
	else "0000110" when (i = "0011")
	else "1001100" when (i = "0100")
	else "0100100" when (i = "0101")
	else "0100000" when (i = "0110") --6
	else "0001111" when (i = "0111")
	else "0000000" when (i = "1000")
	else "0000100" when (i = "1001")
	else "0001000" when (i = "1010") --A
	else "1100000" when (i = "1011") --B
	else "0110001" when (i = "1100")
	else "1000010" when (i = "1101")
	else "0110000" when (i = "1110")
	else "0111000" when (i = "1111") --F
	else "1111111";
	

															

end Behavioral;


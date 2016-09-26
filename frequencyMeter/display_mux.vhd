-----
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity display_mux is
    Port ( x100 : in  STD_LOGIC_VECTOR (3 downto 0);
           x10 : in  STD_LOGIC_VECTOR (3 downto 0);
           x1 : in  STD_LOGIC_VECTOR (3 downto 0);
           x01 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0);
			  point : out STD_LOGIC;
			  pointPosition : in STD_LOGIC_VECTOR(3 downto 0)
			  );
end display_mux;



architecture Behavioral of display_mux is

begin
output <= x01 when (sel = "1110") 
	else x1 when (sel = "1101") 
	else x10 when (sel = "1011") 
	else x100 when (sel = "0111")
	else "1111";
	
point <= pointPosition(0) when (sel = "1110") 
	else pointPosition(1) when (sel = "1101") 
	else pointPosition(2) when (sel = "1011") 
	else pointPosition(3) when (sel = "0111") 
	else '1';

end Behavioral;



library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
use work. myArith.all;

entity divider is
port(
    i   : in STD_LOGIC_VECTOR(31 downto 0);
    o   : out STD_LOGIC_VECTOR(31 downto 0);
	 inRange : out STD_LOGIC
);
end divider;

architecture Behavioral of divider is



SIGNAL temp : std_logic_vector (31 downto 0);


begin
temp <= std_logic_vector(divide ("00011101110011010110010100000000", unsigned(i)));--500M (to have decimal)



o <= temp;
inRange <= '1' when (unsigned(temp)<10000) else '0';
end Behavioral;


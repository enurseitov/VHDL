
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
 use ieee.numeric_std.all;



entity converter is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end converter;

architecture Behavioral of converter is
constant clk_period : integer := 20; --nanoseconds

begin


o <= STD_LOGIC_VECTOR(unsigned(i)/2);

end Behavioral;


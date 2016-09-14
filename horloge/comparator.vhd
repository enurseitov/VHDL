
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity comparator is
    Port ( inA : in  STD_LOGIC_VECTOR (31 downto 0);
           inB : in  STD_LOGIC_VECTOR (31 downto 0);
           equals : out  STD_LOGIC);
end comparator;

architecture Behavioral of comparator is

begin

equals <= '1' when (inA = inB) else '0';

end Behavioral;


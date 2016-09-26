
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity display_temp_buffer is
    Port ( i : in  STD_LOGIC_VECTOR (15 downto 0);
           o : out  STD_LOGIC_VECTOR (15 downto 0));
end display_temp_buffer;

architecture Behavioral of display_temp_buffer is

begin

o(0) <= i(0);
o(1) <= i(1);
o(2) <= i(2);
o(3) <= i(3);
o(4) <= i(4);
o(5) <= i(5);
o(6) <= i(6);
o(7) <= i(7);

o(8) <= '0';
o(9) <= '0';
o(10) <= '0';
o(11) <= '0';
o(13) <= '0';
o(13) <= '0';
o(14) <= '0';
o(15) <= '0';




end Behavioral;


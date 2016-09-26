

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity display_bit_shifter is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end display_bit_shifter;

architecture Behavioral of display_bit_shifter is
signal temp : STD_LOGIC_VECTOR(3 downto 0):="1110";
begin

pr1 : process( clk, rst )
begin
	if rst = '1' then
		temp <= "1110";

	elsif (clk'event and clk = '1') then
	 temp <= std_logic_vector(unsigned(temp) rol 1);
		
	end if ;
end process ; -- pr1

output <= temp;

end Behavioral;


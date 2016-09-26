
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use work.myArith.all;


entity display_prescaler is
    Port (
        i : in  STD_LOGIC_VECTOR (31 downto 0);
        o : out STD_LOGIC_VECTOR (15 downto 0);
        hz, khz, mhz : out STD_LOGIC;
        err : out STD_LOGIC;
		  pointPosition : out std_logic_vector (3 to 0)
    );

end display_prescaler;

architecture Behavioral of display_prescaler is

signal temp: unsigned(31 downto 0) := (others => '0');
signal temp2: STD_LOGIC_VECTOR(31 downto 0) := (others => '0');
begin

temp <=  unsigned(i);
--o <= std_logic_vector(temp);

--err <= '1';
--hz <= '1';
--khz <= '1';
--mhz <= '1';

o <= temp2(15 downto 0);

process (temp, i)
begin
if (temp < 10000) then
	hz <= '1';
	khz <= '0';
	mhz <= '0';
	err <= '0';
	temp2 <= i;
	

	

elsif (temp < 10000000) then
	hz <= '0';
	khz <= '1';
	mhz <= '0';
	err <= '0';
	temp2 <= std_logic_vector(divide(unsigned(i), to_unsigned(1000, 32)));

elsif (temp < 100000000) then--10 Mhz max
	hz <= '0';
	khz <= '0';
	mhz <= '1';
	err <= '0';
	temp2 <= std_logic_vector(divide(unsigned(i), to_unsigned(1000000, 32)));

else
	err <= '1';
	khz <= '0';
	mhz <= '0';
	hz <= '0';
	temp2 <= std_logic_vector(to_unsigned(0,32));
	
end if;
end process;



end Behavioral;


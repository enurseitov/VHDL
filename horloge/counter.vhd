
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;



entity counter is
    Port ( clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (31 downto 0));
end counter;

architecture Behavioral of counter is
SIGNAL tempcount : STD_LOGIC_VECTOR (31 downto 0);
begin

PROCESS(clock, reset)

BEGIN
IF (reset = '0') then
	tempcount <= "00000000000000000000000000000000";

ELSIF (clock = '1' and clock'event) then

	tempcount <= tempcount+1;
END IF;

END PROCESS;

count <= tempcount;

end Behavioral;


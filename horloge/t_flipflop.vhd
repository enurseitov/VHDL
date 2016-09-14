
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity t_flipflop is
    Port ( clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           output : out  STD_LOGIC);
end t_flipflop;

architecture Behavioral of t_flipflop is

SIGNAL temp : STD_LOGIC :='1';

begin

 process (clock) 
    begin
	 
--	if reset='0' then   
--          temp <= '0'; 
	
if (clock'EVENT AND clock = '1') then 	
		temp <= clock xor temp;
   end if;

    end process;
output <= temp;	   

end Behavioral;


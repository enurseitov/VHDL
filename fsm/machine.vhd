
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity machine is
    Port ( i : in  STD_LOGIC;
				rst : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC);
end machine;

architecture Behavioral of machine is

type myStates is (state1, state2, state3, state4);
signal presentState, futureState: myStates;

begin

M: process (rst, clk)
	begin
	if (rst = '1') then
		presentState <= state1;
	elsif (clk'event and clk='1') then
		presentState <= futureState;
	end if;
end process;

F: process (i, presentState)
	begin
	case presentState is 
		when state1 =>
			if (i = '1') then futureState <= state2;
			else futureState <=state4;
			end if;
		when state2 =>
			if (i = '1') then futureState <= state3;
			else futureState <=state1;
			end if;
		when state3 =>
			if (i = '1') then futureState <= state4;
			else futureState <=state2;
			end if;
		when state4 =>
			if (i = '1') then futureState <= state1;
			else futureState <=state3;
			end if;
	end case;
end process;

G: process (presentState)
	begin
	case presentState is 
		when state1 =>
			o <= "0001";
		when state2 =>
			o <= "0010";
		when state3 =>
			o <= "0100";
		when state4 =>
			o <= "1000";
	end case;
end process;
	
			

end Behavioral;


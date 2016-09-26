
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity divider_sub is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in  STD_LOGIC;
		     rst : in STD_LOGIC;		
		     pointPosition : out STD_LOGIC_VECTOR (3 downto 0);
		     tooLow, tooHigh : out STD_LOGIC;
				HZled : out STD_LOGIC
			  );
end divider_sub;

architecture Behavioral of divider_sub is

type myStates is (init, check, err, divide1, divide01, divide001, divide0001, compute01, compute001, compute0001, swap1, swap2, swap3, finish);
signal presentState, futureState: myStates;
signal d1, d2 : unsigned (35 downto 0) := (others => '0');
signal result : unsigned (31 downto 0) := (others => '0');
signal x1, x01, x001, x0001 : unsigned (31 downto 0) := (others => '0');
signal temp : unsigned (63 downto 0);

begin



M: process (rst, clk)
	begin
	if (rst = '1') then
		presentState <= init;
	elsif (clk'event and clk='1') then
		presentState <= futureState;
	end if;
end process;

F: process (presentState, d1, d2, x1)
	begin
	case presentState is 
		when init =>
			futureState <= check;
			
		when check =>
			if (d2>50000000 or d2<=50000) then -- freq too low or too high
				futureState <= err;
			else
				futureState <= divide1;
			end if;
	
		when divide1 =>
			if (d1 > (d2+d2)) then futureState <= divide1;
			else 
				futureState <= swap1;
			end if;

		when swap1 =>
			if (d1(31 downto 0)*"1010">d2) then
				futureState <= divide01;	
			else 
				futureState <= swap2;
			end if;

		when divide01 =>
			if (d1 > (d2+d2)) then futureState <= divide01;
			--elsif (x1 > 99) then futureState <= compute01;
			else 
				futureState <= swap2;		
			end if;

		when swap2 =>
		
		if (x1 > 99) then futureState <= compute01;
				elsif (d1(31 downto 0)*"1010">d2) then futureState <= divide001;	
			
			else
				futureState <= swap3;
			end if;

		when divide001 =>
			if (d1 > (d2+d2)) then futureState <= divide001;
			--elsif (x1 > 9) then futureState <= compute001;
			else 
				futureState <= swap3;				
			end if;

		when swap3 =>
		if (x1 > 9) then futureState <= compute001;
--			elsif (d1>d2) then
--				futureState <= divide0001;	
--			
--			else	
--				futureState <= compute0001;
--			end if;
--				futureState <= divide0001;	
			
			else	
				futureState <= divide0001;
			end if;

		when divide0001 =>
			if (d1 > (d2+d2)) then futureState <= divide0001;
			else futureState <= compute0001;			
			end if;


		when compute01 =>			
			futureState <= finish;
		when compute001 =>			
			futureState <= finish;
		when compute0001 =>			
			futureState <= finish;
			
		when err =>			
			futureState <= init;			

		when finish =>			
			futureState <= init;				
	end case;
end process;

G: process (clk)
	begin
	if (clk'event and clk = '1') then
	case presentState is 
		when init =>
			d1 <= to_unsigned(50000000,36);
			d2(31 downto 0) <= unsigned(i);
			--result <= (others =>'0');
			x1 <= (others => '0');
			x01 <= (others => '0');
			x001 <= (others => '0');
			x0001 <= (others => '0');
		when check =>
		--
		when err =>
			if (d2>50000000) then tooLow <= '1'; tooHigh <= '0';
			elsif (d2<=50000) then tooHigh <= '1'; tooLow <= '0';
			end if;
			result <= (others => '0');
			HZled <= '0';

			
		--
		when divide1 =>
			d1 <= d1 - d2;		
			x1 <= x1 + to_unsigned(1,32);
			

		when swap1 => 
			d1 <= d1(31 downto 0)*"1010";

		when divide01 =>
			d1 <= d1 - d2;
			x01 <= x01 + to_unsigned(1,32);
			

		when swap2 => 
			d1 <= d1(31 downto 0)*"1010";

		when divide001 =>
			d1 <= d1 - d2;
			x001 <= x001 + to_unsigned(1,32);
			

		when swap3 => 
			d1 <= d1(31 downto 0)*"1010";

		when divide0001 =>
			d1 <= d1 - d2;
			x0001 <= x0001 + to_unsigned(1,32);
			

		when compute01 =>
			temp <= (x1*10)+x01;
			pointPosition <= "1101";
			

		when compute001 =>
			temp <= (x1*100)+(x01*10)+x001;
			pointPosition <= "1011";

		
		when compute0001 =>
			temp <= (x1*1000)+(x01*100)+(x001*10)+x0001;
			pointPosition <= "0111";

			
		when finish =>
			result <= temp (31 downto 0);
			tooLow <= '0';
			tooHigh <= '0';
			HZled <='1';
			
			

	end case;
	end if;
end process;
o <= std_logic_vector(result (31 downto 0));



end Behavioral;
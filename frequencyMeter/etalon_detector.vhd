
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;



entity etalon_detector is
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  reset : in  STD_LOGIC;
			  error : out STD_LOGIC
			  );
end etalon_detector;

architecture Behavioral of etalon_detector is

signal count: integer:=0;
signal tmp : std_logic := '1';
signal Curr_Count,Prev_Count : unsigned(31 downto 0):=(others => '0');
signal tempOut: std_logic_vector (31 downto 0) := (others => '0');
 

begin

process(clk,reset)
begin
if(reset='0') then
	count<=0;
	tmp<='1';
elsif(clk'event and clk='1') then
	count <=count+1;
	if (count = 100) then
		tmp <= NOT tmp;
		count <= 0;
	end if;
end if;
end process;

process(i)
 begin
	 if( i'event and i = '1' ) then
	 	Curr_Count <= Curr_Count + 1;
	 end if;
end process;

process(tmp)
begin
if( tmp'event and tmp = '1' ) then
    if( Prev_Count < Curr_Count ) then
		tempOut <= std_logic_vector((Curr_Count - Prev_Count));
    	error <= '0';
	elsif( Prev_Count > Curr_Count ) then 
		tempOut <= (others => '0');
		error <= '1';
	else
		tempOut <= (others => '0');
	   error <= '1';  
	end if;  

	Prev_Count <= Curr_Count;  
end if;
end process;

o <= std_logic_vector(unsigned(tempOut)*to_unsigned(1000,32));

end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity counter_hf is
    Port ( wave_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           o : out  STD_LOGIC_vector (31 downto 0)
			  --tooHigh, tooLow : out STD_LOGIC
           );
end counter_hf;

architecture Behavioral of counter_hf is

signal tenKHz : STD_LOGIC := '0';
signal count: integer:=0;
signal Curr_Count,Prev_Count : unsigned(31 downto 0):=(others => '0');
signal temp : unsigned(31 downto 0):=(others => '0');

begin

process (rst, clk) 

begin
	if rst = '1' then
		tenKHz <= '0';

	elsif (clk'event and clk = '1') then

	if count = 24999999 then
		tenKHz <= not tenKHz;
		count <= 0;
	else
		count <= count + 1;
			
	end if ;

			
	end if ;

end process;

 process(wave_in)
 begin
	 if( wave_in'event and wave_in = '1' ) then
	 	Curr_Count <= Curr_Count + 1;
	 end if;
 end process;

maincount : process( tenKHz )
begin
if( tenKHz'event and tenKHz = '1' ) then
    if( Prev_Count < Curr_Count ) then
    	temp <= (Curr_Count - Prev_Count);
    	
	elsif( Prev_Count > Curr_Count ) then 
		temp <= (others => '0');
		
	else
		temp <= (others => '0');
		
	end if;  

	Prev_Count <= Curr_Count;  
end if;

end process ; -- maincount

boundDetection: process  (temp)
begin

		o <= std_logic_vector(temp);	

	
end process;

end Behavioral;


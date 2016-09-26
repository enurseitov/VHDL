 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 entity pulse_counter is
 port ( output : out STD_LOGIC_VECTOR(31 downto 0);
         error : out std_logic;  --This is '1' if the pulse freq is more than clk freq.
         pulseIn : in std_logic;  
         clk : in std_logic
         );
 end pulse_counter;

 architecture Behavioral of pulse_counter is
 signal Curr_Count,Prev_Count : unsigned(31 downto 0):=(others => '0');
 begin

 process(clk)
 begin
	 if( clk'event and clk = '1' ) then
	 	Curr_Count <= Curr_Count + 1;
	 end if;
 end process;
--Calculate the time period of the pulse input using the current and previous counts.
process(pulseIn)
begin
if( pulseIn'event and pulseIn = '1' ) then
    if( Prev_Count < Curr_Count ) then
    	output <= std_logic_vector(Curr_Count - Prev_Count);
    	error <= '0';
	elsif( Prev_Count > Curr_Count ) then -- in case of overflow
		output <= (others => '0');
		error <= '1';
	else
		output <= (others => '0');
		error <= '1';  
	end if;  

	Prev_Count <= Curr_Count;  --Re-setting the Prev_Count.
end if;
end process;

end Behavioral;
 library ieee;
 use ieee.std_logic_1164.all;
 use ieee.numeric_std.all;
 entity pulse_counter is
 port ( output : out std_logic_vector(31 downto 0);
         pulseIn : in std_logic;  
         clk : in std_logic;
			rst : in std_logic
         );
 end pulse_counter;

 architecture Behavioral of pulse_counter is
 signal Curr_Count,Prev_Count, count : unsigned(31 downto 0):=(others => '0');
 signal temp : unsigned(31 downto 0):=(others => '0');
 signal error : std_logic;
 signal ff1, ff2 : std_logic;
 begin
 
process(clk) 
begin
	if clk'event and clk='1' then 
		if rst='1' then 
		count <= (others => '0');
		temp <= (others => '0');
		else
		ff1 <= pulseIn;  -- 
		ff2 <= ff1; -- two flipflops to detect rising edge
			if  ff2 = '0' and ff1 = '1' then 
				temp <= count;
				count <= (others => '0');
			else
				if (count <60000000) then
				count <= count + 1;
				else
				count <= (others => '0');
				temp <= (others => '0');
				end if;
			end if;
		end if;
	end if;
end process;


-- process(clk)
-- begin
--	 if( clk'event and clk = '1' ) then
--	-- if (count < 60000000) then
--	 	Curr_Count <= Curr_Count + 1;
--		--error <='0';
--	 --else 
--		--count <= (others => '0');
--		--temp <= (others => '0');
--		--error <='1';
--		
--	--	end if;
--	 end if;
-- end process;
--
--process(pulseIn)
--begin
--if( pulseIn'event and pulseIn = '1' ) then
--    if( Prev_Count < Curr_Count ) then
--    	temp <= (Curr_Count - Prev_Count);
--    	--error <= '0';
--	elsif( Prev_Count > Curr_Count ) then 
--		temp <= (others => '0');
--		--error <= '1';
--	else
--		temp <= (others => '0');
--		--error <= '1';  
--	end if;  
--
--	Prev_Count <= Curr_Count;  
--end if;
--end process;

output <= std_logic_vector(temp);

end Behavioral;
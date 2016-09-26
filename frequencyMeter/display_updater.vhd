
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity display_updater is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (15 downto 0);
			  iPointPosition : in  STD_LOGIC_VECTOR (3 downto 0);
           oPointPosition : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end display_updater;

architecture Behavioral of display_updater is

signal count : unsigned (31 downto 0) := (others => '0');
signal temp : STD_LOGIC_VECTOR (31 downto 0) := (others => '0');

begin

process (rst, clk)
begin

if (rst = '1') then
	count <= (others => '0');
	temp <= (others => '0');
	oPointPosition <= "0000";
	
elsif (clk'event and clk = '1') then
	
	--if (count = 5000000) then --unpdate once every 100 ms
	if (count = 99999999) then --update every 1 s
	temp <= i;
	oPointPosition <= iPointPosition;
	count <= (others => '0');
	else
	count <= count + 1;
	end if;
	
end if;
	
	
--	temp <= i;
--	oPointPosition <= iPointPosition;	
o <= temp(15 downto 0);


end process;


end Behavioral;


----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:16 09/11/2016 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.numeric_std.ALL;


entity main is
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC);
end main;

architecture Behavioral of main is
	signal tmp: STD_LOGIC;

begin

process (i)
	begin
		for i in 0 to 3 loop
			if 
		end loop;
	end process;


end Behavioral;


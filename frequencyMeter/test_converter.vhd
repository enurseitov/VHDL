
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 use ieee.numeric_std.all;

ENTITY test_converter IS
END test_converter;

 
ARCHITECTURE behavior OF test_converter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT converter
    PORT(
         i : IN  std_logic_vector(31 downto 0);
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: converter PORT MAP (
          i => i,
          o => o
        );


i<= std_logic_vector(unsigned(6));
END;

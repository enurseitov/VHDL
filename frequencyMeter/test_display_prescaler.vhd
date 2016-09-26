
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY test_display_prescaler IS
END test_display_prescaler;
 
ARCHITECTURE behavior OF test_display_prescaler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display_prescaler
    PORT(
         i : IN  std_logic_vector(31 downto 0);
         o : OUT  std_logic_vector(15 downto 0);
         hz : OUT  std_logic;
         khz : OUT  std_logic;
         mhz : OUT  std_logic;
         err : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(31 downto 0) := "00000000000000000000000000000001";

 	--Outputs
   signal o : std_logic_vector(15 downto 0);
   signal hz : std_logic;
   signal khz : std_logic;
   signal mhz : std_logic;
   signal err : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_prescaler PORT MAP (
          i => i,
          o => o,
          hz => hz,
          khz => khz,
          mhz => mhz,
          err => err
        );

   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 1 ns;	
		i <= i+i;

   end process;

END;

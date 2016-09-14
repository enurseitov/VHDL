
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT afficheur
    PORT(
         i : IN  std_logic_vector(3 downto 0);
         o : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(6 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: afficheur PORT MAP (
          i => i,
          o => o
        );


--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns
--		
--	
--      wait for 100 ns;	
--
--     
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

i <= i+1 after 10 ns;


END;

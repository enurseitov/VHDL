
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY test_detector_hf IS
END test_detector_hf;
 
ARCHITECTURE behavior OF test_detector_hf IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT detector_hf
    PORT(
         wave_in : IN  std_logic;
         clk : IN  std_logic;
         reset : IN  std_logic;
         o : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal wave_in : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant in_period : time := 1000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: detector_hf PORT MAP (
          wave_in => wave_in,
          clk => clk,
          reset => reset,
          o => o
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 
    in_process :process
   begin
		wave_in <= '0';
		wait for in_period/2;
		wave_in <= '1';
		wait for in_period/2;
   end process;
--
--   -- Stimulus process
--   stim_proc: process
--   begin		
--      -- hold reset state for 100 ns.
--      wait for 100 ns;	
--
--      wait for clk_period*10;
--
--      -- insert stimulus here 
--
--      wait;
--   end process;

END;

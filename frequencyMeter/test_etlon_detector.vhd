
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_etlon_detector IS
END test_etlon_detector;
 
ARCHITECTURE behavior OF test_etlon_detector IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT etalon_detector
    PORT(
         i : IN  std_logic;
         o : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         error : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(31 downto 0);
   signal error : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant in_period : time := 2000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: etalon_detector PORT MAP (
          i => i,
          o => o,
          clk => clk,
          reset => reset,
          error => error
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
		i <= '0';
		wait for in_period/2;
		i <= '1';
		wait for in_period/2;
   end process;
 

   -- Stimulus process


END;

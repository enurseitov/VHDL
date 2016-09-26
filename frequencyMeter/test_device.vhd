
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_device IS
END test_device;
 
ARCHITECTURE behavior OF test_device IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT device
    PORT(
         in_wave : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         segments_out : OUT  std_logic_vector(6 downto 0);
         an_out : OUT  std_logic_vector(3 downto 0);
         point : OUT  std_logic;
         HZled : OUT  std_logic;
         KHZled : OUT  std_logic;
         MHZled : OUT  std_logic;
         tooHighLED : OUT  std_logic;
         tooLowLED : OUT  std_logic;
         srcHFLED : OUT  std_logic;
         srcLFLED : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal in_wave : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal segments_out : std_logic_vector(6 downto 0);
   signal an_out : std_logic_vector(3 downto 0);
   signal point : std_logic;
   signal HZled : std_logic;
   signal KHZled : std_logic;
   signal MHZled : std_logic;
   signal tooHighLED : std_logic;
   signal tooLowLED : std_logic;
   signal srcHFLED : std_logic;
   signal srcLFLED : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant in_period : time := 2 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: device PORT MAP (
          in_wave => in_wave,
          clk => clk,
          rst => rst,
          segments_out => segments_out,
          an_out => an_out,
          point => point,
          HZled => HZled,
          KHZled => KHZled,
          MHZled => MHZled,
          tooHighLED => tooHighLED,
          tooLowLED => tooLowLED,
          srcHFLED => srcHFLED,
          srcLFLED => srcLFLED
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
		in_wave <= '0';
		wait for in_period/2;
		in_wave <= '1';
		wait for in_period/2;
   end process;
 
 

   -- Stimulus process
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

rst <= '1', '0' after 100ns;

END;

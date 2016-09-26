
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY test_hf_prescaler IS
END test_hf_prescaler;
 
ARCHITECTURE behavior OF test_hf_prescaler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT hf_prescaler
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         i : IN  std_logic_vector(31 downto 0);
         o : OUT  std_logic_vector(31 downto 0);
         tooHigh : OUT  std_logic;
         tooLow : OUT  std_logic;
         inRange : OUT  std_logic;
         kilo : OUT  std_logic;
         mega : OUT  std_logic;
         pointPosition : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal i : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal o : std_logic_vector(31 downto 0);
   signal tooHigh : std_logic;
   signal tooLow : std_logic;
   signal inRange : std_logic;
   signal kilo : std_logic;
   signal mega : std_logic;
   signal pointPosition : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: hf_prescaler PORT MAP (
          clk => clk,
          rst => rst,
          i => i,
          o => o,
          tooHigh => tooHigh,
          tooLow => tooLow,
          inRange => inRange,
          kilo => kilo,
          mega => mega,
          pointPosition => pointPosition
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

rst <= '1', '0' after 100 ns;
i <= std_logic_vector(to_unsigned(9999999,32));

END;

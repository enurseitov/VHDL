
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

 
ENTITY test_pulse_counter IS
END test_pulse_counter;
 
ARCHITECTURE behavior OF test_pulse_counter IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT pulse_counter
    PORT(
         output : OUT  std_logic_vector(31 downto 0);
         error : OUT  std_logic;
         pulseIn : IN  std_logic;
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal pulseIn : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(31 downto 0);
   signal error : std_logic;

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant pulse_period : time := 2000 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: pulse_counter PORT MAP (
          output => output,
          error => error,
          pulseIn => pulseIn,
          clk => clk
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	   pulse_process :process
   begin
		pulseIn <= '0';
		wait for pulse_period/2;
		pulseIn <= '1';
		wait for pulse_period/2;
   end process;



END;

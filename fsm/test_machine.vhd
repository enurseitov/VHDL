
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_machine IS
END test_machine;
 
ARCHITECTURE behavior OF test_machine IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT machine
    PORT(
         i : IN  std_logic;
         rst : IN  std_logic;
         o : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: machine PORT MAP (
          i => i,
          rst => rst,
          o => o,
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
 

   -- Stimulus process
   stim_proc: process
   begin		
      rst <= '1', '0' after 50 ns;
		i<= '1';
      	
		

      wait for clk_period*10;
		
		i <= '0' after 100 ns;

      -- insert stimulus here 

      wait;
   end process;

END;

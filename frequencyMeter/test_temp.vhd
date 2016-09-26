
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

 
ENTITY test_temp IS
END test_temp;
 
ARCHITECTURE behavior OF test_temp IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT temp
    PORT(
         i : IN  std_logic;
         o : OUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
	constant in_period : time := 100 ms;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: temp PORT MAP (
          i => i,
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
 
    in_Pulse :process
   begin
		i <= '0';
		wait for in_period/2;
		i <= '1';
		wait for in_period/2;
   end process;
 



END;

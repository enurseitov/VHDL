
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
USE ieee.numeric_std.ALL;
 
ENTITY test_divider_sub IS
END test_divider_sub;
 
ARCHITECTURE behavior OF test_divider_sub IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider_sub
    PORT(
         i : IN  std_logic_vector(31 downto 0);
         o : INOUT  std_logic_vector(31 downto 0);
         clk : IN  std_logic;
         rst : IN  std_logic;
         
			pointPosition : out STD_LOGIC_VECTOR (3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal i : std_logic_vector(31 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

	--BiDirs
   signal o : std_logic_vector(31 downto 0);

 	--Outputs
  
	signal pointPosition :  STD_LOGIC_VECTOR (3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider_sub PORT MAP (
          i => i,
          o => o,
          clk => clk,
          rst => rst,
          
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
	
rst <= '1', '0' after 90ns;	
i <= std_logic_vector(to_unsigned(408163,32));

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

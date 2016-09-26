
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY test_display_driver IS
END test_display_driver;
 
ARCHITECTURE behavior OF test_display_driver IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display_driver
    PORT(
         binary_in : IN  std_logic_vector(15 downto 0);
         segments_out : OUT  std_logic_vector(6 downto 0);
         an_out : OUT  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal binary_in : std_logic_vector(15 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal segments_out : std_logic_vector(6 downto 0);
   signal an_out : std_logic_vector(3 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_driver PORT MAP (
          binary_in => binary_in,
          segments_out => segments_out,
          an_out => an_out,
          clk => clk,
          reset => reset
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
      -- hold reset state for 100 ns.
		reset <= '1';
      wait for 100 ns;	
		reset <= '0';
		
		binary_in <= "0001000011100001"; --4321
		wait for 100 ms;
		binary_in <= "0000010011010010";--1234
		wait for 100 ms;
		binary_in <= "0000000000011101";--13
		


      wait;
   end process;

END;

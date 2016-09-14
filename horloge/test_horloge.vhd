
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY test_horloge IS
END test_horloge;
 
ARCHITECTURE behavior OF test_horloge IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT horloge
    PORT(
         clock : IN  std_logic;
         reset : IN  std_logic;
         clockOut : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clock : std_logic := '0';
   signal reset : std_logic := '0';

 	--Outputs
   signal clockOut : std_logic;

   -- Clock period definitions
   constant clock_period : time := 20 ns;
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: horloge PORT MAP (
          clock => clock,
          reset => reset,
          clockOut => clockOut
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 
   



END;

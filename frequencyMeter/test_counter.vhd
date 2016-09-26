 LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY tb IS
END tb;
ARCHITECTURE behavior OF tb IS
   --Inputs
   signal Pulse_I : std_logic := '0';
   signal CLK_I : std_logic := '0';
    --Outputs
   signal DAT_O : unsigned(47 downto 0);
   signal ERR_O : std_logic;
   -- Clock period definitions
   constant CLK_I_period : time := 10 ps;
BEGIN
    -- Instantiate the Unit Under Test (UUT)
   uut: entity work.pulse_counter PORT MAP (
          DAT_O => DAT_O,
          ERR_O => ERR_O,
          Pulse_I => Pulse_I,
          CLK_I => CLK_I
        );
   -- Clock process definitions
   CLK_I_process :process
   begin
        CLK_I <= '0';
        wait for CLK_I_period/2;
        CLK_I <= '1';
        wait for CLK_I_period/2;
   end process;
   -- Stimulus process
   stim_proc: process
   begin       
      wait for 10 ns;
        --1  (time period is 15000*10 ps here)
        Pulse_I <= '1';
        wait for 100 ns;
        Pulse_I <= '0';
        wait for 50 ns;
        Pulse_I <= '1';
        --2  (Error because freq of pulse is less than system clock)
        wait for 3 ps;
        Pulse_I <= '0';
        wait for 1 ps;
        Pulse_I <= '1';
        --3  (time period is 130000*10 ps here)
        wait for 300 ns;
        Pulse_I <= '0';
        wait for 1000 ns;
        Pulse_I <= '1';    
      wait;
   end process;
END;
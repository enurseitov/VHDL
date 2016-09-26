--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:43:39 09/16/2016
-- Design Name:   
-- Module Name:   C:/Users/ster/VHDL/frequencyMeter/test_display_mux.vhd
-- Project Name:  frequencyMeter
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: display_mux
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_display_mux IS
END test_display_mux;
 
ARCHITECTURE behavior OF test_display_mux IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT display_mux
    PORT(
         x100 : IN  std_logic_vector(3 downto 0);
         x10 : IN  std_logic_vector(3 downto 0);
         x1 : IN  std_logic_vector(3 downto 0);
         x01 : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal x100 : std_logic_vector(3 downto 0) := (others => '0');
   signal x10 : std_logic_vector(3 downto 0) := (others => '0');
   signal x1 : std_logic_vector(3 downto 0) := (others => '0');
   signal x01 : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: display_mux PORT MAP (
          x100 => x100,
          x10 => x10,
          x1 => x1,
          x01 => x01,
          sel => sel,
          output => output
        );

   -- Clock process definitions


   -- Stimulus process
x100 <= "0100";
x10 <= "0011";
x1 <= "0010";
x01 <= "0001";

sel <= "1110", "1101" after 100 ns, "1011" after 200 ns, "0111" after 300 ns;

END;

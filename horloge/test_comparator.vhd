--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:13:23 09/13/2016
-- Design Name:   
-- Module Name:   C:/Users/ster/VHDL/horloge/test_comparator.vhd
-- Project Name:  horloge
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: comparator
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
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_comparator IS
END test_comparator;
 
ARCHITECTURE behavior OF test_comparator IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT comparator
    PORT(
         inA : IN  std_logic_vector(31 downto 0);
         inB : IN  std_logic_vector(31 downto 0);
         equals : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal inA : std_logic_vector(31 downto 0) := (others => '0');
   signal inB : std_logic_vector(31 downto 0) := "00000000000000000000000000001000";

 	--Outputs
   signal equals : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: comparator PORT MAP (
          inA => inA,
          inB => inB,
          equals => equals
        );


inA  <= inA+1 after 1 ns;
 
END;

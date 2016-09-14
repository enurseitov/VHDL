
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_ARITH.ALL;
USE ieee.std_logic_UNSIGNED.ALL;
 
ENTITY test_bench IS
END test_bench;
 
ARCHITECTURE behavior OF test_bench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fourBitAdder
    PORT(
         inA : IN  std_logic_vector(3 downto 0);
         inB : IN  std_logic_vector(3 downto 0);
         Cout : OUT  std_logic;
         Result : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal inA : std_logic_vector(3 downto 0) := (others => '0');
   signal inB : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal Cout : std_logic;
   signal Result : std_logic_vector(3 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fourBitAdder PORT MAP (
          inA => inA,
          inB => inB,
          Cout => Cout,
          Result => Result
        );

   -- Clock process definitions
	inA <= inA + 1 after 10 ns;
  inB <= inB + 1 after 10 ns;

END;

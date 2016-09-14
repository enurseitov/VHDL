
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity fourBitAdder is
    Port ( inA : in  STD_LOGIC_VECTOR (3 downto 0);
           inB : in  STD_LOGIC_VECTOR (3 downto 0);           
           Cout : out  STD_LOGIC;
           Result : out  STD_LOGIC_VECTOR (3 downto 0));
end fourBitAdder;

architecture Behavioral of fourBitAdder is

COMPONENT fullAdder
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
			  S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
END COMPONENT;

SIGNAL c : STD_LOGIC_VECTOR (2 downto 0);
--SIGNAL C1 : STD_LOGIC;
--SIGNAL C2 : STD_LOGIC;

begin

ADDER0:fullAdder PORT MAP (
	A => inA(0),
	B => inB(0),
	Cin => '0',
	S => Result(0),
	Cout =>c(0)
	);
	
ADDER1:fullAdder PORT MAP (
	A => inA(1),
	B => inB(1),
	Cin => c(0),
	S => Result(1),
	Cout =>c(1)
	);
	
ADDER2:fullAdder PORT MAP (
	A => inA(2),
	B => inB(2),
	Cin => c(1),
	S => Result(2),
	Cout =>c(2)
	);	
	
ADDER3:fullAdder PORT MAP (
	A => inA(3),
	B => inB(3),
	Cin => c(2),
	S => Result(3),
	Cout => Cout	
	);	
	


end Behavioral;



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity horloge is
    Port ( clock : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           clockOut : out  STD_LOGIC);
end horloge;

architecture Behavioral of horloge is

COMPONENT counter
    Port ( clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           count : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT fixed_output
	Port ( output : out  STD_LOGIC_VECTOR (31 downto 0));
END COMPONENT;

COMPONENT comparator
    Port ( inA : in  STD_LOGIC_VECTOR (31 downto 0);
           inB : in  STD_LOGIC_VECTOR (31 downto 0);
           equals : out  STD_LOGIC);
END COMPONENT;

COMPONENT t_flipflop
    Port ( clock : in  STD_LOGIC;
				reset : in  STD_LOGIC;
           output : out  STD_LOGIC);
END COMPONENT;

SIGNAL counterOutput : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL fixedOutput : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL comparatorOutput : STD_LOGIC;
SIGNAL resetSignal : STD_LOGIC;

begin

COUNTER0:counter PORT MAP (
	clock => clock,
	reset => reset,
	count => counterOutput
	);
	
FIXED0:fixed_output PORT MAP (
	output => fixedOutput
);

COMPARATOR0:comparator PORT MAP (
	inA => counterOutput,
	inB => fixedOutput,
	equals => comparatorOutput
);

FLIPFLOP0:t_flipflop PORT MAP (
	clock => comparatorOutput,
	reset => '1',
	output => clockOut
);

resetSignal <= reset, comparatorOutput;


end Behavioral;


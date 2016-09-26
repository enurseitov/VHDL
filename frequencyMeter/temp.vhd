
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;


entity detector_lf is
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  --error : out STD_LOGIC;
			  tooLow, tooHigh : out STD_LOGIC;
			  pointPosition : out STD_LOGIC_VECTOR(3 downto 0);
			  rst : in STD_LOGIC;
			  HZled : out STD_LOGIC
			  );
end detector_lf;

architecture Behavioral of detector_lf is

COMPONENT pulse_counter
 port ( output : out std_logic_vector(31 downto 0);
         --error : out std_logic;  
         pulseIn : in std_logic;  
         clk : in std_logic;
			rst : in std_logic
         );
END COMPONENT;

COMPONENT divider_sub
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0);
			  clk : in  STD_LOGIC;
		     rst : in STD_LOGIC;		
		     pointPosition : out STD_LOGIC_VECTOR (3 downto 0);
		     tooLow, tooHigh : out STD_LOGIC;
			  HZled : out STD_LOGIC			  
			  );
END COMPONENT;

SIGNAL count_lf_internal : STD_LOGIC_VECTOR(31 downto 0);

begin

COUNT_LF:pulse_counter PORT MAP (
pulseIn =>i,
output => count_lf_internal,
clk => clk,
rst => rst
);


DIV_SUB:divider_sub PORT MAP (
i => count_lf_internal,
o => o,
clk => clk,
rst => rst,
pointPosition => pointPosition,
tooLow => tooLow,
tooHigh => tooHigh,
HZled => HZled
);



end Behavioral;


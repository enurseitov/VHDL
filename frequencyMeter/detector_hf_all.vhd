
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity detector_hf_all is
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  tooLow, tooHigh : out STD_LOGIC;
			  KHZled, MHZled : out STD_LOGIC;
			  pointPosition : out STD_LOGIC_VECTOR (3 downto 0);
			  rst : in STD_LOGIC
			  );
end detector_hf_all;

architecture Behavioral of detector_hf_all is

COMPONENT counter_hf
    Port ( wave_in : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           o : out  STD_LOGIC_vector (31 downto 0)
			 );
END COMPONENT;

COMPONENT hf_prescaler
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           tooHigh : out  STD_LOGIC;
           tooLow : out  STD_LOGIC;
   
           kilo : out  STD_LOGIC;
           mega : out  STD_LOGIC;
           pointPosition : out  STD_LOGIC_vector (3 downto 0));
END COMPONENT;

SIGNAL count_hf_internal : STD_LOGIC_VECTOR(31 downto 0);


begin

COUNT_HF:counter_hf PORT MAP(
	wave_in => i,
	clk => clk,
	rst => rst,
	o => count_hf_internal
);

SCALE_HF:hf_prescaler PORT MAP(
  clk => clk,
  rst => rst,
  i => count_hf_internal,
  o => o,
  tooHigh => tooHigh,
  tooLow => tooLow,
  kilo => KHZled,
  mega => MHZled,
  pointPosition => pointPosition
);


end Behavioral;


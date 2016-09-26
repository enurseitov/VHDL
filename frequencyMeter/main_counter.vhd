
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity main_counter is
    Port ( wave_in : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           tooLowLED : out  STD_LOGIC;
           tooHighLED : out  STD_LOGIC;
           srcLF : out  STD_LOGIC;
           srcHF : out  STD_LOGIC;
			  HZled, KHZled, MHZled : out  STD_LOGIC;
			  pointPosition : out STD_LOGIC_VECTOR (3 downto 0)			  
			  );
end main_counter;

architecture Behavioral of main_counter is

COMPONENT detector_lf
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  tooLow, tooHigh : out STD_LOGIC;
			  pointPosition : out STD_LOGIC_VECTOR(3 downto 0);
			  rst : in STD_LOGIC;
			  HZled : out STD_LOGIC
			  );
END COMPONENT;

COMPONENT detector_hf_all
    Port ( i : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
			  tooLow, tooHigh : out STD_LOGIC;
			  KHZled, MHZled : out STD_LOGIC;
			  pointPosition : out STD_LOGIC_VECTOR (3 downto 0);
			  rst : in STD_LOGIC
			  );
END COMPONENT;

COMPONENT source_mux
    Port ( inHF : in  STD_LOGIC_VECTOR (31 downto 0);
           inLF : in  STD_LOGIC_VECTOR (31 downto 0);
			  pointHF : in  STD_LOGIC_VECTOR (3 downto 0);
			  pointLF : in  STD_LOGIC_VECTOR (3 downto 0);
			  tooLowHF, tooHighHF,tooLowLF, tooHighLF : in STD_LOGIC;
           tooLow : out  STD_LOGIC;
           tooHigh : out  STD_LOGIC;
           srcHF : out  STD_LOGIC;
           srcLF : out  STD_LOGIC;
			  o : out  STD_LOGIC_VECTOR (31 downto 0);
			  pointPosition : out STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

signal hf : STD_LOGIC_VECTOR(31 downto 0);
signal lf : STD_LOGIC_VECTOR(31 downto 0);
signal tooLowHF, tooHighHF,tooLowLF, tooHighLF : STD_LOGIC;
signal pointHF, pointLF : STD_LOGIC_VECTOR (3 downto 0);

begin
LF_DET:detector_lf PORT MAP (
  i => wave_in,
  o  => lf,
  clk  => clk,
  tooLow => tooLowLF,
  tooHigh  => tooHighLF,
  pointPosition  => pointLF,
  rst  => rst,
  HZled  => HZled
);

HF_DET:detector_hf_all PORT MAP (
  i => wave_in,
  o => hf,
  clk => clk,
  tooLow => tooLowHF,
  tooHigh => tooHighHF,
  KHZled => KHZled,
  MHZled => MHZled,
  pointPosition => pointHF,
  rst => rst
);

SRC_MUX:source_mux PORT MAP (
  inHF => hf,
  inLF => lf,
  pointHF => pointHF,
  pointLF => pointLF,
  tooLowHF => tooLowHF,
  tooHighHF => tooHighHF,
  tooLowLF => tooLowLF,
  tooHighLF => tooHighLF,
  tooLow => tooLowLED,
  tooHigh => tooHighLED,
  srcHF => srcHF,
  srcLF => srcLF,
  o => o,
  pointPosition => pointPosition
);

end Behavioral;


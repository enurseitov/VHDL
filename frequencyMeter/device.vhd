
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity device is
    Port ( in_wave : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			     segments_out : out  STD_LOGIC_VECTOR (6 downto 0);
           an_out : out  STD_LOGIC_VECTOR (3 downto 0);
  			  point : out STD_LOGIC;
  			  HZled : out STD_LOGIC;
  			  KHZled : out STD_LOGIC;
  			  MHZled : out STD_LOGIC;
  			  tooHighLED, tooLowLED : out STD_LOGIC;
  			  srcHFLED, srcLFLED : out STD_LOGIC
			  );
end device;

architecture Behavioral of device is

COMPONENT main_counter
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
END COMPONENT;

COMPONENT display_updater
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (15 downto 0);
            iPointPosition : in  STD_LOGIC_VECTOR (3 downto 0);
           oPointPosition : out  STD_LOGIC_VECTOR (3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
END COMPONENT;

COMPONENT display_driver
    Port ( binary_in : in  STD_LOGIC_VECTOR (15 downto 0);
           segments_out : out  STD_LOGIC_VECTOR (6 downto 0);
           an_out : out  STD_LOGIC_VECTOR (3 downto 0);
        point : out STD_LOGIC;
        pointPosition : in STD_LOGIC_VECTOR(3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
END COMPONENT;


SIGNAL frequency : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL frequencyUpdated : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL pointPosition_internal : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL pointPosition_internal_updated : STD_LOGIC_VECTOR (3 downto 0);

begin

MN_COUNT:main_counter PORT MAP (
 wave_in =>  in_wave,
 o =>  frequency,
 clk =>  clk,
 rst =>  rst,
 tooLowLED =>  tooLowLED,
 tooHighLED =>  tooHighLED,
 srcLF =>  srcLFLED,
 srcHF => srcHFLED,
 HZled => HZled,
 KHZled => KHZled,
 MHZled => MHZled,
 pointPosition =>  pointPosition_internal
);


UPD: display_updater PORT MAP (
  i => frequency,
  o => frequencyUpdated,
  iPointPosition => pointPosition_internal,
  oPointPosition => pointPosition_internal_updated,
  clk => clk,
  rst => rst
);


DRV:display_driver PORT MAP (
 binary_in => frequencyUpdated,
 segments_out => segments_out,
 an_out => an_out,
 point => point,
 pointPosition => pointPosition_internal_updated,
 clk => clk,
 rst => rst
);



end Behavioral;


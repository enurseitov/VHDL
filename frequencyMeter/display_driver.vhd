--------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity display_driver is
    Port ( binary_in : in  STD_LOGIC_VECTOR (15 downto 0);
           segments_out : out  STD_LOGIC_VECTOR (6 downto 0);
           an_out : out  STD_LOGIC_VECTOR (3 downto 0);
			  point : out STD_LOGIC;
			  pointPosition : in STD_LOGIC_VECTOR(3 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end display_driver;

architecture Behavioral of display_driver is


COMPONENT display_binary_to_bcd
    port(
        clk, rst: in std_logic;
        binary_in: in std_logic_vector(15 downto 0);
        bcd0, bcd1, bcd2, bcd3: out std_logic_vector(3 downto 0)
    );
END COMPONENT;

COMPONENT display_mux
    Port ( x100 : in  STD_LOGIC_VECTOR (3 downto 0);
           x10 : in  STD_LOGIC_VECTOR (3 downto 0);
           x1 : in  STD_LOGIC_VECTOR (3 downto 0);
           x01 : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0);
			  pointPosition : in STD_LOGIC_VECTOR (3 downto 0);
			  point : out STD_LOGIC
			  );
END COMPONENT;


COMPONENT display_decoder
    Port ( i : in  STD_LOGIC_VECTOR (3 downto 0);
           o : out  STD_LOGIC_VECTOR (0 to 6));
END COMPONENT;

COMPONENT display_freq_divider
    Port (
        clk_in : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
END COMPONENT;

COMPONENT display_bit_shifter
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
END COMPONENT;

--COMPONENT display_temp_buffer
--    Port ( i : in  STD_LOGIC_VECTOR (15 downto 0);
--           o : out  STD_LOGIC_VECTOR (15 downto 0));
--END COMPONENT;

SIGNAL lowFrequencyClock : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL x100, x10, x1, x01 : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL muxOutput : STD_LOGIC_VECTOR (3 downto 0);
SIGNAL bufOutput : STD_LOGIC_VECTOR (15 downto 0);

begin


--BUFF:display_temp_buffer PORT MAP(
--	i => binary_in,
--	o =>bufOutput
--);

BCD:display_binary_to_bcd PORT MAP (
  binary_in => binary_in,
  clk => clk,
  rst => rst,
  bcd0 => x01,
  bcd1 => x1,
  bcd2 => x10,
  bcd3 => x100
  );

MUX:display_mux PORT MAP (
  x01 => x01,
  x1 => x1,
  x10 => x10,
  x100 => x100,
  sel => sel,
  output => muxOutput,
  pointPosition => pointPosition,
  point => point
   
  );

DEC:display_decoder PORT MAP (
  i => muxOutput,
  o => segments_out
  );

DIV:display_freq_divider PORT MAP (
  clk_in => clk,
  clk_out => lowFrequencyClock,
  rst => rst
  );

SHIFT:display_bit_shifter PORT MAP (
  clk => lowFrequencyClock,
  rst => rst,
  output => sel
  );


an_out <=sel;

end Behavioral;


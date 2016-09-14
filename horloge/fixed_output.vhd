
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity fixed_output is
    Port ( output : out  STD_LOGIC_VECTOR (31 downto 0));
end fixed_output;

architecture Behavioral of fixed_output is

begin

output <=  "00000001011111010111100001000000"; -- 25 million

end Behavioral;


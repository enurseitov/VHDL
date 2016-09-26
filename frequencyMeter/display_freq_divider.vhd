library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_freq_divider is
    Port (
        clk_in : in  STD_LOGIC;
        rst  : in  STD_LOGIC;
        clk_out: out STD_LOGIC
    );
end display_freq_divider;

architecture Behavioral of display_freq_divider is
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 124999 := 0;
begin
    frequency_divider: process (rst, clk_in) begin
        if (rst = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = 124999) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;
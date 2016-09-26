
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;



entity hf_prescaler is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           i : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0);
           tooHigh : out  STD_LOGIC;
           tooLow : out  STD_LOGIC;
   
           kilo : out  STD_LOGIC;
           mega : out  STD_LOGIC;
           pointPosition : out  STD_LOGIC_vector (3 downto 0));
end hf_prescaler;

architecture Behavioral of hf_prescaler is

type myStates is (init, check, err, divide1, divide10, divide100, divide1000,  finish);
signal presentState, futureState: myStates;
signal d1, d2, result, temp : unsigned (31 downto 0) := (others => '0');
signal tempPointPosition : STD_LOGIC_VECTOR (3 downto 0) := (others => '1');

begin

M: process (rst, clk)
  begin
  if (rst = '1') then
    presentState <= init;
  elsif (clk'event and clk='1') then
    presentState <= futureState;
  end if;
end process;

F: process (presentState, d1, d2)
  begin
  case presentState is 
    when init =>
      futureState <= check;
      
    when check =>
      if (d1<1000 or d1>=10000000) then -- freq too low or too high
        futureState <= err;
      elsif (d1<10000) then
        futureState <= divide1;
      elsif (d1<100000) then
        futureState <= divide10;
      elsif (d1<1000000) then
        futureState <= divide100;
      elsif (d1<10000000) then
        futureState <= divide1000;
      end if;
  
    when divide1 =>
      futureState <= finish;



    when divide10 =>
      if (d1 > (d2+d2)) then futureState <= divide10;
      else 
        futureState <= finish;   
      end if;

    when divide100 =>
      if (d1 > (d2+d2)) then futureState <= divide100;
      else 
        futureState <= finish;       
      end if;

    when divide1000 =>
      if (d1 > (d2+d2)) then futureState <= divide1000;
      else futureState <= finish;      
      end if;
      
    when err =>     
      futureState <= init;      

    when finish =>      
      futureState <= init;        
  end case;
end process;

G: process (clk)
  begin
  if (clk'event and clk = '1') then
  case presentState is 
    when init =>
      
      d1 <= unsigned(i);

    when check =>
      if (d1<10000) then
        d2 <= to_unsigned(1,32);
      elsif (d1<100000) then
        d2 <= to_unsigned(10,32);
      elsif (d1<1000000) then
        d2 <= to_unsigned(100,32);
      elsif (d1<10000000) then
        d2 <= to_unsigned(1000,32);
      end if;

    when err =>
      if (d1<1000) then tooLow <= '1'; tooHigh <= '0';
      elsif (d1>=10000000) then tooHigh <= '1'; tooLow <= '0';
      end if;
      result <= (others => '0');   
      kilo <= '0';
      mega <= '0';   
		pointPosition <= "1111";

    when divide1 =>
      temp <= d1;
      tempPointPosition <= "0111";
      kilo <= '1';
      mega <= '0';   

    when divide10 =>
      d1 <= d1 - d2;
      temp <= temp + to_unsigned(1,32);
      tempPointPosition <= "1011";
      kilo <= '1';
      mega <= '0';   

    when divide100 =>
      d1 <= d1 - d2;
      temp <= temp + to_unsigned(1,32);
      tempPointPosition <= "1101";
      kilo <= '1';
      mega <= '0';   

    when divide1000 =>
      d1 <= d1 - d2;
      temp <= temp + to_unsigned(1,32);
      tempPointPosition <= "0111";
      kilo <= '0';
      mega <= '1';   
      
    when finish =>
      result <= temp;
		temp <= (others => '0');
      tooLow <= '0';
      tooHigh <= '0';
      pointPosition <= tempPointPosition;
      
      

  end case;
  end if;
end process;

o <= std_logic_vector(result);

end Behavioral;


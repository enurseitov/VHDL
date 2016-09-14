--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: horloge_synthesis.vhd
-- /___/   /\     Timestamp: Tue Sep 13 13:15:53 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm horloge -w -dir netgen/synthesis -ofmt vhdl -sim horloge.ngc horloge_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: horloge.ngc
-- Output file	: C:\Users\ster\VHDL\horloge\netgen\synthesis\horloge_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: horloge
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity horloge is
  port (
    reset : in STD_LOGIC := 'X'; 
    clockOut : out STD_LOGIC; 
    clock : in STD_LOGIC := 'X' 
  );
end horloge;

architecture Structure of horloge is
  signal COUNTER0_Mcount_tempcount_cy_10_rt_2 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_11_rt_4 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_12_rt_6 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_13_rt_8 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_14_rt_10 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_15_rt_12 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_16_rt_14 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_17_rt_16 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_18_rt_18 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_19_rt_20 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_1_rt_22 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_20_rt_24 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_21_rt_26 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_22_rt_28 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_23_rt_30 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_24_rt_32 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_25_rt_34 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_26_rt_36 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_27_rt_38 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_28_rt_40 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_29_rt_42 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_2_rt_44 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_30_rt_46 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_3_rt_48 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_4_rt_50 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_5_rt_52 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_6_rt_54 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_7_rt_56 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_8_rt_58 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy_9_rt_60 : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_xor_31_rt_62 : STD_LOGIC; 
  signal FLIPFLOP0_temp_95 : STD_LOGIC; 
  signal FLIPFLOP0_temp_xor0000 : STD_LOGIC; 
  signal N0 : STD_LOGIC; 
  signal N1 : STD_LOGIC; 
  signal clock_BUFGP_133 : STD_LOGIC; 
  signal comparatorOutput : STD_LOGIC; 
  signal reset_IBUF_151 : STD_LOGIC; 
  signal reset_inv : STD_LOGIC; 
  signal COUNTER0_Mcount_tempcount_cy : STD_LOGIC_VECTOR ( 30 downto 0 ); 
  signal COUNTER0_Mcount_tempcount_lut : STD_LOGIC_VECTOR ( 0 downto 0 ); 
  signal COUNTER0_tempcount : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal Result : STD_LOGIC_VECTOR ( 31 downto 0 ); 
  signal comparatorOutput_wg_cy : STD_LOGIC_VECTOR ( 6 downto 0 ); 
  signal comparatorOutput_wg_lut : STD_LOGIC_VECTOR ( 7 downto 0 ); 
begin
  XST_GND : GND
    port map (
      G => N0
    );
  XST_VCC : VCC
    port map (
      P => N1
    );
  FLIPFLOP0_temp : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => comparatorOutput,
      D => FLIPFLOP0_temp_xor0000,
      Q => FLIPFLOP0_temp_95
    );
  COUNTER0_tempcount_0 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(0),
      Q => COUNTER0_tempcount(0)
    );
  COUNTER0_tempcount_1 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(1),
      Q => COUNTER0_tempcount(1)
    );
  COUNTER0_tempcount_2 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(2),
      Q => COUNTER0_tempcount(2)
    );
  COUNTER0_tempcount_3 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(3),
      Q => COUNTER0_tempcount(3)
    );
  COUNTER0_tempcount_4 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(4),
      Q => COUNTER0_tempcount(4)
    );
  COUNTER0_tempcount_5 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(5),
      Q => COUNTER0_tempcount(5)
    );
  COUNTER0_tempcount_6 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(6),
      Q => COUNTER0_tempcount(6)
    );
  COUNTER0_tempcount_7 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(7),
      Q => COUNTER0_tempcount(7)
    );
  COUNTER0_tempcount_8 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(8),
      Q => COUNTER0_tempcount(8)
    );
  COUNTER0_tempcount_9 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(9),
      Q => COUNTER0_tempcount(9)
    );
  COUNTER0_tempcount_10 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(10),
      Q => COUNTER0_tempcount(10)
    );
  COUNTER0_tempcount_11 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(11),
      Q => COUNTER0_tempcount(11)
    );
  COUNTER0_tempcount_12 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(12),
      Q => COUNTER0_tempcount(12)
    );
  COUNTER0_tempcount_13 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(13),
      Q => COUNTER0_tempcount(13)
    );
  COUNTER0_tempcount_14 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(14),
      Q => COUNTER0_tempcount(14)
    );
  COUNTER0_tempcount_15 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(15),
      Q => COUNTER0_tempcount(15)
    );
  COUNTER0_tempcount_16 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(16),
      Q => COUNTER0_tempcount(16)
    );
  COUNTER0_tempcount_17 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(17),
      Q => COUNTER0_tempcount(17)
    );
  COUNTER0_tempcount_18 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(18),
      Q => COUNTER0_tempcount(18)
    );
  COUNTER0_tempcount_19 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(19),
      Q => COUNTER0_tempcount(19)
    );
  COUNTER0_tempcount_20 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(20),
      Q => COUNTER0_tempcount(20)
    );
  COUNTER0_tempcount_21 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(21),
      Q => COUNTER0_tempcount(21)
    );
  COUNTER0_tempcount_22 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(22),
      Q => COUNTER0_tempcount(22)
    );
  COUNTER0_tempcount_23 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(23),
      Q => COUNTER0_tempcount(23)
    );
  COUNTER0_tempcount_24 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(24),
      Q => COUNTER0_tempcount(24)
    );
  COUNTER0_tempcount_25 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(25),
      Q => COUNTER0_tempcount(25)
    );
  COUNTER0_tempcount_26 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(26),
      Q => COUNTER0_tempcount(26)
    );
  COUNTER0_tempcount_27 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(27),
      Q => COUNTER0_tempcount(27)
    );
  COUNTER0_tempcount_28 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(28),
      Q => COUNTER0_tempcount(28)
    );
  COUNTER0_tempcount_29 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(29),
      Q => COUNTER0_tempcount(29)
    );
  COUNTER0_tempcount_30 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(30),
      Q => COUNTER0_tempcount(30)
    );
  COUNTER0_tempcount_31 : FDC
    port map (
      C => clock_BUFGP_133,
      CLR => reset_inv,
      D => Result(31),
      Q => COUNTER0_tempcount(31)
    );
  COUNTER0_Mcount_tempcount_cy_0_Q : MUXCY
    port map (
      CI => N0,
      DI => N1,
      S => COUNTER0_Mcount_tempcount_lut(0),
      O => COUNTER0_Mcount_tempcount_cy(0)
    );
  COUNTER0_Mcount_tempcount_xor_0_Q : XORCY
    port map (
      CI => N0,
      LI => COUNTER0_Mcount_tempcount_lut(0),
      O => Result(0)
    );
  COUNTER0_Mcount_tempcount_cy_1_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(0),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_1_rt_22,
      O => COUNTER0_Mcount_tempcount_cy(1)
    );
  COUNTER0_Mcount_tempcount_xor_1_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(0),
      LI => COUNTER0_Mcount_tempcount_cy_1_rt_22,
      O => Result(1)
    );
  COUNTER0_Mcount_tempcount_cy_2_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(1),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_2_rt_44,
      O => COUNTER0_Mcount_tempcount_cy(2)
    );
  COUNTER0_Mcount_tempcount_xor_2_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(1),
      LI => COUNTER0_Mcount_tempcount_cy_2_rt_44,
      O => Result(2)
    );
  COUNTER0_Mcount_tempcount_cy_3_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(2),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_3_rt_48,
      O => COUNTER0_Mcount_tempcount_cy(3)
    );
  COUNTER0_Mcount_tempcount_xor_3_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(2),
      LI => COUNTER0_Mcount_tempcount_cy_3_rt_48,
      O => Result(3)
    );
  COUNTER0_Mcount_tempcount_cy_4_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(3),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_4_rt_50,
      O => COUNTER0_Mcount_tempcount_cy(4)
    );
  COUNTER0_Mcount_tempcount_xor_4_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(3),
      LI => COUNTER0_Mcount_tempcount_cy_4_rt_50,
      O => Result(4)
    );
  COUNTER0_Mcount_tempcount_cy_5_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(4),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_5_rt_52,
      O => COUNTER0_Mcount_tempcount_cy(5)
    );
  COUNTER0_Mcount_tempcount_xor_5_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(4),
      LI => COUNTER0_Mcount_tempcount_cy_5_rt_52,
      O => Result(5)
    );
  COUNTER0_Mcount_tempcount_cy_6_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(5),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_6_rt_54,
      O => COUNTER0_Mcount_tempcount_cy(6)
    );
  COUNTER0_Mcount_tempcount_xor_6_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(5),
      LI => COUNTER0_Mcount_tempcount_cy_6_rt_54,
      O => Result(6)
    );
  COUNTER0_Mcount_tempcount_cy_7_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(6),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_7_rt_56,
      O => COUNTER0_Mcount_tempcount_cy(7)
    );
  COUNTER0_Mcount_tempcount_xor_7_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(6),
      LI => COUNTER0_Mcount_tempcount_cy_7_rt_56,
      O => Result(7)
    );
  COUNTER0_Mcount_tempcount_cy_8_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(7),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_8_rt_58,
      O => COUNTER0_Mcount_tempcount_cy(8)
    );
  COUNTER0_Mcount_tempcount_xor_8_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(7),
      LI => COUNTER0_Mcount_tempcount_cy_8_rt_58,
      O => Result(8)
    );
  COUNTER0_Mcount_tempcount_cy_9_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(8),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_9_rt_60,
      O => COUNTER0_Mcount_tempcount_cy(9)
    );
  COUNTER0_Mcount_tempcount_xor_9_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(8),
      LI => COUNTER0_Mcount_tempcount_cy_9_rt_60,
      O => Result(9)
    );
  COUNTER0_Mcount_tempcount_cy_10_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(9),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_10_rt_2,
      O => COUNTER0_Mcount_tempcount_cy(10)
    );
  COUNTER0_Mcount_tempcount_xor_10_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(9),
      LI => COUNTER0_Mcount_tempcount_cy_10_rt_2,
      O => Result(10)
    );
  COUNTER0_Mcount_tempcount_cy_11_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(10),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_11_rt_4,
      O => COUNTER0_Mcount_tempcount_cy(11)
    );
  COUNTER0_Mcount_tempcount_xor_11_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(10),
      LI => COUNTER0_Mcount_tempcount_cy_11_rt_4,
      O => Result(11)
    );
  COUNTER0_Mcount_tempcount_cy_12_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(11),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_12_rt_6,
      O => COUNTER0_Mcount_tempcount_cy(12)
    );
  COUNTER0_Mcount_tempcount_xor_12_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(11),
      LI => COUNTER0_Mcount_tempcount_cy_12_rt_6,
      O => Result(12)
    );
  COUNTER0_Mcount_tempcount_cy_13_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(12),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_13_rt_8,
      O => COUNTER0_Mcount_tempcount_cy(13)
    );
  COUNTER0_Mcount_tempcount_xor_13_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(12),
      LI => COUNTER0_Mcount_tempcount_cy_13_rt_8,
      O => Result(13)
    );
  COUNTER0_Mcount_tempcount_cy_14_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(13),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_14_rt_10,
      O => COUNTER0_Mcount_tempcount_cy(14)
    );
  COUNTER0_Mcount_tempcount_xor_14_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(13),
      LI => COUNTER0_Mcount_tempcount_cy_14_rt_10,
      O => Result(14)
    );
  COUNTER0_Mcount_tempcount_cy_15_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(14),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_15_rt_12,
      O => COUNTER0_Mcount_tempcount_cy(15)
    );
  COUNTER0_Mcount_tempcount_xor_15_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(14),
      LI => COUNTER0_Mcount_tempcount_cy_15_rt_12,
      O => Result(15)
    );
  COUNTER0_Mcount_tempcount_cy_16_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(15),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_16_rt_14,
      O => COUNTER0_Mcount_tempcount_cy(16)
    );
  COUNTER0_Mcount_tempcount_xor_16_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(15),
      LI => COUNTER0_Mcount_tempcount_cy_16_rt_14,
      O => Result(16)
    );
  COUNTER0_Mcount_tempcount_cy_17_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(16),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_17_rt_16,
      O => COUNTER0_Mcount_tempcount_cy(17)
    );
  COUNTER0_Mcount_tempcount_xor_17_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(16),
      LI => COUNTER0_Mcount_tempcount_cy_17_rt_16,
      O => Result(17)
    );
  COUNTER0_Mcount_tempcount_cy_18_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(17),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_18_rt_18,
      O => COUNTER0_Mcount_tempcount_cy(18)
    );
  COUNTER0_Mcount_tempcount_xor_18_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(17),
      LI => COUNTER0_Mcount_tempcount_cy_18_rt_18,
      O => Result(18)
    );
  COUNTER0_Mcount_tempcount_cy_19_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(18),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_19_rt_20,
      O => COUNTER0_Mcount_tempcount_cy(19)
    );
  COUNTER0_Mcount_tempcount_xor_19_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(18),
      LI => COUNTER0_Mcount_tempcount_cy_19_rt_20,
      O => Result(19)
    );
  COUNTER0_Mcount_tempcount_cy_20_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(19),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_20_rt_24,
      O => COUNTER0_Mcount_tempcount_cy(20)
    );
  COUNTER0_Mcount_tempcount_xor_20_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(19),
      LI => COUNTER0_Mcount_tempcount_cy_20_rt_24,
      O => Result(20)
    );
  COUNTER0_Mcount_tempcount_cy_21_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(20),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_21_rt_26,
      O => COUNTER0_Mcount_tempcount_cy(21)
    );
  COUNTER0_Mcount_tempcount_xor_21_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(20),
      LI => COUNTER0_Mcount_tempcount_cy_21_rt_26,
      O => Result(21)
    );
  COUNTER0_Mcount_tempcount_cy_22_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(21),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_22_rt_28,
      O => COUNTER0_Mcount_tempcount_cy(22)
    );
  COUNTER0_Mcount_tempcount_xor_22_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(21),
      LI => COUNTER0_Mcount_tempcount_cy_22_rt_28,
      O => Result(22)
    );
  COUNTER0_Mcount_tempcount_cy_23_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(22),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_23_rt_30,
      O => COUNTER0_Mcount_tempcount_cy(23)
    );
  COUNTER0_Mcount_tempcount_xor_23_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(22),
      LI => COUNTER0_Mcount_tempcount_cy_23_rt_30,
      O => Result(23)
    );
  COUNTER0_Mcount_tempcount_cy_24_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(23),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_24_rt_32,
      O => COUNTER0_Mcount_tempcount_cy(24)
    );
  COUNTER0_Mcount_tempcount_xor_24_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(23),
      LI => COUNTER0_Mcount_tempcount_cy_24_rt_32,
      O => Result(24)
    );
  COUNTER0_Mcount_tempcount_cy_25_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(24),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_25_rt_34,
      O => COUNTER0_Mcount_tempcount_cy(25)
    );
  COUNTER0_Mcount_tempcount_xor_25_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(24),
      LI => COUNTER0_Mcount_tempcount_cy_25_rt_34,
      O => Result(25)
    );
  COUNTER0_Mcount_tempcount_cy_26_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(25),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_26_rt_36,
      O => COUNTER0_Mcount_tempcount_cy(26)
    );
  COUNTER0_Mcount_tempcount_xor_26_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(25),
      LI => COUNTER0_Mcount_tempcount_cy_26_rt_36,
      O => Result(26)
    );
  COUNTER0_Mcount_tempcount_cy_27_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(26),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_27_rt_38,
      O => COUNTER0_Mcount_tempcount_cy(27)
    );
  COUNTER0_Mcount_tempcount_xor_27_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(26),
      LI => COUNTER0_Mcount_tempcount_cy_27_rt_38,
      O => Result(27)
    );
  COUNTER0_Mcount_tempcount_cy_28_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(27),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_28_rt_40,
      O => COUNTER0_Mcount_tempcount_cy(28)
    );
  COUNTER0_Mcount_tempcount_xor_28_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(27),
      LI => COUNTER0_Mcount_tempcount_cy_28_rt_40,
      O => Result(28)
    );
  COUNTER0_Mcount_tempcount_cy_29_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(28),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_29_rt_42,
      O => COUNTER0_Mcount_tempcount_cy(29)
    );
  COUNTER0_Mcount_tempcount_xor_29_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(28),
      LI => COUNTER0_Mcount_tempcount_cy_29_rt_42,
      O => Result(29)
    );
  COUNTER0_Mcount_tempcount_cy_30_Q : MUXCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(29),
      DI => N0,
      S => COUNTER0_Mcount_tempcount_cy_30_rt_46,
      O => COUNTER0_Mcount_tempcount_cy(30)
    );
  COUNTER0_Mcount_tempcount_xor_30_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(29),
      LI => COUNTER0_Mcount_tempcount_cy_30_rt_46,
      O => Result(30)
    );
  COUNTER0_Mcount_tempcount_xor_31_Q : XORCY
    port map (
      CI => COUNTER0_Mcount_tempcount_cy(30),
      LI => COUNTER0_Mcount_tempcount_xor_31_rt_62,
      O => Result(31)
    );
  comparatorOutput_wg_lut_0_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => COUNTER0_tempcount(8),
      I1 => COUNTER0_tempcount(9),
      I2 => COUNTER0_tempcount(7),
      I3 => COUNTER0_tempcount(10),
      O => comparatorOutput_wg_lut(0)
    );
  comparatorOutput_wg_cy_0_Q : MUXCY
    port map (
      CI => N1,
      DI => N0,
      S => comparatorOutput_wg_lut(0),
      O => comparatorOutput_wg_cy(0)
    );
  comparatorOutput_wg_lut_1_Q : LUT4
    generic map(
      INIT => X"8000"
    )
    port map (
      I0 => COUNTER0_tempcount(11),
      I1 => COUNTER0_tempcount(12),
      I2 => COUNTER0_tempcount(6),
      I3 => COUNTER0_tempcount(13),
      O => comparatorOutput_wg_lut(1)
    );
  comparatorOutput_wg_cy_1_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(0),
      DI => N0,
      S => comparatorOutput_wg_lut(1),
      O => comparatorOutput_wg_cy(1)
    );
  comparatorOutput_wg_lut_2_Q : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => COUNTER0_tempcount(14),
      I1 => COUNTER0_tempcount(15),
      I2 => COUNTER0_tempcount(5),
      I3 => COUNTER0_tempcount(16),
      O => comparatorOutput_wg_lut(2)
    );
  comparatorOutput_wg_cy_2_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(1),
      DI => N0,
      S => comparatorOutput_wg_lut(2),
      O => comparatorOutput_wg_cy(2)
    );
  comparatorOutput_wg_lut_3_Q : LUT4
    generic map(
      INIT => X"0200"
    )
    port map (
      I0 => COUNTER0_tempcount(18),
      I1 => COUNTER0_tempcount(17),
      I2 => COUNTER0_tempcount(4),
      I3 => COUNTER0_tempcount(19),
      O => comparatorOutput_wg_lut(3)
    );
  comparatorOutput_wg_cy_3_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(2),
      DI => N0,
      S => comparatorOutput_wg_lut(3),
      O => comparatorOutput_wg_cy(3)
    );
  comparatorOutput_wg_lut_4_Q : LUT4
    generic map(
      INIT => X"0800"
    )
    port map (
      I0 => COUNTER0_tempcount(20),
      I1 => COUNTER0_tempcount(21),
      I2 => COUNTER0_tempcount(3),
      I3 => COUNTER0_tempcount(22),
      O => comparatorOutput_wg_lut(4)
    );
  comparatorOutput_wg_cy_4_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(3),
      DI => N0,
      S => comparatorOutput_wg_lut(4),
      O => comparatorOutput_wg_cy(4)
    );
  comparatorOutput_wg_lut_5_Q : LUT4
    generic map(
      INIT => X"0004"
    )
    port map (
      I0 => COUNTER0_tempcount(23),
      I1 => COUNTER0_tempcount(24),
      I2 => COUNTER0_tempcount(2),
      I3 => COUNTER0_tempcount(25),
      O => comparatorOutput_wg_lut(5)
    );
  comparatorOutput_wg_cy_5_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(4),
      DI => N0,
      S => comparatorOutput_wg_lut(5),
      O => comparatorOutput_wg_cy(5)
    );
  comparatorOutput_wg_lut_6_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => COUNTER0_tempcount(26),
      I1 => COUNTER0_tempcount(27),
      I2 => COUNTER0_tempcount(1),
      I3 => COUNTER0_tempcount(28),
      O => comparatorOutput_wg_lut(6)
    );
  comparatorOutput_wg_cy_6_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(5),
      DI => N0,
      S => comparatorOutput_wg_lut(6),
      O => comparatorOutput_wg_cy(6)
    );
  comparatorOutput_wg_lut_7_Q : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => COUNTER0_tempcount(29),
      I1 => COUNTER0_tempcount(30),
      I2 => COUNTER0_tempcount(0),
      I3 => COUNTER0_tempcount(31),
      O => comparatorOutput_wg_lut(7)
    );
  comparatorOutput_wg_cy_7_Q : MUXCY
    port map (
      CI => comparatorOutput_wg_cy(6),
      DI => N0,
      S => comparatorOutput_wg_lut(7),
      O => comparatorOutput
    );
  FLIPFLOP0_Mxor_temp_xor0000_Result1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => FLIPFLOP0_temp_95,
      I1 => comparatorOutput,
      O => FLIPFLOP0_temp_xor0000
    );
  reset_IBUF : IBUF
    port map (
      I => reset,
      O => reset_IBUF_151
    );
  clockOut_OBUF : OBUF
    port map (
      I => FLIPFLOP0_temp_95,
      O => clockOut
    );
  COUNTER0_Mcount_tempcount_cy_1_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(1),
      O => COUNTER0_Mcount_tempcount_cy_1_rt_22
    );
  COUNTER0_Mcount_tempcount_cy_2_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(2),
      O => COUNTER0_Mcount_tempcount_cy_2_rt_44
    );
  COUNTER0_Mcount_tempcount_cy_3_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(3),
      O => COUNTER0_Mcount_tempcount_cy_3_rt_48
    );
  COUNTER0_Mcount_tempcount_cy_4_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(4),
      O => COUNTER0_Mcount_tempcount_cy_4_rt_50
    );
  COUNTER0_Mcount_tempcount_cy_5_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(5),
      O => COUNTER0_Mcount_tempcount_cy_5_rt_52
    );
  COUNTER0_Mcount_tempcount_cy_6_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(6),
      O => COUNTER0_Mcount_tempcount_cy_6_rt_54
    );
  COUNTER0_Mcount_tempcount_cy_7_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(7),
      O => COUNTER0_Mcount_tempcount_cy_7_rt_56
    );
  COUNTER0_Mcount_tempcount_cy_8_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(8),
      O => COUNTER0_Mcount_tempcount_cy_8_rt_58
    );
  COUNTER0_Mcount_tempcount_cy_9_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(9),
      O => COUNTER0_Mcount_tempcount_cy_9_rt_60
    );
  COUNTER0_Mcount_tempcount_cy_10_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(10),
      O => COUNTER0_Mcount_tempcount_cy_10_rt_2
    );
  COUNTER0_Mcount_tempcount_cy_11_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(11),
      O => COUNTER0_Mcount_tempcount_cy_11_rt_4
    );
  COUNTER0_Mcount_tempcount_cy_12_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(12),
      O => COUNTER0_Mcount_tempcount_cy_12_rt_6
    );
  COUNTER0_Mcount_tempcount_cy_13_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(13),
      O => COUNTER0_Mcount_tempcount_cy_13_rt_8
    );
  COUNTER0_Mcount_tempcount_cy_14_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(14),
      O => COUNTER0_Mcount_tempcount_cy_14_rt_10
    );
  COUNTER0_Mcount_tempcount_cy_15_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(15),
      O => COUNTER0_Mcount_tempcount_cy_15_rt_12
    );
  COUNTER0_Mcount_tempcount_cy_16_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(16),
      O => COUNTER0_Mcount_tempcount_cy_16_rt_14
    );
  COUNTER0_Mcount_tempcount_cy_17_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(17),
      O => COUNTER0_Mcount_tempcount_cy_17_rt_16
    );
  COUNTER0_Mcount_tempcount_cy_18_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(18),
      O => COUNTER0_Mcount_tempcount_cy_18_rt_18
    );
  COUNTER0_Mcount_tempcount_cy_19_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(19),
      O => COUNTER0_Mcount_tempcount_cy_19_rt_20
    );
  COUNTER0_Mcount_tempcount_cy_20_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(20),
      O => COUNTER0_Mcount_tempcount_cy_20_rt_24
    );
  COUNTER0_Mcount_tempcount_cy_21_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(21),
      O => COUNTER0_Mcount_tempcount_cy_21_rt_26
    );
  COUNTER0_Mcount_tempcount_cy_22_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(22),
      O => COUNTER0_Mcount_tempcount_cy_22_rt_28
    );
  COUNTER0_Mcount_tempcount_cy_23_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(23),
      O => COUNTER0_Mcount_tempcount_cy_23_rt_30
    );
  COUNTER0_Mcount_tempcount_cy_24_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(24),
      O => COUNTER0_Mcount_tempcount_cy_24_rt_32
    );
  COUNTER0_Mcount_tempcount_cy_25_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(25),
      O => COUNTER0_Mcount_tempcount_cy_25_rt_34
    );
  COUNTER0_Mcount_tempcount_cy_26_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(26),
      O => COUNTER0_Mcount_tempcount_cy_26_rt_36
    );
  COUNTER0_Mcount_tempcount_cy_27_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(27),
      O => COUNTER0_Mcount_tempcount_cy_27_rt_38
    );
  COUNTER0_Mcount_tempcount_cy_28_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(28),
      O => COUNTER0_Mcount_tempcount_cy_28_rt_40
    );
  COUNTER0_Mcount_tempcount_cy_29_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(29),
      O => COUNTER0_Mcount_tempcount_cy_29_rt_42
    );
  COUNTER0_Mcount_tempcount_cy_30_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(30),
      O => COUNTER0_Mcount_tempcount_cy_30_rt_46
    );
  COUNTER0_Mcount_tempcount_xor_31_rt : LUT1
    generic map(
      INIT => X"2"
    )
    port map (
      I0 => COUNTER0_tempcount(31),
      O => COUNTER0_Mcount_tempcount_xor_31_rt_62
    );
  clock_BUFGP : BUFGP
    port map (
      I => clock,
      O => clock_BUFGP_133
    );
  COUNTER0_Mcount_tempcount_lut_0_INV_0 : INV
    port map (
      I => COUNTER0_tempcount(0),
      O => COUNTER0_Mcount_tempcount_lut(0)
    );
  reset_inv1_INV_0 : INV
    port map (
      I => reset_IBUF_151,
      O => reset_inv
    );

end Structure;


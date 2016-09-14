--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: machine_synthesis.vhd
-- /___/   /\     Timestamp: Wed Sep 14 08:52:56 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm machine -w -dir netgen/synthesis -ofmt vhdl -sim machine.ngc machine_synthesis.vhd 
-- Device	: xc3s500e-4-fg320
-- Input file	: machine.ngc
-- Output file	: C:\Users\ster\VHDL\fsm\netgen\synthesis\machine_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: machine
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

entity machine is
  port (
    clk : in STD_LOGIC := 'X'; 
    rst : in STD_LOGIC := 'X'; 
    i : in STD_LOGIC := 'X'; 
    o : out STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end machine;

architecture Structure of machine is
  signal clk_BUFGP_1 : STD_LOGIC; 
  signal i_IBUF_3 : STD_LOGIC; 
  signal o_0_OBUF_8 : STD_LOGIC; 
  signal o_1_OBUF_9 : STD_LOGIC; 
  signal o_2_OBUF_10 : STD_LOGIC; 
  signal o_3_OBUF_11 : STD_LOGIC; 
  signal presentState_FSM_FFd1_12 : STD_LOGIC; 
  signal presentState_FSM_FFd1_In : STD_LOGIC; 
  signal presentState_FSM_FFd2_14 : STD_LOGIC; 
  signal presentState_FSM_FFd2_In : STD_LOGIC; 
  signal rst_IBUF_17 : STD_LOGIC; 
begin
  presentState_FSM_FFd1 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      CLR => rst_IBUF_17,
      D => presentState_FSM_FFd1_In,
      Q => presentState_FSM_FFd1_12
    );
  presentState_FSM_FFd2 : FDC
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_1,
      CLR => rst_IBUF_17,
      D => presentState_FSM_FFd2_In,
      Q => presentState_FSM_FFd2_14
    );
  presentState_FSM_Out31 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => presentState_FSM_FFd2_14,
      I1 => presentState_FSM_FFd1_12,
      O => o_3_OBUF_11
    );
  presentState_FSM_Out21 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => presentState_FSM_FFd2_14,
      I1 => presentState_FSM_FFd1_12,
      O => o_2_OBUF_10
    );
  presentState_FSM_Out11 : LUT2
    generic map(
      INIT => X"4"
    )
    port map (
      I0 => presentState_FSM_FFd1_12,
      I1 => presentState_FSM_FFd2_14,
      O => o_1_OBUF_9
    );
  presentState_FSM_Out01 : LUT2
    generic map(
      INIT => X"1"
    )
    port map (
      I0 => presentState_FSM_FFd2_14,
      I1 => presentState_FSM_FFd1_12,
      O => o_0_OBUF_8
    );
  presentState_FSM_FFd1_In1 : LUT3
    generic map(
      INIT => X"69"
    )
    port map (
      I0 => i_IBUF_3,
      I1 => presentState_FSM_FFd1_12,
      I2 => presentState_FSM_FFd2_14,
      O => presentState_FSM_FFd1_In
    );
  rst_IBUF : IBUF
    port map (
      I => rst,
      O => rst_IBUF_17
    );
  i_IBUF : IBUF
    port map (
      I => i,
      O => i_IBUF_3
    );
  o_3_OBUF : OBUF
    port map (
      I => o_3_OBUF_11,
      O => o(3)
    );
  o_2_OBUF : OBUF
    port map (
      I => o_2_OBUF_10,
      O => o(2)
    );
  o_1_OBUF : OBUF
    port map (
      I => o_1_OBUF_9,
      O => o(1)
    );
  o_0_OBUF : OBUF
    port map (
      I => o_0_OBUF_8,
      O => o(0)
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_1
    );
  presentState_FSM_FFd2_In1_INV_0 : INV
    port map (
      I => presentState_FSM_FFd2_14,
      O => presentState_FSM_FFd2_In
    );

end Structure;


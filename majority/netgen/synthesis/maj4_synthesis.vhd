--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: maj4_synthesis.vhd
-- /___/   /\     Timestamp: Fri Sep 09 17:31:37 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm maj4 -w -dir netgen/synthesis -ofmt vhdl -sim maj4.ngc maj4_synthesis.vhd 
-- Device	: xc7a100t-3-csg324
-- Input file	: maj4.ngc
-- Output file	: C:\Users\ster\majority\netgen\synthesis\maj4_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: maj4
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

entity maj4 is
  port (
    a : in STD_LOGIC := 'X'; 
    b : in STD_LOGIC := 'X'; 
    c : in STD_LOGIC := 'X'; 
    d : in STD_LOGIC := 'X'; 
    f : out STD_LOGIC 
  );
end maj4;

architecture Structure of maj4 is
  signal a_IBUF_0 : STD_LOGIC; 
  signal b_IBUF_1 : STD_LOGIC; 
  signal c_IBUF_2 : STD_LOGIC; 
  signal d_IBUF_3 : STD_LOGIC; 
  signal f_OBUF_4 : STD_LOGIC; 
begin
  f1 : LUT4
    generic map(
      INIT => X"E880"
    )
    port map (
      I0 => b_IBUF_1,
      I1 => c_IBUF_2,
      I2 => d_IBUF_3,
      I3 => a_IBUF_0,
      O => f_OBUF_4
    );
  a_IBUF : IBUF
    port map (
      I => a,
      O => a_IBUF_0
    );
  b_IBUF : IBUF
    port map (
      I => b,
      O => b_IBUF_1
    );
  c_IBUF : IBUF
    port map (
      I => c,
      O => c_IBUF_2
    );
  d_IBUF : IBUF
    port map (
      I => d,
      O => d_IBUF_3
    );
  f_OBUF : OBUF
    port map (
      I => f_OBUF_4,
      O => f
    );

end Structure;


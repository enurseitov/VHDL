--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: maj4_translate.vhd
-- /___/   /\     Timestamp: Fri Sep 09 17:28:48 2016
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -rpw 100 -tpw 0 -ar Structure -tm maj4 -w -dir netgen/translate -ofmt vhdl -sim maj4.ngd maj4_translate.vhd 
-- Device	: 7a100tcsg324-3
-- Input file	: maj4.ngd
-- Output file	: C:\Users\ster\majority\netgen\translate\maj4_translate.vhd
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
library SIMPRIM;
use SIMPRIM.VCOMPONENTS.ALL;
use SIMPRIM.VPACKAGE.ALL;

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
  f1 : X_LUT4
    generic map(
      INIT => X"E880"
    )
    port map (
      ADR0 => b_IBUF_1,
      ADR1 => c_IBUF_2,
      ADR2 => d_IBUF_3,
      ADR3 => a_IBUF_0,
      O => f_OBUF_4
    );
  a_IBUF : X_BUF
    port map (
      I => a,
      O => a_IBUF_0
    );
  b_IBUF : X_BUF
    port map (
      I => b,
      O => b_IBUF_1
    );
  c_IBUF : X_BUF
    port map (
      I => c,
      O => c_IBUF_2
    );
  d_IBUF : X_BUF
    port map (
      I => d,
      O => d_IBUF_3
    );
  f_OBUF : X_OBUF
    port map (
      I => f_OBUF_4,
      O => f
    );
  NlwBlockROC : X_ROC
    generic map (ROC_WIDTH => 100 ns)
    port map (O => GSR);
  NlwBlockTOC : X_TOC
    port map (O => GTS);

end Structure;


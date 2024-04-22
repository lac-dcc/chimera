--------------------------------------------------------------------------------
--    This file is owned and controlled by Xilinx and must be used solely     --
--    for design, simulation, implementation and creation of design files     --
--    limited to Xilinx devices or technologies. Use with non-Xilinx          --
--    devices or technologies is expressly prohibited and immediately         --
--    terminates your license.                                                --
--                                                                            --
--    XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY    --
--    FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY    --
--    PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE             --
--    IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS      --
--    MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY      --
--    CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY       --
--    RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY       --
--    DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE   --
--    IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR          --
--    REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF         --
--    INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A   --
--    PARTICULAR PURPOSE.                                                     --
--                                                                            --
--    Xilinx products are not intended for use in life support appliances,    --
--    devices, or systems.  Use in such applications are expressly            --
--    prohibited.                                                             --
--                                                                            --
--    (c) Copyright 1995-2013 Xilinx, Inc.                                    --
--    All rights reserved.                                                    --
--------------------------------------------------------------------------------

--------------------------------------------------------------------------------
--    Generated from core with identifier: xilinx.com:ip:blk_mem_gen:7.2      --
--                                                                            --
--    The Xilinx LogiCORE IP Block Memory Generator replaces the Dual Port    --
--    Block Memory and Single Port Block Memory LogiCOREs, but is not a       --
--    direct drop-in replacement.  It should be used in all new Xilinx        --
--    designs. The core supports RAM and ROM functions over a wide range of   --
--    widths and depths. Use this core to generate block memories with        --
--    symmetric or asymmetric read and write port widths, as well as cores    --
--    which can perform simultaneous write operations to separate             --
--    locations, and simultaneous read operations from the same location.     --
--    For more information on differences in interface and feature support    --
--    between this core and the Dual Port Block Memory and Single Port        --
--    Block Memory LogiCOREs, please consult the data sheet.                  --
--------------------------------------------------------------------------------
-- Synthesized Netlist Wrapper
-- This file is provided to wrap around the synthesized netlist (if appropriate)

-- Interfaces:
--   CLK.ACLK
--     AXI4 Interconnect Clock Input
--   RST.ARESETN
--     AXI4 Interconnect Reset Input
--   AXI_SLAVE_S_AXI
--     AXI_SLAVE
--   AXILite_SLAVE_S_AXI
--     AXILite_SLAVE
--   BRAM_PORTA
--     BRAM_PORTA
--   BRAM_PORTB
--     BRAM_PORTB

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY edidram IS
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    clkb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END edidram;

ARCHITECTURE spartan6 OF edidram IS
BEGIN

  -- WARNING: This file provides an entity declaration with empty architecture, it
  --          does not support direct instantiation. Please use an instantiation
  --          template (VHO) to instantiate the IP within a design.

END spartan6;

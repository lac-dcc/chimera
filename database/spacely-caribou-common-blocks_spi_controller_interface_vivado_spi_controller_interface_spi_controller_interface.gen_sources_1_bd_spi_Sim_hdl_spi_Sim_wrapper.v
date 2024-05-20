// This program was cloned from: https://github.com/SpacelyProject/spacely-caribou-common-blocks
// License: Apache License 2.0

//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2022.1 (lin64) Build 3526262 Mon Apr 18 15:47:01 MDT 2022
//Date        : Thu Apr 25 15:18:14 2024
//Host        : metal.fnal.gov running 64-bit unknown
//Command     : generate_target spi_Sim_wrapper.bd
//Design      : spi_Sim_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module spi_Sim_wrapper
   (clock,
    cs_b,
    pico,
    poci,
    reset,
    spi_clk);
  input clock;
  output cs_b;
  output pico;
  input poci;
  input reset;
  output spi_clk;

  wire clock;
  wire cs_b;
  wire pico;
  wire poci;
  wire reset;
  wire spi_clk;

  spi_Sim spi_Sim_i
       (.clock(clock),
        .cs_b(cs_b),
        .pico(pico),
        .poci(poci),
        .reset(reset),
        .spi_clk(spi_clk));
endmodule

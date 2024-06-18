// This program was cloned from: https://github.com/MongooseOrion/FPGA_atoms
// License: MIT License

//Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
//Date        : Wed Sep 27 15:44:18 2023
//Host        : Blade running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (m00_axi_aclk,
    m00_axi_aresetn,
    m00_axi_init_axi_txn);
  input m00_axi_aclk;
  input m00_axi_aresetn;
  input m00_axi_init_axi_txn;

  wire m00_axi_aclk;
  wire m00_axi_aresetn;
  wire m00_axi_init_axi_txn;

  design_1 design_1_i
       (.m00_axi_aclk(m00_axi_aclk),
        .m00_axi_aresetn(m00_axi_aresetn),
        .m00_axi_init_axi_txn(m00_axi_init_axi_txn));
endmodule

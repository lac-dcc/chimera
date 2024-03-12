//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2017 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------

`timescale 1ns/1ps

module tb_arduino_shield (
  inout wire [51:0] EXP,
  input wire        SPI0,
  input wire        SPI1,
  input wire        I2C0,
  input wire        I2C1,
  input wire        UART0,
  input wire        UART1
  );

  wire [15:0] SH0_IO;
  wire [15:0] SH1_IO;
  wire I2C_OE_0;
  wire I2C_OE_1;


  arduino_adaptor
  u_arduino_adaptor
  (
  .SPI0     (SPI0),
  .SPI1     (SPI1),
  .I2C0     (I2C0),
  .I2C1     (I2C1),
  .EXP      (EXP),
  .SH0_IO   (SH0_IO),
  .SH1_IO   (SH1_IO),
  .I2C_OE_0 (I2C_OE_0),
  .I2C_OE_1 (I2C_OE_1)
  );

  arduino_shield
  u_arduino_shield0
  (
  .UART   (UART0),
  .I2C    (I2C1),
  .SPI    (SPI0),
  .SH_IO  (SH0_IO),
  .I2C_OE (I2C_OE_0)
  );

  arduino_shield

  u_arduino_shield1
  (
  .UART   (UART1),
  .I2C    (I2C1),
  .SPI    (SPI1),
  .SH_IO  (SH1_IO),
  .I2C_OE (I2C_OE_1)
  );

endmodule

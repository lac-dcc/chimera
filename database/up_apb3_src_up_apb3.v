// This program was cloned from: https://github.com/johnathan-convertino-afrl/up_apb3
// License: MIT License

//******************************************************************************
/// @FILE    up_apb3.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2024.03.19
/// @BRIEF   APB3 slave to uP interface
///
/// @LICENSE MIT
///  Copyright 2024 Jay Convertino
///
///  Permission is hereby granted, free of charge, to any person obtaining a copy
///  of this software and associated documentation files (the "Software"), to 
///  deal in the Software without restriction, including without limitation the
///  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or 
///  sell copies of the Software, and to permit persons to whom the Software is 
///  furnished to do so, subject to the following conditions:
///
///  The above copyright notice and this permission notice shall be included in 
///  all copies or substantial portions of the Software.
///
///  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
///  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, 
///  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
///  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER 
///  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING 
///  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
///  IN THE SOFTWARE.
//******************************************************************************

`timescale 1ns/100ps

module up_apb3 #(
    parameter ADDRESS_WIDTH = 16,
    parameter BUS_WIDTH     = 4
  ) 
  (
    //clk reset
    input                       clk,
    input                       rst,
    //APB3
    input  [ADDRESS_WIDTH-1:0]  s_apb_paddr,
    input  [0:0]                s_apb_psel,
    input                       s_apb_penable,
    output                      s_apb_pready,
    input                       s_apb_pwrite,
    input  [BUS_WIDTH*8-1:0]    s_apb_pwdata,
    output [BUS_WIDTH*8-1:0]    s_apb_prdata,
    output                      s_apb_pslverror,
    //uP
    //read interface
    output                      up_rreq,
    input                       up_rack,
    output  [ADDRESS_WIDTH-1:0] up_raddr,
    input   [BUS_WIDTH*8-1:0]   up_rdata,
    //write interface
    output                      up_wreq,
    input                       up_wack,
    output  [ADDRESS_WIDTH-1:0] up_waddr,
    output  [BUS_WIDTH*8-1:0]   up_wdata
  );

  wire  valid;

  //this will add an extra clock cycle. since enable happens after select. both are needed to use the device.
  assign valid = s_apb_psel & s_apb_penable;

  assign s_apb_pslverror = 1'b0;

  assign up_waddr = s_apb_paddr;

  assign up_raddr = s_apb_paddr;

  assign up_wdata = s_apb_pwdata;

  assign s_apb_prdata = up_rdata;

  assign up_wreq = valid & s_apb_pwrite;

  assign up_rreq = valid & ~s_apb_pwrite;

  //diagrams seem to indicate that we should indicate ready when not sel and enable, which is why valid is complimented.
  assign s_apb_pready = up_wack | up_rack | ~valid;
endmodule

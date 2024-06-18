// This program was cloned from: https://github.com/johnathan-convertino-afrl/up_wishbone_pipeline
// License: MIT License

//******************************************************************************
/// @FILE    up_wishbone_pipeline.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2024.03.01
/// @BRIEF   Wishbone slave to uP interface
/// @DETAILS Part select is not supported, if its not a valid byte it gets a zero
///          instead.
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

module up_wishbone_pipeline #(
    parameter ADDRESS_WIDTH = 16,
    parameter BUS_WIDTH     = 4
  ) 
  (
    //clk reset
    input                                 clk,
    input                                 rst,
    //Wishbone
    input                                 s_wb_cyc,
    input                                 s_wb_stb,
    input                                 s_wb_we,
    input   [ADDRESS_WIDTH-1:0]           s_wb_addr,
    input   [BUS_WIDTH*8-1:0]             s_wb_data_i,
    input   [ 3:0]                        s_wb_sel,
    output                                s_wb_ack,
    output                                s_wb_stall,
    output  [BUS_WIDTH*8-1:0]             s_wb_data_o,
    //uP
    //read interface
    output                                up_rreq,
    input                                 up_rack,
    output  [ADDRESS_WIDTH-1:0]           up_raddr,
    input   [BUS_WIDTH*8-1:0]             up_rdata,
    //write interface
    output                                up_wreq,
    input                                 up_wack,
    output  [ADDRESS_WIDTH-1:0]           up_waddr,
    output  [BUS_WIDTH*8-1:0]             up_wdata
  );

  genvar index;

  wire valid;
  wire up_ack;

  reg r_up_rreq;
  reg r_up_wreq;

  reg [7:0] r_rst;

  assign valid = s_wb_cyc & s_wb_stb;

  //if we have not ack'd, cyc is active stall the bus
  assign s_wb_stall = ~up_ack & s_wb_cyc & ~r_rst[0];

  //Convert wishbone requests to up requests
  assign up_rreq  = (r_up_rreq ? r_up_rreq & s_wb_cyc: valid & ~s_wb_we & ~r_rst[0]);
  assign up_wreq  = (r_up_wreq ? r_up_wreq & s_wb_cyc: valid & s_wb_we & ~r_rst[0]);
  //ack is ack for both, or them so either may pass
  assign up_ack = (up_rack | up_wack);
  assign s_wb_ack = up_ack & ~r_rst[0];

  //assign address to correct port if selected
  assign up_raddr = (~s_wb_we & ~r_rst[0] ? s_wb_addr: 0);
  assign up_waddr = ( s_wb_we & ~r_rst[0] ? s_wb_addr : 0);

  //part select isn't actually supported, since uP interface does not support it. Sending 0 instead.
  generate
    for(index = 0; index < 4; index = index + 1)
    begin
      assign up_wdata[((index+1)*8)-1:index*8] = (r_rst[0] | ~s_wb_sel[index] ? 8'hZZ : s_wb_data_i[((index+1)*8)-1:index*8]);
    end
  endgenerate

  generate
    for(index = 0; index < 4; index = index + 1)
    begin
      assign s_wb_data_o[((index+1)*8)-1:index*8] = (r_rst[0] |  ~s_wb_sel[index] ? 8'hZZ : up_rdata[((index+1)*8)-1:index*8]);
    end
  endgenerate

  //register requests to deal with pipeline mode.
  //pipeline mode allows stb to go low but you must ack. CYC will stay high.
  always @(posedge clk)
  begin
    if(rst)
    begin
      r_up_rreq <= 1'b0;
      r_up_wreq <= 1'b0;
    end else begin
      r_up_rreq <= 1'b0;
      r_up_wreq <= 1'b0;

      //when cyc is high and stb isn't register signal to keep previous state
      if(s_wb_cyc & ~s_wb_stb & ~up_ack)
      begin
        r_up_rreq <= r_up_rreq;
        r_up_wreq <= r_up_wreq;
      end

      //when both cyc and stb are high register the correct request
      if(valid)
      begin
        r_up_rreq <= valid & ~s_wb_we;
        r_up_wreq <= valid & s_wb_we;
      end
    end
  end

  //hold reset for 8 more clock cycles to help with routing
  always @(posedge clk)
  begin
    if(rst)
    begin
      r_rst <= ~0;
    end else begin
      r_rst <= {1'b0, r_rst[7:1]};
    end
  end

endmodule

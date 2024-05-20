// This program was cloned from: https://github.com/johnathan-convertino-afrl/up_wishbone_classic
// License: MIT License

//******************************************************************************
/// @FILE    up_wishbone_classic.v
/// @AUTHOR  JAY CONVERTINO
/// @DATE    2024.03.01
/// @BRIEF   Wishbone Classic slave to uP interface
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

module up_wishbone_classic #(
    parameter ADDRESS_WIDTH = 16,
    parameter BUS_WIDTH     = 4
  ) 
  (
    //clk reset
    input                       clk,
    input                       rst,
    //Wishbone
    input                       s_wb_cyc,
    input                       s_wb_stb,
    input                       s_wb_we,
    input   [ADDRESS_WIDTH-1:0] s_wb_addr,
    input   [BUS_WIDTH*8-1:0]   s_wb_data_i,
    input   [BUS_WIDTH-1:0]     s_wb_sel,
    input   [ 1:0]              s_wb_bte,
    input   [ 2:0]              s_wb_cti,
    output                      s_wb_ack,
    output  [31:0]              s_wb_data_o,
    output                      s_wb_err,
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

  `include "wb_common.v"

  localparam init_address  = 1'd0;
  localparam inc_address   = 1'd1;

  genvar index;

  wire  [ADDRESS_WIDTH-1:0] s_next_address;
  wire                      valid;
  wire                      up_ack;

  reg   [ADDRESS_WIDTH-1:0] r_address;
  reg                       r_req;
  reg   [ 7:0]              r_rst;
  reg                       address_state;
  reg   [ 2:0]              r_wb_cti;

  assign s_next_address = wb_next_adr(r_address, r_wb_cti & s_wb_cti, s_wb_bte, BUS_WIDTH * 8);

  assign valid = s_wb_cyc & s_wb_stb & ~r_rst[0];

  //Convert wishbone requests to up requests
  assign up_rreq  = ~s_wb_we & r_req;
  assign up_wreq  =  s_wb_we & r_req;

  //TODO:check for burst address errors
  assign s_wb_err =  1'b0;

  //assign address to correct port if selected
  assign up_raddr = (~s_wb_we & ~r_rst[0] ? (address_state == init_address ? s_wb_addr : s_next_address) : 0);
  assign up_waddr = ( s_wb_we & ~r_rst[0] ? (address_state == init_address ? s_wb_addr : r_address) : 0);

  //ack is ack for both, or them so either may pass
  assign up_ack = (up_rack | up_wack);
  assign s_wb_ack = up_ack;

  //part select isn't supported by the uP interface. Needs to be added outside the core to the device if needed.
  generate
    for(index = 0; index < BUS_WIDTH; index = index + 1)
    begin
      assign up_wdata[((index+1)*8)-1:index*8] = ((~r_rst[0] | ~s_wb_sel[index]) ? s_wb_data_i[((index+1)*8)-1:index*8] : 0);
    end
  endgenerate

  generate
    for(index = 0; index < BUS_WIDTH; index = index + 1)
    begin
      assign s_wb_data_o[((index+1)*8)-1:index*8] = ((~r_rst[0] | s_wb_sel[index]) ? up_rdata[((index+1)*8)-1:index*8] : 0);
    end
  endgenerate

  always @(posedge clk)
  begin
    if(r_rst[0]) begin
      r_address     <= {ADDRESS_WIDTH{1'b0}};
      r_req         <= 1'b0;
      r_wb_cti      <= 0;
      address_state <= init_address;
    end else begin
      address_state <= address_state;

      case(s_wb_cti)
        CTI_CLASSIC:
        begin
          r_req <= valid & !up_ack;
        end
        CTI_CONST_BURST:
        begin
          r_req <= valid;
        end
        CTI_INC_BURST:
        begin
          r_req <= valid;
        end
        CTI_END_OF_BURST:
        begin
          r_req <= valid & !up_ack;
        end
        default:
        begin
          r_req <= 1'b0;
        end
      endcase

      r_wb_cti <= s_wb_cti;

      case(address_state)
        init_address:
        begin
          r_address <= s_wb_addr;

          if((s_wb_cti == CTI_INC_BURST) & r_req)
          begin
            address_state <= inc_address;
          end
        end
        inc_address:
        begin
          r_address <= s_next_address;

          if(wb_is_last(s_wb_cti))
          begin
            r_address <= s_wb_addr;
            address_state <= init_address;
          end
        end
      endcase
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

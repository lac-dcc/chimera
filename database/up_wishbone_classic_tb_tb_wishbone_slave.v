// This program was cloned from: https://github.com/johnathan-convertino-afrl/up_wishbone_classic
// License: MIT License

//******************************************************************************
/// @file    tb_wishbone_slave.v
/// @author  JAY CONVERTINO
/// @date    2021.06.23
/// @brief   SIMPLE TEST BENCH
///
/// @LICENSE MIT
///  Copyright 2021 Jay Convertino
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

`timescale 1 ns/10 ps

module tb_wishbone_slave #(
  parameter IN_FILE_NAME = "in.bin",
  parameter OUT_FILE_NAME = "out.bin",
  parameter RAND_READY = 0);
  
  reg         tb_data_clk = 0;
  reg         tb_rst = 0;

  //up registers
  reg                       r_up_rack;
  reg  [31:0]               r_up_rdata;
  reg                       r_up_wack;

  //control register
  reg  [31:0]               r_control_reg;
  reg  [31:0]               r_address_reg;

  //wishbone registers
  reg r_wb_cyc;
  reg r_wb_stb;
  reg r_wb_we;
  reg [15:0] r_wb_addr;
  reg [31:0] r_wb_data_o;
  reg [3:0]  r_wb_sel_o;
  reg [2:0]  r_wb_cti;

  //wires
  wire tb_wb_ack;
  wire [31:0] tb_wb_data_i;

  wire        tb_uart_loop;

  wire up_rreq;
  wire up_wreq;
  wire [15:0] up_waddr;
  wire [15:0] up_raddr;
  wire [31:0] up_wdata;
  wire  tb_rack;
  wire  tb_wack;
  
  //1ns
  localparam CLK_PERIOD = 20;

  localparam RST_PERIOD = 500;

  //register address decoding
  localparam RX_FIFO_REG = 14'h0;
  localparam ADDRESS_REG = 14'h0;
  localparam STATUS_REG  = 14'h8;
  localparam CONTROL_REG = 14'hC;

  //device under test
  up_wishbone_classic #(
    .ADDRESS_WIDTH(16),
    .BUS_WIDTH(4)
  ) dut (
    //clk reset
    .clk(tb_data_clk),
    .rst(tb_rst),
    //Wishbone
    .s_wb_cyc(r_wb_cyc),
    .s_wb_stb(r_wb_stb),
    .s_wb_we(r_wb_we),
    .s_wb_addr(r_wb_addr),
    .s_wb_data_i(r_wb_data_o),
    .s_wb_sel(r_wb_sel_o),
    .s_wb_cti(r_wb_cti),
    .s_wb_bte(2'b00),
    .s_wb_ack(tb_wb_ack),
    .s_wb_data_o(tb_wb_data_i),
    //uP
    //read interface
    .up_rreq(up_rreq),
    .up_rack(tb_rack),
    .up_raddr(up_raddr),
    .up_rdata(r_up_rdata),
    //write interface
    .up_wreq(up_wreq),
    .up_wack(tb_wack),
    .up_waddr(up_waddr),
    .up_wdata(up_wdata)
  );
  
  //axis clock
  always
  begin
    tb_data_clk <= ~tb_data_clk;
    
    #(CLK_PERIOD/2);
  end
  
  //reset
  initial
  begin
    tb_rst <= 1'b1;
    
    #RST_PERIOD;
    
    tb_rst <= 1'b0;
  end
  
  //copy pasta, fst generation
  initial
  begin
    $dumpfile("tb_wishbone_slave.fst");
    $dumpvars(0,tb_wishbone_slave);
  end

    //up registers decoder
  always @(posedge tb_data_clk)
  begin
    if(tb_rst)
    begin
      r_wb_cyc <= 1'b0;
      r_wb_stb <= 1'b0;
      r_wb_we  <= 1'b1;
      r_wb_addr <= 0;
      r_wb_data_o <= 'hAAAA0000;
      r_wb_sel_o <= ~0;
      r_wb_cti <= 3'b000;
    end else begin
      r_wb_we <= 1'b0;
      r_wb_cyc <= 1'b0;
      r_wb_stb <= 1'b0;
      r_wb_sel_o <= r_wb_sel_o;

      if(r_wb_data_o < 'hAAAA000F)
      begin
        r_wb_cyc <= 1'b1;
        r_wb_stb <= 1'b1;
        r_wb_we  <= 1'b0;

        if(tb_wb_ack == 1'b1)
        begin
          // if(r_wb_data_o == 'hAAAA000E)
          // begin
            r_wb_cti <= 3'b000;
            // r_wb_we <= 1'b0;
            // r_wb_cyc <= 1'b0;
            // r_wb_stb <= 1'b0;
          // end
          r_wb_addr <= r_wb_addr + 'h4;

          r_wb_data_o <= r_wb_data_o + 'h1;
        end
      // end else if(r_wb_data_o == 'hAAAA000F)
      // begin
      //   r_wb_cyc <= 1'b1;
      //   r_wb_stb <= 1'b1;
      //   r_wb_we  <= 1'b1;
      //
      //   r_wb_addr <= 'hC;
      //   if(tb_wb_ack == 1'b1)
      //     r_wb_data_o <= r_wb_data_o + 'h1;
      end
    end
  end

  assign tb_rack = r_up_rack & up_rreq;
  assign tb_wack = r_up_wack & up_wreq;

  //up registers decoder
  always @(posedge tb_data_clk)
  begin
    if(tb_rst)
    begin
      r_up_rack   <= 1'b0;
      r_up_wack   <= 1'b0;
      r_up_rdata  <= 0;

      r_control_reg <= 0;
      r_address_reg <= 0;
    end else begin
      r_up_rack   <= 1'b0;
      r_up_wack   <= 1'b0;
      r_up_rdata  <= r_up_rdata;

      if(up_rreq == 1'b1)
      begin
        r_up_rack <= 1'b1;

        case(up_raddr)
          RX_FIFO_REG: begin
            r_up_rdata <= 'hFEEDBABE;
          end
          STATUS_REG: begin
            //missing: Parity Error, Frame Error (stop bit), Overrun error (RX fifo overflow/cleared on status read).
            r_up_rdata <= 'hB0BDBEEF;
          end
          default:begin
            r_up_rdata <= 'hDEADDEAD;
          end
        endcase
      end

      if(up_wreq == 1'b1)
      begin
        r_up_wack <= 1'b1;

        if(r_up_wack == 1'b1)
        begin
          case(up_waddr)
            ADDRESS_REG: begin
              r_address_reg  <= up_wdata;
            end
            CONTROL_REG: begin
              r_control_reg <= up_wdata;
            end
            default:begin
            end
          endcase
        end
      end
    end
  end
endmodule

// This program was cloned from: https://github.com/lnls-dig/infra-cores
// License: GNU Lesser General Public License v3.0

//
// Title          : Software Wishbone master unit for testbenches
//
// File           : wishbone_master_tb.v
// Author         : Tomasz Wlostowski <tomasz.wlostowski@cern.ch>
// Created        : Tue Mar 23 12:19:36 2010
// Standard       : Verilog 2001
//
// Modified by Lucas Russo <lucas.russo@lnls.br>
// date: 04/10/2012

`include "defines.v"
// Default values of certain WB parameters.

// Bus clock period
`ifndef WB_CLOCK_PERIOD
  `define WB_CLOCK_PERIOD 100
  `define WB_RESET_DELAY (4*`WB_CLOCK_PERIOD)
`endif

// Widths of wishbone address/data/byte select
`ifndef WB_DATA_BUS_WIDTH
  `define WB_DATA_BUS_WIDTH 32
`endif

`ifndef WB_ADDRESS_BUS_WIDTH
  `define WB_ADDRESS_BUS_WIDTH 32
`endif

`define WB_BWSEL_WIDTH ((`WB_DATA_BUS_WIDTH + 7) / 8)

module WB_TEST_MASTER(
  wb_clk
);
// these signals make the WB bus, which can be accessed from outside the module
  reg [`WB_ADDRESS_BUS_WIDTH - 1 : 0] wb_addr = 0;
  reg [`WB_DATA_BUS_WIDTH - 1 : 0]    wb_data_o = 0;
  reg [`WB_BWSEL_WIDTH - 1 : 0]       wb_bwsel = 0;
  wire [`WB_DATA_BUS_WIDTH -1 : 0]    wb_data_i;
  wire wb_ack_i;
  reg   wb_cyc = 0;
  reg   wb_stb = 0;
  reg   wb_we = 0;
  //reg   wb_rst = 0;
  //reg   wb_clk = 1;
  input wb_clk;

  reg wb_tb_verbose = 1;
  reg wb_monitor_bus = 1;
  time last_access_t = 0;
  reg [`WB_DATA_BUS_WIDTH -1 : 0] dummy;

  // ready signal. 1 indicates that WB_TEST unit is initialized and ready for commands
  reg ready = 0;

  // Generated outside this module
  // generate the WB bus clock
  //always #(`WB_CLOCK_PERIOD/2) wb_clk <= ~wb_clk;

  // generate the reset and ready signals
  initial begin
    //#(`WB_RESET_DELAY) wb_rst <= 1;
    #(`WB_CLOCK_PERIOD*2) ready <= 1;
  end

  // enables/disables displaying information about each read/write operation.
  task verbose;
    input onoff;
  begin
    wb_tb_verbose = onoff;
  end
  endtask // wb_verbose

  task monitor_bus;
    input onoff;
  begin
    wb_monitor_bus = onoff;
  end
  endtask // monitor_bus

  task rw_generic;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [`WB_DATA_BUS_WIDTH - 1 : 0] data_i;
    output [`WB_DATA_BUS_WIDTH - 1 : 0] data_o;
    input rw;
    input [3:0] size;
  begin : rw_generic_main

    // Debug information
    if(wb_tb_verbose) begin
      if(rw)
        $display("@%0d: WB write %s: addr %x, data %x",
            $time, (size==1?"byte":((size==2)?"short":"int")),
            addr, data_i);
      else // !rw
        $display("@%0d: WB read %s: addr %x",
            $time, (size==1?"byte":((size==2)?"short":"int")),
          addr);
    end // wb_tb_verbose

    if($time != last_access_t) begin
      @(posedge wb_clk);
    end

    wb_stb<=1;
    wb_cyc<=1;
    //wb_addr <= {2'b00, addr[31:2]};
    wb_addr <= addr;
    wb_we <= rw;

    if(rw) begin
      case(size)
        4: begin wb_data_o<=data_i; wb_bwsel <= 4'b1111; end
        2: begin
          if(addr[1]) begin
              wb_data_o[31:16] = data_i[15:0];
              wb_bwsel = 4'b1100;
          end else begin
              wb_data_o[15:0] = data_i[15:0];
              wb_bwsel = 4'b0011;
          end
        end
        1: begin
          case(addr[1:0])
            0: begin wb_data_o[31:24] = data_i[7:0]; wb_bwsel <= 4'b1000; end
            1: begin wb_data_o[23:16] = data_i[7:0]; wb_bwsel <= 4'b0100; end
            2: begin wb_data_o[15:8] = data_i[7:0]; wb_bwsel <= 4'b0010; end
            3: begin wb_data_o[7:0] = data_i[7:0]; wb_bwsel <= 4'b0001; end
          endcase // case(addr[1:0])
        end
      endcase // case(size)
    end // if (rw)

    #(`WB_CLOCK_PERIOD-1);

    // Wait for ack.
    // FIXME: insert a maximum wait time
    while(wb_ack_i == 0) begin @(posedge wb_clk); end

    data_o = wb_data_i;
    wb_cyc <= 0;
    wb_we <= 0;
    wb_stb <= 0;

    //if(wb_tb_verbose && !rw)
    //  $display("@%0d: WB read %s: addr %x, data %x",
    //      $time, (size==1?"byte":((size==2)?"short":"int")),
    //      addr, wb_data_i);

      last_access_t = $time;
    end
  endtask // rw_generic

  task write8;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [7 : 0] data_i;
  begin
    rw_generic(addr, data_i, dummy, 1, 1);
  end
  endtask // write8

  task read8;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    output [7 : 0] data_o;
  begin : read8_body
    reg [`WB_DATA_BUS_WIDTH - 1 : 0] rval;
    rw_generic(addr, 0, rval, 0, 1);
    data_o = rval[7:0];
  end
  endtask // read8

  task write32;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    input [31 : 0] data_i;
  begin
    rw_generic(addr, data_i, dummy, 1, 4);
  end
  endtask // write32

  task read32;
    input [`WB_ADDRESS_BUS_WIDTH - 1 : 0] addr;
    output [31 : 0] data_o;
  begin : read32_body
    reg [`WB_DATA_BUS_WIDTH - 1 : 0] rval;
    rw_generic(addr, 0, rval, 0, 4);
    data_o = rval[31:0];
  end
  endtask // read32

  // bus monitor
  always@(posedge wb_clk) begin
    if(wb_monitor_bus && wb_cyc && wb_stb && wb_ack_i)begin
      if(wb_we)
        $display("@%0d: ACK-Write: addr %x wdata %x bwsel %b", $time, wb_addr, wb_data_o, wb_bwsel);
      else
        $display("@%0d: ACK-Read: addr %x rdata %x", $time, wb_addr, wb_data_i);
    end
  end

endmodule

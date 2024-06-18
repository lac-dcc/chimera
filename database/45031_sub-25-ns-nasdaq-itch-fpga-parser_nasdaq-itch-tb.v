// This program was cloned from: https://github.com/mbattyani/sub-25-ns-nasdaq-itch-fpga-parser
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`define NULL 0

// A quick simple testbench for the nasdaq-itch-parser
module nasdaq_itch_tb();
  reg  clock = 0;
  reg  nreset = 0;
  reg  enable = 1;
  reg  command_out_tready = 1;
  wire ethernet_input_tvalid;
  wire ethernet_input_tlast;
  wire ethernet_input_sop;
  wire [3:0] ethernet_input_tkeep;
  wire [31:0] ethernet_input_tdata;
  reg  [31:0] fpga_time;
  wire command_out_tvalid;
  reg  command_out_tvalid_prev;
  wire [296:0] command_out_tdata;
  wire ethernet_input_tready;
  reg  [2:0] config_registers_wr_addr = 0;
  reg  config_registers_wr_en = 0;
  reg  [31:0] config_registers_wr_data = 0;
  reg  [2:0]  config_registers_rd_addr = 0;
  wire [31:0] config_registers_rd_data;

   reg [7:0]  msg_type;
   reg [63:0] order_ref_number;
   reg [63:0] prev_order_ref_number;
   reg [15:0] locate;
   reg        buy_sell;
   reg [31:0] price;
   reg [31:0] num_shares;
   reg [31:0] seqnum32;
   reg [47:0] timestamp;
   reg        sim_done;
   reg        read_packets = 0;
   reg        pause = 0;



// The test signals generation

   // The 322.265625 MHz clock
   always #1.5515151515151516 clock = ~clock;

   integer dbgfile;

   initial
     begin
        nreset = 0;
        @(posedge clock);
        @(posedge clock);
        nreset = 1;
        dbgfile = $fopen("output.txt","w");
     end

   always @(*)
     begin
        timestamp = command_out_tdata[47:0];
        seqnum32 = command_out_tdata[79:48];
        num_shares = command_out_tdata[111:80];
        price = command_out_tdata[143:112];
        buy_sell = command_out_tdata[144];
        locate = command_out_tdata[160:145];
        prev_order_ref_number = command_out_tdata[224:161];
        order_ref_number = command_out_tdata[288:225];
        msg_type = command_out_tdata[296:289];
    end

   always @(posedge clock)
     begin
        if (nreset == 0)
          fpga_time <= 0;
        else
          fpga_time <= fpga_time + 1;

        command_out_tvalid_prev <= command_out_tvalid;

        if (command_out_tvalid && !command_out_tvalid)
          begin
             $fdisplay(dbgfile, "%d %d %d %d %d %d %d %d %d", msg_type, locate, order_ref_number, prev_order_ref_number, buy_sell, price, num_shares, seqnum32, timestamp);
          end

        read_packets <= fpga_time >= 10;

        pause <= (fpga_time < 5) | (fpga_time % 32 == 0);

     end // always @ (posedge clock)

   // You can get pcap_parse here https://github.com/jfzazo/pcapFromVerilog/blob/master/pcap_parse.v
   pcap_parse #(.pcap_filename( "nasdaq-sample-packets.pcap"),
                .AXIS_WIDTH(32),
                .default_ifg(17),
                .CLOCK_FREQ_HZ(322265625)
                ) pcap (.clk(clock),
                        .pause(pause),
                        .ready(ethernet_input_tready),
                        .valid(ethernet_input_tvalid),
                        .data(ethernet_input_tdata),
                        .strb(ethernet_input_tkeep),
                        .sop(ethernet_input_sop),
                        .eop(ethernet_input_tlast),
                        .pcapfinished(pcapfinished));

nasdaq_itch_parser nasdaq_itch_parser (
     .clock(clock),
     .nreset(nreset),
     .enable(enable),
     .command_out_tready(command_out_tready),
     .ethernet_input_tvalid(ethernet_input_tvalid),
     .ethernet_input_tlast(ethernet_input_tlast),
     .ethernet_input_tkeep(ethernet_input_tkeep),
     .ethernet_input_tdata(ethernet_input_tdata),
     .fpga_time(fpga_time),
     .command_out_tvalid(command_out_tvalid),
     .command_out_tdata(command_out_tdata),
     .ethernet_input_tready(ethernet_input_tready),
     .config_registers_wr_addr(config_registers_wr_addr),
     .config_registers_wr_en(config_registers_wr_en),
     .config_registers_wr_data(config_registers_wr_data),
     .config_registers_rd_addr(config_registers_rd_addr),
     .config_registers_rd_data(config_registers_rd_data));

endmodule

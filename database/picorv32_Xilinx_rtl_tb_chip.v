`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   13:24:36 04/11/2020
// Design Name:   chip
// Module Name:   D:/work/CPU/RISCV/picorv32-Xilinx-ISE/xilinx/tb_chip.v
// Project Name:  chip
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: chip
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
`define DEBUGREGS
module testbench;

	// Inputs
	reg clk = 1;
	reg reset_async = 0;
	reg rs232_dce_rxd = 0;
	reg [1:0] buttons_i = 0;

	// Outputs
	wire [3:0] led;
	wire rs232_dce_txd;

   wire FCLKIN_P;
   wire FCLKIN_N;
   wire [3:0] F_LED;

   reg [31:0] test;

  wire       PHY_TXC_GTXCLK;
  wire       PHY_TXCLK;
  wire [7:0] PHY_TXD;
  wire       PHY_TXCTL_TXEN;
  wire       PHY_TXER;

  wire [7:0] PHY_RXD;
  wire       PHY_RXCTL_RXDV;
  wire       PHY_RXER;
  wire       PHY_RXCLK;

   OBUFDS #(
       .IOSTANDARD("DEFAULT"), // Specify the output I/O standard
       .SLEW("SLOW")           // Specify the output slew rate
   ) OBUFDS_inst(
       .O(FCLKIN_P),     // Diff_p output (connect directly to top-level port)
       .OB(FCLKIN_N),   // Diff_n output (connect directly to top-level port)
       .I(clk)      // Buffer input
   );

   localparam ser_period = 10;
   localparam ser_half_period = ser_period*2;//*5/8;

	// Instantiate the Unit Under Test (UUT)
   chip #
       (
         .DMA_RX_INTERVAL (500000/8),
         .UART_BAUD       (ser_period)
       )
   uut
      (
         // .test           (test),
         .FCLKIN_P       (FCLKIN_P),
         .FCLKIN_N       (FCLKIN_N),
         .FPGA_RESET     (reset_async),
         .F_LED          (F_LED),
         .PHY_RESET      (PHY_RESET),

         .PHY_TXC_GTXCLK (PHY_TXC_GTXCLK),
         .PHY_TXCLK      (PHY_TXCLK),
         .PHY_TXD        (PHY_TXD),
         .PHY_TXCTL_TXEN (PHY_TXCTL_TXEN),
         .PHY_TXER       (PHY_TXER),

         .PHY_RXD        (PHY_RXD),
         .PHY_RXCTL_RXDV (PHY_RXCTL_RXDV),
         .PHY_RXER       (PHY_RXER),
         .PHY_RXCLK      (PHY_RXCLK)
      );

   ge_eth inst_ge_eth
      (
         .gmii_rx_clk (PHY_TXC_GTXCLK),
         .gmii_rxd    (PHY_TXD),
         .gmii_rx_dv  (PHY_TXCTL_TXEN),
         .gmii_rx_er  (PHY_TXER),

         .mii_tx_clk  (),
         .gmii_tx_clk (PHY_RXCLK),
         .gmii_txd    (PHY_RXD),
         .gmii_tx_en  (PHY_RXCTL_RXDV),
         .gmii_tx_er  (PHY_RXER)
      );


   glbl glbl();

	always #4 clk = ~clk;
	
   initial begin
      $dumpfile("./rtl/testbench.vcd");
      $dumpvars(0, testbench.uut._top);
      test = 32'd0;
      repeat (2) @(posedge clk);
      reset_async = 1;
      $write("reset finished\n");

      repeat (500000) @(posedge clk);
      // repeat (500000) @(posedge clk);
      
      // repeat (1000) @(posedge clk);

      $finish;
   end

   wire ser_rx = 0;
   wire ser_tx = F_LED[3];

   
   event ser_sample;
   reg [7:0] buffer;

   always begin
      @(negedge ser_tx);

      repeat (ser_half_period) @(posedge clk);
      -> ser_sample; // start bit

      repeat (8) begin
         repeat (ser_half_period) @(posedge clk);
         repeat (ser_half_period) @(posedge clk);
         buffer = {ser_tx, buffer[7:1]};
         -> ser_sample; // data bit
      end

      repeat (ser_half_period) @(posedge clk);
      repeat (ser_half_period) @(posedge clk);
      -> ser_sample; // stop bit

      // if (buffer < 32 || buffer >= 127)
      //    if (buffer == 10)
      //       $display(" ");
      //    else begin
      //       $display("Serial data: %d", buffer);
      //    end
      // else
         $write("%c", buffer);
   end

   initial begin
      $readmemh("firmware/hex/firmwareram00.hex", uut._top._text_RAM._ram_4k_32_0._bram0.mem);
      $readmemh("firmware/hex/firmwareram01.hex", uut._top._text_RAM._ram_4k_32_0._bram1.mem);
      $readmemh("firmware/hex/firmwareram02.hex", uut._top._text_RAM._ram_4k_32_0._bram2.mem);
      $readmemh("firmware/hex/firmwareram03.hex", uut._top._text_RAM._ram_4k_32_0._bram3.mem);
      $readmemh("firmware/hex/firmwareram04.hex", uut._top._text_RAM._ram_4k_32_1._bram0.mem);
      $readmemh("firmware/hex/firmwareram05.hex", uut._top._text_RAM._ram_4k_32_1._bram1.mem);
      $readmemh("firmware/hex/firmwareram06.hex", uut._top._text_RAM._ram_4k_32_1._bram2.mem);
      $readmemh("firmware/hex/firmwareram07.hex", uut._top._text_RAM._ram_4k_32_1._bram3.mem);
      $readmemh("firmware/hex/firmwareram08.hex", uut._top._text_RAM._ram_4k_32_2._bram0.mem);
      $readmemh("firmware/hex/firmwareram09.hex", uut._top._text_RAM._ram_4k_32_2._bram1.mem);
      $readmemh("firmware/hex/firmwareram10.hex", uut._top._text_RAM._ram_4k_32_2._bram2.mem);
      $readmemh("firmware/hex/firmwareram11.hex", uut._top._text_RAM._ram_4k_32_2._bram3.mem);
      $readmemh("firmware/hex/firmwareram12.hex", uut._top._text_RAM._ram_4k_32_3._bram0.mem);
      $readmemh("firmware/hex/firmwareram13.hex", uut._top._text_RAM._ram_4k_32_3._bram1.mem);
      $readmemh("firmware/hex/firmwareram14.hex", uut._top._text_RAM._ram_4k_32_3._bram2.mem);
      $readmemh("firmware/hex/firmwareram15.hex", uut._top._text_RAM._ram_4k_32_3._bram3.mem);
      // $readmemh("firmware/hex/firmwareram16.hex", uut._top._text_RAM._ram_4k_32_4._bram0.mem);
      // $readmemh("firmware/hex/firmwareram17.hex", uut._top._text_RAM._ram_4k_32_4._bram1.mem);
      // $readmemh("firmware/hex/firmwareram18.hex", uut._top._text_RAM._ram_4k_32_4._bram2.mem);
      // $readmemh("firmware/hex/firmwareram19.hex", uut._top._text_RAM._ram_4k_32_4._bram3.mem);
      // $readmemh("firmware/hex/firmwareram20.hex", uut._top._text_RAM._ram_4k_32_5._bram0.mem);
      // $readmemh("firmware/hex/firmwareram21.hex", uut._top._text_RAM._ram_4k_32_5._bram1.mem);
      // $readmemh("firmware/hex/firmwareram22.hex", uut._top._text_RAM._ram_4k_32_5._bram2.mem);
      // $readmemh("firmware/hex/firmwareram23.hex", uut._top._text_RAM._ram_4k_32_5._bram3.mem);
      // $readmemh("firmware/hex/firmwareram24.hex", uut._top._text_RAM._ram_4k_32_6._bram0.mem);
      // $readmemh("firmware/hex/firmwareram25.hex", uut._top._text_RAM._ram_4k_32_6._bram1.mem);
      // $readmemh("firmware/hex/firmwareram26.hex", uut._top._text_RAM._ram_4k_32_6._bram2.mem);
      // $readmemh("firmware/hex/firmwareram27.hex", uut._top._text_RAM._ram_4k_32_6._bram3.mem);
      // $readmemh("firmware/hex/firmwareram28.hex", uut._top._text_RAM._ram_4k_32_7._bram0.mem);
      // $readmemh("firmware/hex/firmwareram29.hex", uut._top._text_RAM._ram_4k_32_7._bram1.mem);
      // $readmemh("firmware/hex/firmwareram30.hex", uut._top._text_RAM._ram_4k_32_7._bram2.mem);
      // $readmemh("firmware/hex/firmwareram31.hex", uut._top._text_RAM._ram_4k_32_7._bram3.mem);

      $readmemh("firmware/hex/firmwareram16.hex", uut._top._heap_RAM._ram_4k_32_0._bram0.mem);
      $readmemh("firmware/hex/firmwareram17.hex", uut._top._heap_RAM._ram_4k_32_0._bram1.mem);
      $readmemh("firmware/hex/firmwareram18.hex", uut._top._heap_RAM._ram_4k_32_0._bram2.mem);
      $readmemh("firmware/hex/firmwareram19.hex", uut._top._heap_RAM._ram_4k_32_0._bram3.mem);
      $readmemh("firmware/hex/firmwareram20.hex", uut._top._heap_RAM._ram_4k_32_1._bram0.mem);
      $readmemh("firmware/hex/firmwareram21.hex", uut._top._heap_RAM._ram_4k_32_1._bram1.mem);
      $readmemh("firmware/hex/firmwareram22.hex", uut._top._heap_RAM._ram_4k_32_1._bram2.mem);
      $readmemh("firmware/hex/firmwareram23.hex", uut._top._heap_RAM._ram_4k_32_1._bram3.mem);
      $readmemh("firmware/hex/firmwareram24.hex", uut._top._heap_RAM._ram_4k_32_2._bram0.mem);
      $readmemh("firmware/hex/firmwareram25.hex", uut._top._heap_RAM._ram_4k_32_2._bram1.mem);
      $readmemh("firmware/hex/firmwareram26.hex", uut._top._heap_RAM._ram_4k_32_2._bram2.mem);
      $readmemh("firmware/hex/firmwareram27.hex", uut._top._heap_RAM._ram_4k_32_2._bram3.mem);
      $readmemh("firmware/hex/firmwareram28.hex", uut._top._heap_RAM._ram_4k_32_3._bram0.mem);
      $readmemh("firmware/hex/firmwareram29.hex", uut._top._heap_RAM._ram_4k_32_3._bram1.mem);
      $readmemh("firmware/hex/firmwareram30.hex", uut._top._heap_RAM._ram_4k_32_3._bram2.mem);
      $readmemh("firmware/hex/firmwareram31.hex", uut._top._heap_RAM._ram_4k_32_3._bram3.mem);
      
      // $readmemh("firmware/hex/firmwareram32.hex", uut._top._heap_RAM._ram_4k_32_0._bram0.mem);
      // $readmemh("firmware/hex/firmwareram33.hex", uut._top._heap_RAM._ram_4k_32_0._bram1.mem);
      // $readmemh("firmware/hex/firmwareram34.hex", uut._top._heap_RAM._ram_4k_32_0._bram2.mem);
      // $readmemh("firmware/hex/firmwareram35.hex", uut._top._heap_RAM._ram_4k_32_0._bram3.mem);
      // $readmemh("firmware/hex/firmwareram36.hex", uut._top._heap_RAM._ram_4k_32_1._bram0.mem);
      // $readmemh("firmware/hex/firmwareram37.hex", uut._top._heap_RAM._ram_4k_32_1._bram1.mem);
      // $readmemh("firmware/hex/firmwareram38.hex", uut._top._heap_RAM._ram_4k_32_1._bram2.mem);
      // $readmemh("firmware/hex/firmwareram39.hex", uut._top._heap_RAM._ram_4k_32_1._bram3.mem);
      // $readmemh("firmware/hex/firmwareram40.hex", uut._top._heap_RAM._ram_4k_32_2._bram0.mem);
      // $readmemh("firmware/hex/firmwareram41.hex", uut._top._heap_RAM._ram_4k_32_2._bram1.mem);
      // $readmemh("firmware/hex/firmwareram42.hex", uut._top._heap_RAM._ram_4k_32_2._bram2.mem);
      // $readmemh("firmware/hex/firmwareram43.hex", uut._top._heap_RAM._ram_4k_32_2._bram3.mem);
      // $readmemh("firmware/hex/firmwareram44.hex", uut._top._heap_RAM._ram_4k_32_3._bram0.mem);
      // $readmemh("firmware/hex/firmwareram45.hex", uut._top._heap_RAM._ram_4k_32_3._bram1.mem);
      // $readmemh("firmware/hex/firmwareram46.hex", uut._top._heap_RAM._ram_4k_32_3._bram2.mem);
      // $readmemh("firmware/hex/firmwareram47.hex", uut._top._heap_RAM._ram_4k_32_3._bram3.mem);
      // $readmemh("firmware/hex/firmwareram48.hex", uut._top._heap_RAM._ram_4k_32_4._bram0.mem);
      // $readmemh("firmware/hex/firmwareram49.hex", uut._top._heap_RAM._ram_4k_32_4._bram1.mem);
      // $readmemh("firmware/hex/firmwareram50.hex", uut._top._heap_RAM._ram_4k_32_4._bram2.mem);
      // $readmemh("firmware/hex/firmwareram51.hex", uut._top._heap_RAM._ram_4k_32_4._bram3.mem);
      // $readmemh("firmware/hex/firmwareram52.hex", uut._top._heap_RAM._ram_4k_32_5._bram0.mem);
      // $readmemh("firmware/hex/firmwareram53.hex", uut._top._heap_RAM._ram_4k_32_5._bram1.mem);
      // $readmemh("firmware/hex/firmwareram54.hex", uut._top._heap_RAM._ram_4k_32_5._bram2.mem);
      // $readmemh("firmware/hex/firmwareram55.hex", uut._top._heap_RAM._ram_4k_32_5._bram3.mem);
      // $readmemh("firmware/hex/firmwareram56.hex", uut._top._heap_RAM._ram_4k_32_6._bram0.mem);
      // $readmemh("firmware/hex/firmwareram57.hex", uut._top._heap_RAM._ram_4k_32_6._bram1.mem);
      // $readmemh("firmware/hex/firmwareram58.hex", uut._top._heap_RAM._ram_4k_32_6._bram2.mem);
      // $readmemh("firmware/hex/firmwareram59.hex", uut._top._heap_RAM._ram_4k_32_6._bram3.mem);
      // $readmemh("firmware/hex/firmwareram60.hex", uut._top._heap_RAM._ram_4k_32_7._bram0.mem);
      // $readmemh("firmware/hex/firmwareram61.hex", uut._top._heap_RAM._ram_4k_32_7._bram1.mem);
      // $readmemh("firmware/hex/firmwareram62.hex", uut._top._heap_RAM._ram_4k_32_7._bram2.mem);
      // $readmemh("firmware/hex/firmwareram63.hex", uut._top._heap_RAM._ram_4k_32_7._bram3.mem);
   end	

endmodule

module ge_eth(
    input  wire                       gmii_rx_clk,
    input  wire [7:0]                 gmii_rxd,
    input  wire                       gmii_rx_dv,
    input  wire                       gmii_rx_er,
    input  wire                       mii_tx_clk,
    output wire                       gmii_tx_clk,
    output wire [7:0]                 gmii_txd,
    output wire                       gmii_tx_en,
    output wire                       gmii_tx_er
   );

   reg clk = 0; 
   reg resetn;

   reg [31:0] tx_axis_tdata;
   reg [ 3:0] tx_axis_tkeep;
   reg        tx_axis_tvalid;
   wire       tx_axis_tready;
   reg        tx_axis_tlast;
   reg        tx_axis_tuser = 0;

   wire [31:0] rx_axis_tdata;
   wire [ 3:0] rx_axis_tkeep;
   wire        rx_axis_tvalid;
   reg    rx_axis_tready;
   wire        rx_axis_tlast;
   wire        rx_axis_tuser;

   always #4 clk = ~clk;
   
   initial begin
      resetn = 0;
      tx_axis_tvalid = 0;
      tx_axis_tdata = 0;
      tx_axis_tkeep = 0;
      tx_axis_tlast = 0;
      repeat (100) @(posedge clk);
      resetn = 1;
   end



    eth_mac_1g_gmii_fifo #(
        .TARGET("XILINX"),
        .IODDR_STYLE("IODDR"),
        .CLOCK_INPUT_STYLE("BUFG"),
        .ENABLE_PADDING(1),
        .MIN_FRAME_LENGTH(64),
        .AXIS_DATA_WIDTH(32),
        .TX_FIFO_DEPTH(4096),
        .TX_FRAME_FIFO(1),
        .RX_FIFO_DEPTH(4096),
        .RX_FRAME_FIFO(1)
    )
    eth_mac_inst (
        .gtx_clk(clk),
        .gtx_rst(~resetn),
        .logic_clk(clk),
        .logic_rst(~resetn),

        .tx_axis_tdata(tx_axis_tdata),
        .tx_axis_tvalid(tx_axis_tvalid),
        .tx_axis_tready(tx_axis_tready),
        .tx_axis_tlast(tx_axis_tlast),
        .tx_axis_tuser(tx_axis_tuser),
        .tx_axis_tkeep(tx_axis_tkeep),

        .rx_axis_tdata(rx_axis_tdata),
        .rx_axis_tvalid(rx_axis_tvalid),
        .rx_axis_tready(rx_axis_tready),
        .rx_axis_tlast(rx_axis_tlast),
        .rx_axis_tuser(rx_axis_tuser),
        .rx_axis_tkeep(rx_axis_tkeep),

        .gmii_rx_clk(gmii_rx_clk),
        .gmii_rxd(gmii_rxd),
        .gmii_rx_dv(gmii_rx_dv),
        .gmii_rx_er(gmii_rx_er),
        .gmii_tx_clk(gmii_tx_clk),
        .mii_tx_clk(mii_tx_clk),
        .gmii_txd(gmii_txd),
        .gmii_tx_en(gmii_tx_en),
        .gmii_tx_er(gmii_tx_er),

        .tx_fifo_overflow(),
        .tx_fifo_bad_frame(),
        .tx_fifo_good_frame(),
        .rx_error_bad_frame(),
        .rx_error_bad_fcs(),
        .rx_fifo_overflow(),
        .rx_fifo_bad_frame(),
        .rx_fifo_good_frame(),
        .speed(),

        .ifg_delay(12)
    );

   reg    [ 3:0] bytes2keep;

   always @(*) begin
      case(frame_length[1:0])
      2'h3: bytes2keep = 4'd7;
      2'h2: bytes2keep = 4'd3;
      2'h1: bytes2keep = 4'd1;
      2'h0: bytes2keep = 4'd0;
      endcase
   end

   integer seed;

   initial  begin seed =  0; end

   reg [7:0] frame_length;

   reg [47:0] dst_mac = 48'hff_ff_ff_ff_ff_ff;
   reg [47:0] src_mac = 48'haa_cc_dd_ee_bb_aa;

   task tx_frame;
   integer I;
      begin
         tx_axis_tvalid <= 0;
         tx_axis_tdata <= 0;
         tx_axis_tkeep <= 0;
         tx_axis_tlast <= 0;

         frame_length <= {$random(seed)}%128+16;
         wait (tx_axis_tready == 1'b1);
         tx_axis_tvalid <= 0;
         tx_axis_tdata <= 0;
         tx_axis_tkeep <= 0;
         tx_axis_tlast <= 0;
         I <= {$random(seed)}%2;
         @(posedge clk);

         

         while (frame_length > 0) begin
            if (frame_length >= 4)
               frame_length <= frame_length - 4;
            else begin
               frame_length <= 0;
            end

            tx_axis_tvalid <= 1;
            if (I == 0) begin          tx_axis_tdata <= 32'h00350a00;
            end else if (I == 1) begin tx_axis_tdata <= 32'he0000201;
            end else if (I == 2) begin tx_axis_tdata <= 32'hbda1684c;
            end else if (I == 3) begin tx_axis_tdata <= 32'h01000608;
            end else if (I == 4) begin tx_axis_tdata <= 32'h04060008;
            end else if (I == 5) begin tx_axis_tdata <= 32'he0000100;
            end else if (I == 6) begin tx_axis_tdata <= 32'hbda1684c;
            end else if (I == 7) begin tx_axis_tdata <= 32'h8101a8c0;
            end else if (I == 8) begin tx_axis_tdata <= 32'h00000000;
            end else if (I == 9) begin tx_axis_tdata <= 32'ha8c00000;
            end else if (I == 10) begin tx_axis_tdata <= 32'h00000a01;
            end else begin
              tx_axis_tdata <= $random(seed);
            end
            I <= I + 1;
            tx_axis_tkeep <= (frame_length < 32'd4) ? bytes2keep : 4'hf;
            tx_axis_tlast <= (frame_length <= 32'd4) ? 1 : 0;
            @(posedge clk);
         end
         tx_axis_tvalid <= 0;
         tx_axis_tdata <= 0;
         tx_axis_tkeep <= 0;
         tx_axis_tlast <= 0;
         @(posedge clk);
      end
   endtask

   initial begin
      

      while(1) begin
       # ($random(seed)%50000 + 50000);
      tx_frame();        

      end
   end

endmodule

// This program was cloned from: https://github.com/DangerousPrototypes/BusPirateUltraHDL
// License: GNU General Public License v3.0

`timescale 1ns/1ps
`define DUMPSTR(x) `"x.vcd`"

`define WRITE(address,data) mc_add <= address;mc_data_reg <= data;repeat(3)@(posedge clk);mc_we=0;repeat(6)@(posedge clk);mc_we=1;repeat(3)@(posedge clk)
`define READ(address,data) mc_add <= address;mc_data_reg <= data;repeat(3)@(posedge clk);mc_oe=0;repeat(6)@(posedge clk);mc_oe=1;repeat(3)@(posedge clk)

module buspirate_tb();

  parameter DURATION = 10;
  parameter MC_DATA_WIDTH = 16;
  parameter MC_ADD_WIDTH = 6;
  parameter LA_WIDTH = 8;
  parameter LA_CHIPS = 2;
  parameter BP_PINS = 8;
  parameter FIFO_WIDTH = 16;
  parameter FIFO_DEPTH = 256;

  reg clk, rst;

  wire [BP_PINS-1:0] bpio_buffer_io;
  wire [BP_PINS-1:0] bpio_buffer_dir, bpio_buffer_od,bpio_contention, bpio_state;
  reg [BP_PINS-1:0] bpio_test_input; //load test input values here
  wire [LA_CHIPS-1:0] sram_clock;
  wire [LA_CHIPS-1:0] sram_cs;
  wire [LA_WIDTH-1:0] sram_sio;
  reg [LA_WIDTH-1:0] sram_sio_d;
  wire lat_oe, lat_dir;
  reg [LA_WIDTH-1:0] lat;
  reg mcu_clock;
  reg mcu_cs;
  reg mcu_mosi; //sio0
  wire mcu_miso; //sio1
  reg mc_oe, mc_ce, mc_we;
  reg [MC_ADD_WIDTH-1:0] mc_add;
  wire [MC_DATA_WIDTH-1:0] mc_data;
  reg [MC_DATA_WIDTH-1:0] mc_data_reg;
  wire bp_active, bp_fifo_in_full,bp_fifo_out_nempty;
  reg bp_fifo_clear;

  wire adc_mux_en;
  wire [3:0] adc_mux_s;
  wire adc_cs, adc_clock;
  reg adc_data;
  wire pullup_enable;



  assign mc_data=(mc_oe)?mc_data_reg:16'hzzzz;

  assign sram_sio=(!mc_oe)?sram_sio_d:8'hzz;


  top #(
    .MC_DATA_WIDTH(MC_DATA_WIDTH),
    .MC_ADD_WIDTH(MC_ADD_WIDTH),
    .LA_WIDTH(LA_WIDTH),
    .LA_CHIPS(LA_CHIPS),
    .BP_PINS(BP_PINS),
    .FIFO_WIDTH(FIFO_WIDTH),
    .FIFO_DEPTH(FIFO_DEPTH)
    )buspirate(
    .clock(clk),
    //.reset(rst),
    .bpio_buffer_io(bpio_buffer_io),
    .bpio_buffer_dir(bpio_buffer_dir),
    .bpio_buffer_od(bpio_buffer_od),
    .sram_clock(sram_clock),
    .sram_cs(sram_cs),
    .sram_sio(sram_sio),
    .lat_oe(lat_oe),
    .lat_dir(lat_dir),
    .lat(lat),
    .mcu_clock(mcu_clock),
    .mcu_mosi(mcu_mosi),
    .mcu_miso(mcu_miso),
    .mc_oe(mc_oe),
    .mc_ce(mc_ce),
    .mc_we(mc_we),
    .mc_add(mc_add),
    .mc_data(mc_data),
    .bp_active(bp_active),
    .bp_fifo_in_full(bp_fifo_in_full),
    .bp_fifo_out_nempty(bp_fifo_out_nempty),
    .bp_fifo_clear(bp_fifo_clear),
    .adc_mux_en(adc_mux_en),
    .adc_mux_s(adc_mux_s),
    .adc_cs(adc_cs),
    .adc_clock(adc_clock),
    .adc_data(adc_data),
    .pullup_enable(pullup_enable)


    );

    //this simulates the 74LVC logic buffers so we can see the results in simulation
    //the output from the iobuff "hardware driver" goes into here instead of physical hardware
    iobufphy BP_BUF[BP_PINS-1:0](
        .iopin_state(bpio_state),
        .iopin_contention(bpio_contention),
        .iopin_input(bpio_test_input),
      //hardware driver (reversed input/outputs from above)
        .bufdir(bpio_buffer_dir),
        .bufod(bpio_buffer_od),
        .bufio(bpio_buffer_io)
      );

    initial begin
      clk = 1'b0;
      rst = 1'b1;
      repeat(4) #10 clk = ~clk;
      rst = 1'b0;
      forever #10 clk = ~clk; // generate a clock
    end

    initial begin
      $dumpfile(`DUMPSTR(`VCD_OUTPUT));
      $dumpvars(0, buspirate_tb);
      bpio_test_input<=5'b11111;
      mc_we<=1;
      mc_oe<=1;
      mc_ce<=0;
      bp_fifo_clear<=0;
      adc_data<=1'b1;
      @(negedge rst); // wait for reset
      repeat(10) @(posedge clk);
      //IO pins setup
      `WRITE(6'h00,16'h00FB);//od|oe
      `WRITE(6'h01,16'h0004);//hl|dir
      bpio_test_input<=5'b11111;
      `WRITE(6'h03,16'b10001000);//pause BPSM
      `WRITE(6'h07,16'hFE00);//start logic analyzer
      `WRITE(6'h07,16'h81FF);//IO pins high
      `WRITE(6'h07,16'h8100); //IO pins low
      `WRITE(6'h07,16'h8600); //ADC measurement!!!!
      `WRITE(6'h07,16'h8500); //ADC measurement!!!!
      `WRITE(6'h07,16'h08aa); //write SPI data
      `WRITE(6'h07,16'h08ff);
      //`WRITE(6'h07,16'hFD00);//halt command
      `WRITE(6'h07,16'h0800);
      `WRITE(6'h07,16'h840F); //delay 0x0f
      `WRITE(6'h07,16'h81FF); //IO pins high
      `WRITE(6'h07,16'hFF00); //stop logic analyzer
      `WRITE(6'h03,16'b00000000);//trigger BP SM
      /*repeat(30)@(posedge clk);
      bp_fifo_clear<=1;
      repeat(4)@(posedge clk);
      bp_fifo_clear<=0;*/
      repeat(100)@(posedge clk);
      `WRITE(6'h03,16'b00000000);//trigger BP SM
      repeat(200)@(posedge clk);
      $finish;
    end

endmodule

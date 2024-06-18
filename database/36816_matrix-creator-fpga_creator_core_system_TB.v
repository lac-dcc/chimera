// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module nfc_spi (
  input      [7:0] data_nfc,
  input            nfc_sck ,
  output reg       nfc_miso
);

  parameter TBIT = 1;
  initial begin
    nfc_miso = 0;
  end

  reg [5:0] n;

  always @(*) begin
    for(n=0; n<8; n=n+1) begin
      nfc_miso <= data_nfc[7-n];
      repeat(TBIT) begin
        @(negedge nfc_sck);
      end
    end
    nfc_miso <= 0;

  end

endmodule

module system_TB;

  // Inputs
  reg clk;
  reg clk_esp;
  reg resetn;
  reg rpi_mosi;
  reg rpi_ss;
  reg rpi_sck;
  reg esp_mosi;
  reg esp_ss;
  reg esp_sck;
  reg ss1;
  reg       uart0_rx;
  reg [7:0] pdm_data;
  reg       uart_rxd;

  // Outputs
  wire        miso   ;
  wire [15:0] gpio_io;


  wire nfc_sck ;
  wire nfc_miso;

  system uut (
    .clk_50  (clk     ),
    .resetn  (resetn  ),
    .mosi    (rpi_mosi    ),
    .ss      (rpi_ss      ),
    .ss1     (ss1     ),
    .sck     (rpi_sck     ),
    .miso    (rpi_miso    ),
    .pdm_data(pdm_data),
    .nfc_miso(nfc_miso),
    .nfc_sck (nfc_sck ),
    .gpio_io (gpio_io ),
    .zwave_rxd (uart_rxd)
  );

  nfc_spi nfc (
    .data_nfc(8'hAA   ),
    .nfc_sck (nfc_sck ),
    .nfc_miso(nfc_miso)
  );

  initial begin
    // Initialize Inputs
    resetn = 0; clk = 0; rpi_mosi = 0; rpi_ss = 1; rpi_sck = 1; uart0_rx = 0; ss1 = 1;
  end
  
//------------------------------------------
//          TRI-STATE GENERATION
//------------------------------------------
parameter PERIOD_INPUT = 8000;
parameter real DUTY_CYCLE_INPUT = 0.8;

reg [15:0] data;
reg [15:0] gpio_dir;

genvar k;
generate 
  for (k=0;k<16;k=k+1)  begin: gpio_tris
    assign gpio_io[k] = ~(gpio_dir[k]) ? data[k] : 1'bz;
  end
endgenerate

initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            data = 16'h0000;
            #(PERIOD_INPUT-(PERIOD_INPUT*DUTY_CYCLE_INPUT)) data = 16'hFFFF;
            #(PERIOD_INPUT*DUTY_CYCLE_INPUT);
        end
    end


//------------------------------------------
//          RESET GENERATION
//------------------------------------------

event reset_trigger;
event reset_done_trigger;

initial begin 
  forever begin 
   @ (reset_trigger);
   @ (negedge clk);
   resetn = 1;
   @ (negedge clk);
   resetn = 0;
   -> reset_done_trigger;
  end
end


//------------------------------------------
//          CLOCK GENERATION
//------------------------------------------

    parameter TBIT   = 2;
    parameter PERIOD = 20;
    parameter real DUTY_CYCLE = 0.5;
    parameter OFFSET = 0;

//------------------------------------------
//          MEMORY MAP
//------------------------------------------
    
    parameter bram_addr = 0;
    parameter uart_addr = 14'h0800;
    parameter mica_addr = 14'h1000;
    parameter pxxx_addr = 14'h1800;
    parameter pyyy_addr = 14'h2000;

    parameter read      = 1;
    parameter write     = 0;
    parameter single    = 0;
    parameter burst     = 1;

    initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            clk = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end

    initial    // Clock process for clk
    begin
        #OFFSET;
        forever
        begin
            clk_esp = 1'b0;
            #(PERIOD-(PERIOD*DUTY_CYCLE)) clk_esp = 1'b1;
            #(PERIOD*DUTY_CYCLE);
        end
    end


//------------------------------------------
//          SPI SINGLE TRANSFER TASK
//------------------------------------------
  reg [4:0] i;
  reg [15:0] data_tx_rpi;
  reg [15:0] data_tx_e_rpi;

  task automatic spi_transfer_pi;
    input [14:0] address;
    input [15:0] data;
    input RnW;
  begin
    data_tx_e_rpi = {address,RnW};
    data_tx_rpi = {data_tx_e_rpi[7:0],data_tx_e_rpi[15:8]};
    rpi_ss = 1;
    repeat(4*TBIT) begin
      @(negedge clk);
    end
    rpi_ss = 0; 
    repeat(2*TBIT) begin
      @(negedge clk);
    end
  ///////////////////
  // Send address 
  ///////////////////
    for(i=0; i<16; i=i+1) begin
      rpi_sck = 0;
      rpi_mosi <= data_tx_rpi[15-i];
      repeat(TBIT) begin
        @(negedge clk);
      end
      rpi_sck = 1;  
      repeat(TBIT) begin
        @(negedge clk);
      end
    end
  ///////////////////
  // Send data
  ///////////////////
    data_tx_rpi <= {data[7:0],data[15:8]};
    repeat(2*TBIT) begin
      @(negedge clk);
    end
    for(i=0; i<16; i=i+1) begin
      rpi_sck = 0;
      rpi_mosi <= data_tx_rpi[15-i];
      repeat(TBIT) begin
        @(negedge clk);
      end
      rpi_sck = 1;  
      repeat(TBIT) begin
        @(negedge clk);
      end
    end
    repeat(4*TBIT) begin
      @(negedge clk);
    end   
    rpi_ss = 1;
    repeat(4*TBIT) begin
      @(negedge clk);
    end
  end
  endtask

  reg [4:0] j;
  reg [15:0] data_tx_esp;
  reg [15:0] data_tx_e_esp;

  task automatic spi_transfer_esp;
    input [14:0] address_esp;
    input [15:0] data_esp;
    input RnW_esp;
  begin
    data_tx_e_esp = {address_esp,RnW_esp};
    data_tx_esp = {data_tx_e_esp[7:0],data_tx_e_esp[15:8]};
    esp_ss = 1;
    repeat(4*TBIT) begin
      @(negedge clk_esp);
    end
    esp_ss = 0; 
    repeat(2*TBIT) begin
      @(negedge clk_esp);
    end
  ///////////////////
  // Send address 
  ///////////////////
    for(j=0; j<16; j=j+1) begin
      esp_sck = 0;
      esp_mosi <= data_tx_esp[15-j];
      repeat(TBIT) begin
        @(negedge clk_esp);
      end
      esp_sck = 1;  
      repeat(TBIT) begin
        @(negedge clk_esp);
      end
    end
  ///////////////////
  // Send data
  ///////////////////
    data_tx_esp <= {data_esp[7:0],data_esp[15:8]};
    repeat(2*TBIT) begin
      @(negedge clk_esp);
    end
    for(j=0; j<16; j=j+1) begin
      esp_sck = 0;
      esp_mosi <= data_tx_esp[15-j];
      repeat(TBIT) begin
        @(negedge clk_esp);
      end
      esp_sck = 1;  
      repeat(TBIT) begin
        @(negedge clk_esp);
      end
    end
    repeat(4*TBIT) begin
      @(negedge clk_esp);
    end   
    esp_ss = 1;
    repeat(4*TBIT) begin
      @(negedge clk_esp);
    end
  end
  endtask

parameter depth = (1 << 8);
// actual ram cells
reg [15:0] ram [0:depth-1];
localparam MEM_FILE_NAME = "sine";

initial 
begin
  if (MEM_FILE_NAME != "none")
  begin
    $readmemh(MEM_FILE_NAME, ram);
  end
end

//------------------------------------------
//          SPI BURST TRANSFER TASK
//------------------------------------------
  reg [4:0] ib;
  reg [4:0] jb;
  reg [15:0] data_txb[18:0];
  reg [15:0] data_txb_e;
  
  task automatic spi_burst_transfer;
    input [15:0] address_b;
    input [4:0] count;
    input RnW_b;
  begin
    data_txb_e = {address_b,RnW_b};
    data_txb[0] = {data_txb_e[7:0],data_txb_e[15:8]};
    data_txb[1] = ram[0];
    data_txb[2] = ram[1];
    data_txb[3] = ram[2];
    data_txb[4] = ram[3];
    data_txb[5] = ram[4];
    data_txb[6] = ram[5];
    data_txb[7] = ram[6];
    data_txb[8] = ram[7];
    data_txb[9] = ram[8];
    data_txb[10] = ram[9];
    data_txb[11] = ram[10];
    data_txb[12] = ram[11];
    data_txb[13] = ram[12];
    data_txb[14] = ram[13];
    data_txb[15] = ram[14];
    data_txb[16] = ram[15];
    data_txb[17] = ram[16];
    data_txb[18] = ram[17];

    rpi_ss = 1;
    repeat(20*TBIT) begin
      @(negedge clk);
    end
    rpi_ss = 0; 
    repeat(2*TBIT) begin
      @(negedge clk);
    end
    for(jb = 0; jb < count; jb = jb + 1) begin 
      repeat(2*TBIT) begin
        @(negedge clk);
      end
      for(ib = 0; ib < 16; ib = ib + 1) begin
        rpi_sck = 0;
        rpi_mosi <= data_txb[jb][15-ib];
        repeat(TBIT) begin
          @(negedge clk);
        end
        rpi_sck = 1;  
        repeat(TBIT) begin
          @(negedge clk);
        end
      end
    end
    rpi_ss = 1;
    repeat(4*TBIT) begin
      @(negedge clk);
    end
  end
  endtask


//------------------------------------------
//          SPI NFC TRANSFER TASK
//------------------------------------------
/*  reg [ 5:0] n       ;
  reg [7:0] data_nfc;

  task automatic nfc_spi;
  input [7:0] data;
  begin
  data_nfc = data;
  for(n=0; n<8; n=n+1) begin
  nfc_miso <= data_nfc[7-n];
  repeat(TBIT) begin
  @(negedge nfc_sck);
  end
  end
  nfc_miso <= 0;
  end
  endtask
*/
//------------------------------------------
//          UART TRANSFER TASK
//------------------------------------------
  reg [3:0] u           ;
  reg [7:0] data_uart_rx;

  parameter UART_BIT = 432; //Bit time

  task automatic uart_rx;
    input [9:0] data;
    begin
      data_uart_rx = data;
      uart_rxd <= 0;

      repeat(UART_BIT) begin
        @(negedge clk);
      end

      for(u=0; u<8; u=u+1)
        begin
          uart_rxd <= data_uart_rx[u];
          repeat(UART_BIT) begin
            @(negedge clk);
          end
        end
      uart_rxd <= 1;
    end
  endtask

//------------------------------------------
//             TEST SINGLE SPI TRANSFER
//------------------------------------------
  initial begin: TEST_CASE
    #250 -> reset_trigger;
    uart_rxd <= 1;
    #0 pdm_data <= 8'hAA;
    @ (reset_done_trigger);
    spi_transfer_pi(15'h7001, 16'h01, write);
    spi_transfer_pi(15'h7000, 16'h01, write);
     spi_transfer_pi(15'h7001, 16'h02, write);
    spi_transfer_pi(15'h7001, 16'h0A, read);
    spi_burst_transfer(15'h6000, 5'h12, write);
    uart_rx(9'hAA);
    #50000
    uart_rx(9'hAB);
    #50000
    uart_rx(9'hAC);
    #30000
    spi_transfer_pi(15'h1000, 0, read);
    spi_transfer_pi(15'h1101, 0, read);

  end

  initial begin: TEST_DUMP

    $dumpfile("system_TB.vcd");
    $dumpvars(-1);
    #((PERIOD*DUTY_CYCLE)*75000) $finish;
  end

endmodule

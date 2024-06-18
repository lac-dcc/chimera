// This program was cloned from: https://github.com/devin-macy/tt06-riscv32i-spi-wrapper
// License: Apache License 2.0

module spi_wrapper
(
  // Control/Data Signals
  input wire clk,                       // system clock
  input wire rst_n,                     // active-low reset
  
  // CSR
  output reg [7:0] rx_buff,             // MOSI buffer - populates when SPI recieves a full byte
  output reg rx_valid,                  // pulsed if successfully recieved a full byte
  input wire [7:0] tx_buff,             // MISO buffer - pulled into r_tx_buff when tx_valid is set high by the CPU (NOT IMPLEMENTED)
  input reg tx_valid,                   // pulsed if ready to transmit data (NOT IMPLEMENTED)
  output reg mode,                      // 0 if boot, 1 if echo
  output reg cmd_error,                 // asserts when an invalid cmd is given, must reset to clear
  
  // CPU program signals
  output wire cpu_rst_n,                // hold CPU in reset when programming in boot mode
  output reg imem_wr_en,                // write enable for instruction memory
  output reg [31:0] prog_instr,         // instruction used to write to memory
  output reg [3:0] prog_addr,           // address used to write to memory
  
  // SPI Interface
  input wire sclk,                      // SPI clock
  input wire cs,                        // chip select (active-low)
  input wire mosi,                      // SPI recieve data
  output wire miso                      // SPI transmit data
);
  
  reg [2:0] rx_bit_count;           
  reg [7:0] r_rx_buff;              
  reg [7:0] r_rx_buff_temp;         
  reg rx1_done, rx2_done, rx3_done;    // clock domain crossing signals
   
  reg [7:0] rx_cmd;            		   // command recieved in the last byte
  reg rx_grab_cmd_n;           		   // flip-flop between decoding command
                                       // or operating on current data byte
 
  reg [2:0] tx_bit_count;
  reg [7:0] r_tx_buff;
  reg response_valid;                  // echo mode internal tx start signal
  reg miso_bit;                         
  assign miso = miso_bit;
  
  reg [7:0] hh_byte;                   // instruction [31:24]
  reg [7:0] hl_byte;                   // instruction [23:16]
  reg [7:0] lh_byte;                   // instruction [15:8]
  reg [7:0] ll_byte;                   // instruction [7:0]
  reg [3:0] imem_address;              
  
   
  // rx spi and global cock domain crossing
  // assert rx_valid for 1 cycle when a full byte is recieved
  always @(posedge clk) begin
     if (~rst_n) begin // sync reset
        rx2_done <= 1'b0;
        rx3_done <= 1'b0;
        
        rx_valid <= 1'b0;
        rx_buff <= 8'b00;
     end else begin
        // clock domain crossing between clk and sclk
     	  rx2_done <= rx1_done;
        rx3_done <= rx2_done;
        
        if(rx3_done == 1'b0 && rx2_done == 1'b1) begin // rising edge
           // done recieving, set rx data valid and load output buffer
           rx_valid <= 1'b1;
           rx_buff <= r_rx_buff;
        end else begin
           // clear rx data valid, rx_buff persists
           rx_valid <= 1'b0;
        end
     end
  end
  
  // receive mosi bits from spi clk
  always @(posedge sclk) begin
	  if (cs) begin // hold in reset when not selected
        rx_bit_count <= 3'b0;
        rx1_done <= 1'b0;
     end else begin
        rx_bit_count <= rx_bit_count + 1;              // increment bit count
        r_rx_buff_temp <= {r_rx_buff_temp[6:0], mosi}; // shift in bits MSB first to temp buffer
        
        if (rx_bit_count == 3'b111) begin
           rx1_done <= 1'b1;                           // signal recieved full byte 
           r_rx_buff <= {r_rx_buff_temp[6:0], mosi};   // shift in last bit to temp buffer
        end else if(rx_bit_count == 3'b010) begin      // de-assert when starting to recieve next byte
           rx1_done <= 1'b0;
        end
     end
  end
   
  // register tx byte when tx_valid pulse comes, initiating transfer
  // NOT IMPLEMENTED - driving signals tied to ground and caused multiple driver errors on r_tx_buff
  /*
  always @(posedge clk) begin
     if(~rst_n) begin
        r_tx_buff <= 8'h00;
     end else begin
        if(tx_valid) begin
           r_tx_buff <= tx_buff;
        end
     end
  end
  */
  
  // clock out tx byte when there is a tx byte (echo)
  always @(posedge sclk) begin
     if (cs) begin
        tx_bit_count <= 3'b111;   // send MSB first
        miso_bit <= r_tx_buff[7]; // reset to MSB
     end else begin
        // with 2 modes - only able to tx if in echo mode
        // future work would implement cpu control over tx_buff and tx_valid
        if (mode == 1'b1 && response_valid) begin
           tx_bit_count <= tx_bit_count - 1;
           miso_bit <= r_tx_buff[tx_bit_count];
        end else begin
           tx_bit_count <= 3'b111;   
        end
     end
  end
  
  // internal spi commands
  always @(posedge clk) begin
     if (~rst_n) begin // sync reset
        
        cpu_rst_n <= 1'b0;
        mode <= 1'b0;
        cmd_error <= 1'b0;
        
        hh_byte <= 8'h00;
        hl_byte <= 8'h00;
        lh_byte <= 8'h00;
        ll_byte <= 8'h00;
        prog_instr <= 32'h00_00_00_00;
        
        imem_wr_en <= 1'b0;
        imem_address <= 4'h0;
        prog_addr <= 4'h0;
        
        rx_grab_cmd_n <= 1'b0;
        rx_cmd <= 8'h00;
        
        response_valid <= 1'b0;
        r_tx_buff <= 8'h00;
     end else if (rx3_done == 1'b0 && rx2_done == 1'b1) begin // if recieved a full byte - rising-edge
        if (~mode) begin // boot mode
           cpu_rst_n <= 1'b0;                                 // assert cpu reset when in boot mode
           if (~rx_grab_cmd_n) begin // command
              rx_cmd <= r_rx_buff;
              rx_grab_cmd_n <= 1'b1;                          // next byte is data
           end else if(rx_grab_cmd_n) begin // data
              case (rx_cmd)                                   // decode last command and operate on current byte
                8'hc0 : begin
                         ll_byte <= r_rx_buff;
                        end
                8'hc1 : begin 
                         lh_byte <= r_rx_buff; 
                        end
                8'hc2 : begin 
                         hl_byte <= r_rx_buff; 
                        end
                8'hc3 : begin 
                         hh_byte <= r_rx_buff; 
                        end
                8'hc4 : begin 
                         imem_address <= r_rx_buff[3:0];
                        end
                8'hc5 : begin
                         prog_addr <= imem_address;
                         prog_instr <= {hh_byte, hl_byte, lh_byte, ll_byte};
                         imem_wr_en <= 1'b1;
                        end
                8'hc6 : begin 
                         mode <= 1'b1;                        // enter echo mode
                        end
                8'hc7 : begin
                         mode <= 1'b0;                        // do nothing
                         end
                default: begin 
                         cmd_error <= 1'b1;                   // invalid cmd, must reset to clear
                         end
               endcase
               rx_grab_cmd_n <= 1'b0;                         // next byte is a cmd
           end // end rx_grab_cmd_n
        end else begin // echo mode
           cpu_rst_n <= 1'b1;                                 // de-assert cpu reset when not in boot
           r_tx_buff <= r_rx_buff;                            // load TRANSMIT buffer with RECIEVED buffer 
           response_valid <= 1'b1;
           if(r_rx_buff == 8'hc7) begin                       // re-enter boot if in echo mode and cmd is recieved
              mode <= 1'b0;
           end
        end // end mode
     end else if(tx_bit_count == 3'b0) begin                  // de-assert response_valid after tx complete
        response_valid <= 1'b0;                               // (can probably move up into echo mode case)
     end else begin
        imem_wr_en <= 1'b0;                                   // de-assert write enable on cmd (only happens when doing nothing in boot mode)
     end // end byte recieved
  end // end spi internal command
endmodule

// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License


// CPU and memory bundled together,
//  exposing the UART bare wires
module tiny1_cpu(
                 input            clk,
                 input            rst, // external reset button

                 input [7:0]      uart_din,
                 input            uart_valid,
                 input            uart_ready,
                 output [7:0]     uart_out,
                 output           uart_rd,
                 output           uart_wr,

                 output reg [7:0] leds
                 );
   

   wire [15:0]         for_mem_addr;
   wire [15:0]         for_mem_data_i_ram;
   wire [15:0]         for_mem_data_o;
   wire                for_mem_wr;
   wire                for_mem_re;

   // 16kb ram, one for all of the following:
   //      16x16 virtual registers
   //      16x16 IRQ mode virtual registers
   //      32x16 microcode handlers table
   //      large microcode buffer
   //      and everything else
   ram16k ram(.clk(clk),
              .addr(for_mem_addr[14:1]),
              .data_out(for_mem_data_i_ram),
              .data_in(for_mem_data_o),
              .we(for_mem_wr),
              .re(for_mem_re));

   // May be a memory-mapped I/O instead of a genuine memory access
   wire                mem_wr_from_core;
   wire                mem_re_from_core;

   // Thin UART interface via mmap
   wire                irqack;

   wire [15:0]         mem_data_i_for_core;
   wire [15:0]         mem_data_o_from_core;
   wire [15:0]         mem_addr_from_core;

   assign for_mem_addr = mem_addr_from_core;
   assign for_mem_data_o = mem_data_o_from_core;

   reg                 irq;
   
   
   tiny1_core cpu(.clk(clk),
                  .rst(rst),

                  .irq(/*irq*/ 1'b0),
                  .irqack(irqack),

                  .mem_addr(mem_addr_from_core),
                  .mem_data_o(mem_data_o_from_core),
                  .mem_data_i(mem_data_i_for_core),
                  .ram_data_i(for_mem_data_i_ram),
                  
                  .mem_wr(mem_wr_from_core),
                  .mem_rd(mem_re_from_core));

   reg [15:0]         mem_data_i_mmap;
   wire [15:0]        data_i_mmap_cl;
   
   wire                mmap;
   assign mmap = mem_addr_from_core[15]; // if bit 15 set, it's mmap io
   assign for_mem_wr = !mmap?mem_wr_from_core:0;
   assign for_mem_re = !mmap?mem_re_from_core:0;

   assign mem_data_i_for_core = mmap?mem_data_i_mmap:for_mem_data_i_ram;
   
   
   // IRQ logic:
   //   if uart_valid && !irqack, set IRQ

   // mmap io:
   // Read ports:
   //  IO_UART_VALID  - valid input from UART
   //  IO_UART_DIN    - 8 bits from UART
   //  IO_UART_READY  - 1 if ready to send

   // Write ports:
   //  IO_UART_DOUT   - 8 bits to UART

   parameter IO_UART_VALID = 0;
   parameter IO_UART_DIN = 2;
   parameter IO_UART_READY = 4;
   parameter IO_UART_DOUT = 6;

   parameter IO_LEDS = 8;
   
   wire [10:0]          mmapaddr;

   assign mmapaddr = mem_addr_from_core[10:0];
   
   assign data_i_mmap_cl = (mmapaddr == IO_UART_VALID)?{15'b0, uart_valid}:
                           (mmapaddr == IO_UART_DIN)?{8'b0,uart_din}:
                           (mmapaddr == IO_UART_READY)?{15'b0, uart_ready}:16'b0;

   assign uart_wr = (mmap && mmapaddr == IO_UART_DOUT && mem_wr_from_core);
   assign uart_rd = (mmap && mmapaddr == IO_UART_DIN && mem_re_from_core);
   
   assign uart_out = mem_data_o_from_core[7:0];

   // register the mmap output
   always @(posedge clk)
     begin
        mem_data_i_mmap <= data_i_mmap_cl;
        if (mmap && mmapaddr == IO_LEDS && mem_wr_from_core) begin
          leds[7:0] <= mem_data_o_from_core[7:0];
        end
     end

   always @(posedge clk)
     if (!rst) begin
        irq <= 0;
     end else begin
        if (!irq && uart_valid) begin
           irq <= 1;
        end else if (irq && irqack) begin
           irq <= 0;
        end
     end
endmodule


module tiny1_soc(
                 input  clk,
                 input  rst, // external reset button

                 input  RXD,
                 output TXD,

                 output LED1,
                 output LED2,
                 output LED3,
                 output LED4,
                 output LED5
`ifndef ICESTICK
                 ,output LED6,
                 output LED7,
                 output LED8
`endif
                 );

   
	reg [7:0] resetn_counter = 0;
        wire           resetn = &resetn_counter;
  
	always @(posedge clk) begin
		if (!resetn)
			resetn_counter <= resetn_counter + 1;
	end


   
   wire [7:0]           leds;
   wire [7:0]           rleds;

   outpin led0 (.clk(clk), .we(1'b1), .pin(LED1), .wd(leds[0]), .rd(rleds[0]));
   outpin led1 (.clk(clk), .we(1'b1), .pin(LED2), .wd(leds[1]), .rd(rleds[1]));
   outpin led2 (.clk(clk), .we(1'b1), .pin(LED3), .wd(leds[2]), .rd(rleds[2]));
   outpin led3 (.clk(clk), .we(1'b1), .pin(LED4), .wd(leds[3]), .rd(rleds[3]));
   outpin led4 (.clk(clk), .we(1'b1), .pin(LED5), .wd(leds[4]), .rd(rleds[4]));
`ifndef ICESTICK
   outpin led5 (.clk(clk), .we(1'b1), .pin(LED6), .wd(leds[5]), .rd(rleds[5]));
   outpin led6 (.clk(clk), .we(1'b1), .pin(LED7), .wd(leds[6]), .rd(rleds[6]));
   outpin led7 (.clk(clk), .we(1'b1), .pin(LED8), .wd(leds[7]), .rd(rleds[7]));
`endif
   
   wire [7:0]           uart_din;
   wire                 uart_valid;
   wire                 uart_ready;
   wire                 uart_wr;
   wire                 uart_rd;
   
   wire [7:0]           uart_dout;

   tiny1_cpu cpu(.clk(clk),
                 .rst(resetn),
                 .uart_din(uart_din),
                 .uart_valid(uart_valid),
                 .uart_ready(uart_ready),
                 .uart_out(uart_dout),
                 .uart_rd(uart_rd),
                 .uart_wr(uart_wr),
                 .leds(leds)
                 );
   
   wire                 uart_RXD;
   inpin _rcxd(.clk(clk), .pin(RXD), .rd(uart_RXD));

   wire                 uart_busy;

   assign uart_ready = ~uart_busy;
   
   buart _uart (
                .clk(clk),
                .resetq(1'b1),
                .rx(uart_RXD),
                .tx(TXD),
                .rd(uart_rd),
                .wr(uart_wr),
                .valid(uart_valid),
                .busy(uart_busy),
                .tx_data(uart_dout),
                .rx_data(uart_din));
   
endmodule

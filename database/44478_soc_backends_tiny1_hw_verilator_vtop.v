// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License

// Model only!
module ram16k(input clk,
	      input [13:0] 	addr,
	      input [15:0] 	data_in,
	      output reg [15:0] data_out,
	      input 		we,
	      input 		re);

   reg [15:0] 			RAM [0:8192-1];

   always @(posedge clk)
     if (re) begin
	data_out <= RAM[addr];
     end else if (we) begin
	RAM[addr] <= data_in;
     end

   
endmodule // ram16k


// Toplevel module for Verilator - with uart bare wires exposed
module tiny1_soc(
                 input        clk,
                 input        rst, // external rest button

		 input [7:0]  uart_din,
		 input        uart_valid,
		 output [7:0] uart_out,
		 output       uart_out_ready,

                 output       just_die_already
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
   wire                uart_ready;
   wire                irqack;

   wire [15:0]         mem_data_i_for_core;
   wire [15:0]         mem_data_o_from_core;
   wire [15:0]         mem_addr_from_core;

   assign for_mem_addr = mem_addr_from_core;
   assign for_mem_data_o = mem_data_o_from_core;
   
   
   tiny1_core cpu(.clk(clk),
                  .rst(rst),

                  .irq(0),
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

   parameter IO_HALT = 512;
   
   
   wire [10:0]          mmapaddr;

   assign mmapaddr = mem_addr_from_core[10:0];
   assign uart_ready = 1'b1;
   
   
   
   
   assign data_i_mmap_cl = (mmapaddr == IO_UART_VALID)?{15'b0, uart_valid}:
                           (mmapaddr == IO_UART_DIN)?{8'b0,uart_din}:
                           (mmapaddr == IO_UART_READY)?{15'b0, uart_ready}:16'b0;

   assign uart_out_ready = (mmap && mmapaddr == IO_UART_DOUT && mem_wr_from_core);

   assign just_die_already = (mmap && mmapaddr == IO_HALT && mem_wr_from_core);
   
   assign uart_out = mem_data_o_from_core[7:0];

   // register the mmap output
   always @(posedge clk)
     begin
        mem_data_i_mmap <= data_i_mmap_cl;
     end
   
   
endmodule

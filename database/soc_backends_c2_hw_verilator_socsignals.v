// This program was cloned from: https://github.com/combinatorylogic/soc
// License: MIT License


              input [7:0]   uart_din,
	      input         uart_valid,
	      output [7:0]  uart_out,
	      output        uart_wr,

              output vga_dump,

              input [19:0] vmem_out_addr,
              output [7:0] vmem_out_data,

              output [7:0] LED,
                            



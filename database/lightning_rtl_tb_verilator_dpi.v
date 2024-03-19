// Language: Verilog 2001

`resetall
`timescale 1ns / 1ps
`default_nettype none

////////////////////////////////////////////////////////////////////
// C++ functions
////////////////////////////////////////////////////////////////////

import "DPI-C" function void dpi_reg_write(input string name, int reg_width);
import "DPI-C" function void dpi_reg_read(input string name, int reg_width);
import "DPI-C" function void dpi_ram_write(input string name, int reg_width);
import "DPI-C" function void dpi_ram_read(input string name, int reg_width);
import "DPI-C" function void dpi_reg_output(input string name, int cycle_count, int index_count, int value);


function void reg_write(string name, int bitwidth);
`ifdef VERILATOR
   dpi_reg_write(name, bitwidth);
`endif
endfunction   

function void reg_read(string name, int bitwidth);
`ifdef VERILATOR
   dpi_reg_read(name, bitwidth);
`endif
endfunction   

function void ram_write(string name, int bitwidth);
`ifdef VERILATOR
   dpi_ram_write(name, bitwidth);
`endif
endfunction   

function void ram_read(string name, int bitwidth);
`ifdef VERILATOR
   dpi_ram_read(name, bitwidth);
`endif
endfunction   

function void reg_output(string name, int cycle_count, int index_count, int value);
`ifdef VERILATOR
   dpi_reg_output(name, cycle_count, index_count, value);
`endif
endfunction  

`resetall
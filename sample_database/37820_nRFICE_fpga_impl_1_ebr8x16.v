// This program was cloned from: https://github.com/HurleyResearch/nRFICE
// License: GNU General Public License v3.0

// Verilog netlist produced by program LSE 
// Netlist written on Fri Mar  3 10:20:57 2023
// Source file index table: 
// Object locations will have the form @<file_index>(<first_ line>[<left_column>],<last_line>[<right_column>])
// file 0 "e:/lscc/radiant/2022.1/ip/avant/fifo/rtl/lscc_fifo.v"
// file 1 "e:/lscc/radiant/2022.1/ip/avant/fifo_dc/rtl/lscc_fifo_dc.v"
// file 2 "e:/lscc/radiant/2022.1/ip/avant/ram_dp/rtl/lscc_ram_dp.v"
// file 3 "e:/lscc/radiant/2022.1/ip/avant/ram_dq/rtl/lscc_ram_dq.v"
// file 4 "e:/lscc/radiant/2022.1/ip/avant/rom/rtl/lscc_rom.v"
// file 5 "e:/lscc/radiant/2022.1/ip/common/adder/rtl/lscc_adder.v"
// file 6 "e:/lscc/radiant/2022.1/ip/common/adder_subtractor/rtl/lscc_add_sub.v"
// file 7 "e:/lscc/radiant/2022.1/ip/common/complex_mult/rtl/lscc_complex_mult.v"
// file 8 "e:/lscc/radiant/2022.1/ip/common/counter/rtl/lscc_cntr.v"
// file 9 "e:/lscc/radiant/2022.1/ip/common/mult_accumulate/rtl/lscc_mult_accumulate.v"
// file 10 "e:/lscc/radiant/2022.1/ip/common/mult_add_sub/rtl/lscc_mult_add_sub.v"
// file 11 "e:/lscc/radiant/2022.1/ip/common/mult_add_sub_sum/rtl/lscc_mult_add_sub_sum.v"
// file 12 "e:/lscc/radiant/2022.1/ip/common/multiplier/rtl/lscc_multiplier.v"
// file 13 "e:/lscc/radiant/2022.1/ip/common/subtractor/rtl/lscc_subtractor.v"
// file 14 "e:/lscc/radiant/2022.1/ip/pmi/pmi_add.v"
// file 15 "e:/lscc/radiant/2022.1/ip/pmi/pmi_addsub.v"
// file 16 "e:/lscc/radiant/2022.1/ip/pmi/pmi_complex_mult.v"
// file 17 "e:/lscc/radiant/2022.1/ip/pmi/pmi_counter.v"
// file 18 "e:/lscc/radiant/2022.1/ip/pmi/pmi_dsp.v"
// file 19 "e:/lscc/radiant/2022.1/ip/pmi/pmi_fifo.v"
// file 20 "e:/lscc/radiant/2022.1/ip/pmi/pmi_fifo_dc.v"
// file 21 "e:/lscc/radiant/2022.1/ip/pmi/pmi_mac.v"
// file 22 "e:/lscc/radiant/2022.1/ip/pmi/pmi_mult.v"
// file 23 "e:/lscc/radiant/2022.1/ip/pmi/pmi_multaddsub.v"
// file 24 "e:/lscc/radiant/2022.1/ip/pmi/pmi_multaddsubsum.v"
// file 25 "e:/lscc/radiant/2022.1/ip/pmi/pmi_ram_dp.v"
// file 26 "e:/lscc/radiant/2022.1/ip/pmi/pmi_ram_dp_be.v"
// file 27 "e:/lscc/radiant/2022.1/ip/pmi/pmi_ram_dq.v"
// file 28 "e:/lscc/radiant/2022.1/ip/pmi/pmi_ram_dq_be.v"
// file 29 "e:/lscc/radiant/2022.1/ip/pmi/pmi_rom.v"
// file 30 "e:/lscc/radiant/2022.1/ip/pmi/pmi_sub.v"
// file 31 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/ccu2_b.v"
// file 32 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/fd1p3bz.v"
// file 33 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/fd1p3dz.v"
// file 34 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/fd1p3iz.v"
// file 35 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/fd1p3jz.v"
// file 36 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/hsosc.v"
// file 37 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/hsosc1p8v.v"
// file 38 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/ib.v"
// file 39 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/ifd1p3az.v"
// file 40 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/lsosc.v"
// file 41 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/lsosc1p8v.v"
// file 42 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/ob.v"
// file 43 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/obz_b.v"
// file 44 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/ofd1p3az.v"
// file 45 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/pdp4k.v"
// file 46 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/rgb.v"
// file 47 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/rgb1p8v.v"
// file 48 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/sp256k.v"
// file 49 "e:/lscc/radiant/2022.1/cae_library/simulation/verilog/ice40up/legacy.v"

//
// Verilog Description of module ebr8x16
// module wrapper written out since it is a black-box. 
//

//

module ebr8x16 (clk_i, rst_i, clk_en_i, wr_en_i, wr_data_i, addr_i, 
            rd_data_o);
    input clk_i;
    input rst_i;
    input clk_en_i;
    input wr_en_i;
    input [15:0]wr_data_i;
    input [7:0]addr_i;
    output [15:0]rd_data_o;
    
    
    
endmodule

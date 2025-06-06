// This program was cloned from: https://github.com/TILOS-AI-Institute/MacroPlacement
// License: BSD 3-Clause "New" or "Revised" License

// nv_ram_rwsp_4x128: synthesizable model wrapper
// Generated by /home/nvtools/branch/release/t194_rg/2017/06/01_10_25_11/nvtools/rams/scripts/ramgen - DO NOT EDIT
// Estimated area: 1063.55 um^2 (nvstd_tsmc16fflr)
// Option explanations:
// p:
// Causes read ports to have their outputs flopped.
// The 'ore' input is used as a load enable on the output flop
// stage. This flop stage tends to be nearly free, since some
// flops are generally required for testability purposes.
// s:
// Indicates that the ram is synchronous (i.e. all
// ports use the same clock). The one or more clk(_[rw])[0-9]*
// ports will be replaced with a single 'clk' port.
// leda ELB072 off
`timescale 1ns / 10ps
module nv_ram_rwsp_4x128 (
        clk,
        ra,
        re,
        ore,
        dout,
        wa,
        we,
        di,
        pwrbus_ram_pd
        );
parameter FORCE_CONTENTION_ASSERTION_RESET_ACTIVE=1'b0;
// port list
input clk;
input [1:0] ra;
input re;
input ore;
output [127:0] dout;
input [1:0] wa;
input we;
input [127:0] di;
input [31:0] pwrbus_ram_pd;
// This wrapper consists of : 1 Latch Arrays
//Wires for Misc Ports
wire DFT_clamp;
//Wires for RamAccess Ports
wire SI;
// verilint 528 off - Variable set but not used
wire SO_int_net;
// verilint 528 on - Variable set but not used
wire shiftDR;
wire updateDR;
wire debug_mode;
//Wires for Misc Ports
wire mbist_ramaccess_rst_;
wire scan_ramcen;
wire scan_en;
// Use Bbox and clamps to clamp and tie off the DFT signals in the wrapper
NV_BLKBOX_SRC0 UI_enableDFTmode_async_ld_buf (.Y(DFT_clamp));
wire pre_SI;
NV_BLKBOX_SRC0_X testInst_SI (.Y(pre_SI));
AN2D4PO4 UJ_DFTQUALIFIER_SI (.Z(SI), .A1(pre_SI), .A2(DFT_clamp) );
NV_BLKBOX_SINK testInst_SO (.A(SO_int_net));
wire pre_shiftDR;
NV_BLKBOX_SRC0_X testInst_shiftDR (.Y(pre_shiftDR));
AN2D4PO4 UJ_DFTQUALIFIER_shiftDR (.Z(shiftDR), .A1(pre_shiftDR), .A2(DFT_clamp) );
wire pre_updateDR;
NV_BLKBOX_SRC0_X testInst_updateDR (.Y(pre_updateDR));
AN2D4PO4 UJ_DFTQUALIFIER_updateDR (.Z(updateDR), .A1(pre_updateDR), .A2(DFT_clamp) );
wire pre_debug_mode;
NV_BLKBOX_SRC0_X testInst_debug_mode (.Y(pre_debug_mode));
AN2D4PO4 UJ_DFTQUALIFIER_debug_mode (.Z(debug_mode), .A1(pre_debug_mode), .A2(DFT_clamp) );
wire pre_mbist_ramaccess_rst_;
NV_BLKBOX_SRC0_X testInst_mbist_ramaccess_rst_ (.Y(pre_mbist_ramaccess_rst_));
AN2D4PO4 UJ_DFTQUALIFIER_mbist_ramaccess_rst_ (.Z(mbist_ramaccess_rst_), .A1(pre_mbist_ramaccess_rst_), .A2(DFT_clamp) );
wire pre_scan_ramcen;
NV_BLKBOX_SRC0_X testInst_scan_ramcen (.Y(pre_scan_ramcen));
AN2D4PO4 UJ_DFTQUALIFIER_scan_ramcen (.Z(scan_ramcen), .A1(pre_scan_ramcen), .A2(DFT_clamp) );
wire pre_scan_en;
NV_BLKBOX_SRC0_X testInst_scan_en (.Y(pre_scan_en));
AN2D4PO4 UJ_DFTQUALIFIER_scan_en (.Z(scan_en), .A1(pre_scan_en), .A2(DFT_clamp) );
// Declare the wires for test signals
// Instantiating the internal logic module now
// verilint 402 off - inferred Reset must be a module port
nv_ram_rwsp_4x128_logic #(FORCE_CONTENTION_ASSERTION_RESET_ACTIVE) r_nv_ram_rwsp_4x128 (
                           .SI(SI), .SO_int_net(SO_int_net), .clk(clk),
                           .debug_mode(debug_mode), .di(di), .dout(dout),
                           .mbist_ramaccess_rst_(mbist_ramaccess_rst_),
                           .ore(ore), .pwrbus_ram_pd(pwrbus_ram_pd), .ra(ra),
                           .re(re), .scan_en(scan_en), .scan_ramcen(scan_ramcen),
                           .shiftDR(shiftDR), .updateDR(updateDR), .wa(wa),
                           .we(we) );
// verilint 402 on - inferred Reset must be a module port
// synopsys dc_tcl_script_begin
// set_dont_touch [get_cells "testInst_SI"]
// set_dont_touch [get_cells "testInst_SO"]
// set_dont_touch [get_cells "testInst_debug_mode"]
// set_dont_touch [get_cells "testInst_mbist_ramaccess_rst_"]
// set_dont_touch [get_cells "testInst_scan_en"]
// set_dont_touch [get_cells "testInst_scan_ramcen"]
// set_dont_touch [get_cells "testInst_shiftDR"]
// set_dont_touch [get_cells "testInst_updateDR"]
// synopsys dc_tcl_script_end
// synopsys dc_tcl_script_begin
// set_dont_touch [get_nets "SI"]
// set_dont_touch [get_nets "SO_int_net"]
// set_dont_touch [get_nets "debug_mode"]
// set_dont_touch [get_nets "mbist_ramaccess_rst_"]
// set_dont_touch [get_nets "scan_en"]
// set_dont_touch [get_nets "scan_ramcen"]
// set_dont_touch [get_nets "shiftDR"]
// set_dont_touch [get_nets "updateDR"]
// synopsys dc_tcl_script_end
`ifndef SYNTHESIS
task arrangement (output integer arrangment_string[127:0]);
  begin
    arrangment_string[0] = 0 ;
    arrangment_string[1] = 1 ;
    arrangment_string[2] = 2 ;
    arrangment_string[3] = 3 ;
    arrangment_string[4] = 4 ;
    arrangment_string[5] = 5 ;
    arrangment_string[6] = 6 ;
    arrangment_string[7] = 7 ;
    arrangment_string[8] = 8 ;
    arrangment_string[9] = 9 ;
    arrangment_string[10] = 10 ;
    arrangment_string[11] = 11 ;
    arrangment_string[12] = 12 ;
    arrangment_string[13] = 13 ;
    arrangment_string[14] = 14 ;
    arrangment_string[15] = 15 ;
    arrangment_string[16] = 16 ;
    arrangment_string[17] = 17 ;
    arrangment_string[18] = 18 ;
    arrangment_string[19] = 19 ;
    arrangment_string[20] = 20 ;
    arrangment_string[21] = 21 ;
    arrangment_string[22] = 22 ;
    arrangment_string[23] = 23 ;
    arrangment_string[24] = 24 ;
    arrangment_string[25] = 25 ;
    arrangment_string[26] = 26 ;
    arrangment_string[27] = 27 ;
    arrangment_string[28] = 28 ;
    arrangment_string[29] = 29 ;
    arrangment_string[30] = 30 ;
    arrangment_string[31] = 31 ;
    arrangment_string[32] = 32 ;
    arrangment_string[33] = 33 ;
    arrangment_string[34] = 34 ;
    arrangment_string[35] = 35 ;
    arrangment_string[36] = 36 ;
    arrangment_string[37] = 37 ;
    arrangment_string[38] = 38 ;
    arrangment_string[39] = 39 ;
    arrangment_string[40] = 40 ;
    arrangment_string[41] = 41 ;
    arrangment_string[42] = 42 ;
    arrangment_string[43] = 43 ;
    arrangment_string[44] = 44 ;
    arrangment_string[45] = 45 ;
    arrangment_string[46] = 46 ;
    arrangment_string[47] = 47 ;
    arrangment_string[48] = 48 ;
    arrangment_string[49] = 49 ;
    arrangment_string[50] = 50 ;
    arrangment_string[51] = 51 ;
    arrangment_string[52] = 52 ;
    arrangment_string[53] = 53 ;
    arrangment_string[54] = 54 ;
    arrangment_string[55] = 55 ;
    arrangment_string[56] = 56 ;
    arrangment_string[57] = 57 ;
    arrangment_string[58] = 58 ;
    arrangment_string[59] = 59 ;
    arrangment_string[60] = 60 ;
    arrangment_string[61] = 61 ;
    arrangment_string[62] = 62 ;
    arrangment_string[63] = 63 ;
    arrangment_string[64] = 64 ;
    arrangment_string[65] = 65 ;
    arrangment_string[66] = 66 ;
    arrangment_string[67] = 67 ;
    arrangment_string[68] = 68 ;
    arrangment_string[69] = 69 ;
    arrangment_string[70] = 70 ;
    arrangment_string[71] = 71 ;
    arrangment_string[72] = 72 ;
    arrangment_string[73] = 73 ;
    arrangment_string[74] = 74 ;
    arrangment_string[75] = 75 ;
    arrangment_string[76] = 76 ;
    arrangment_string[77] = 77 ;
    arrangment_string[78] = 78 ;
    arrangment_string[79] = 79 ;
    arrangment_string[80] = 80 ;
    arrangment_string[81] = 81 ;
    arrangment_string[82] = 82 ;
    arrangment_string[83] = 83 ;
    arrangment_string[84] = 84 ;
    arrangment_string[85] = 85 ;
    arrangment_string[86] = 86 ;
    arrangment_string[87] = 87 ;
    arrangment_string[88] = 88 ;
    arrangment_string[89] = 89 ;
    arrangment_string[90] = 90 ;
    arrangment_string[91] = 91 ;
    arrangment_string[92] = 92 ;
    arrangment_string[93] = 93 ;
    arrangment_string[94] = 94 ;
    arrangment_string[95] = 95 ;
    arrangment_string[96] = 96 ;
    arrangment_string[97] = 97 ;
    arrangment_string[98] = 98 ;
    arrangment_string[99] = 99 ;
    arrangment_string[100] = 100 ;
    arrangment_string[101] = 101 ;
    arrangment_string[102] = 102 ;
    arrangment_string[103] = 103 ;
    arrangment_string[104] = 104 ;
    arrangment_string[105] = 105 ;
    arrangment_string[106] = 106 ;
    arrangment_string[107] = 107 ;
    arrangment_string[108] = 108 ;
    arrangment_string[109] = 109 ;
    arrangment_string[110] = 110 ;
    arrangment_string[111] = 111 ;
    arrangment_string[112] = 112 ;
    arrangment_string[113] = 113 ;
    arrangment_string[114] = 114 ;
    arrangment_string[115] = 115 ;
    arrangment_string[116] = 116 ;
    arrangment_string[117] = 117 ;
    arrangment_string[118] = 118 ;
    arrangment_string[119] = 119 ;
    arrangment_string[120] = 120 ;
    arrangment_string[121] = 121 ;
    arrangment_string[122] = 122 ;
    arrangment_string[123] = 123 ;
    arrangment_string[124] = 124 ;
    arrangment_string[125] = 125 ;
    arrangment_string[126] = 126 ;
    arrangment_string[127] = 127 ;
  end
endtask
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
`ifndef MEM_REG_NAME
 `define MEM_REG_NAME MX.mem
`endif
// Bit vector indicating which shadow addresses have been written
reg [3:0] shadow_written = 'b0;
// Shadow ram array used to store initialization values
reg [127:0] shadow_mem [3:0];
`ifdef NV_RAM_EXPAND_ARRAY
wire [127:0] shadow_mem_row0 = shadow_mem[0];
wire [127:0] shadow_mem_row1 = shadow_mem[1];
wire [127:0] shadow_mem_row2 = shadow_mem[2];
wire [127:0] shadow_mem_row3 = shadow_mem[3];
`endif
task init_mem_val;
  input [1:0] row;
  input [127:0] data;
  begin
    shadow_mem[row] = data;
    shadow_written[row] = 1'b1;
  end
endtask
task init_mem_commit;
integer row;
begin
// forcing data inputs and enables to Latch_Array
if (shadow_written[0]) force r_nv_ram_rwsp_4x128.Wdata_row0 = shadow_mem[0][127:0];
if (shadow_written[0]) force r_nv_ram_rwsp_4x128.latchNet_G_en0 = 1'b1;
if (shadow_written[1]) force r_nv_ram_rwsp_4x128.Wdata_row1 = shadow_mem[1][127:0];
if (shadow_written[1]) force r_nv_ram_rwsp_4x128.latchNet_G_en1 = 1'b1;
if (shadow_written[2]) force r_nv_ram_rwsp_4x128.Wdata_row2 = shadow_mem[2][127:0];
if (shadow_written[2]) force r_nv_ram_rwsp_4x128.latchNet_G_en2 = 1'b1;
if (shadow_written[3]) force r_nv_ram_rwsp_4x128.Wdata_row3 = shadow_mem[3][127:0];
if (shadow_written[3]) force r_nv_ram_rwsp_4x128.latchNet_G_en3 = 1'b1;
#1;
// releasing enables for Latch_Array
release r_nv_ram_rwsp_4x128.latchNet_G_en0;
release r_nv_ram_rwsp_4x128.latchNet_G_en1;
release r_nv_ram_rwsp_4x128.latchNet_G_en2;
release r_nv_ram_rwsp_4x128.latchNet_G_en3;
#1;
// releasing data inputs for Latch_Array
release r_nv_ram_rwsp_4x128.Wdata_row0;
release r_nv_ram_rwsp_4x128.Wdata_row1;
release r_nv_ram_rwsp_4x128.Wdata_row2;
release r_nv_ram_rwsp_4x128.Wdata_row3;
shadow_written = 'b0;
end
endtask
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
task do_write; //(wa, we, di);
   input [1:0] wa;
   input we;
   input [127:0] di;
   reg [127:0] d;
   begin
      d = probe_mem_val(wa);
      d = (we ? di : d);
      init_mem_val(wa,d);
   end
endtask
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
`ifndef MEM_REG_NAME
 `define MEM_REG_NAME MX.mem
`endif
function [127:0] probe_mem_val;
input [1:0] row;
reg [127:0] data;
begin
// probing Latch_Array
if (row == 0) data[127:0] = r_nv_ram_rwsp_4x128.LatchArray_row0;
if (row == 1) data[127:0] = r_nv_ram_rwsp_4x128.LatchArray_row1;
if (row == 2) data[127:0] = r_nv_ram_rwsp_4x128.LatchArray_row2;
if (row == 3) data[127:0] = r_nv_ram_rwsp_4x128.LatchArray_row3;
    probe_mem_val = data;
end
endfunction
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_CLEAR_MEM_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
reg disable_clear_mem = 0;
task clear_mem;
integer i;
begin
  if (!disable_clear_mem)
  begin
    for (i = 0; i < 4; i = i + 1)
      begin
        init_mem_val(i, 'bx);
      end
    init_mem_commit();
  end
end
endtask
`endif
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_ZERO_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
task init_mem_zero;
integer i;
begin
 for (i = 0; i < 4; i = i + 1)
   begin
     init_mem_val(i, 'b0);
   end
 init_mem_commit();
end
endtask
`endif
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_VAL_TASKS
`ifndef NO_INIT_MEM_FROM_FILE_TASK
task init_mem_from_file;
input string init_file;
integer i;
begin
 $readmemh(init_file,shadow_mem);
 for (i = 0; i < 4; i = i + 1)
   begin
     shadow_written[i] = 1'b1;
   end
 init_mem_commit();
end
endtask
`endif
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_INIT_MEM_RANDOM_TASK
`ifndef NO_INIT_MEM_VAL_TASKS
RANDFUNC rf0 ();
RANDFUNC rf1 ();
RANDFUNC rf2 ();
RANDFUNC rf3 ();
task init_mem_random;
reg [127:0] random_num;
integer i;
begin
 for (i = 0; i < 4; i = i + 1)
   begin
     random_num = {rf0.rollpli(0,32'hffffffff),rf1.rollpli(0,32'hffffffff),rf2.rollpli(0,32'hffffffff),rf3.rollpli(0,32'hffffffff)};
     init_mem_val(i, random_num);
   end
 init_mem_commit();
end
endtask
`endif
`endif
`endif
`ifndef SYNTHESIS
`ifndef NO_FLIP_TASKS
`ifndef NO_INIT_MEM_VAL_TASKS
RANDFUNC rflip ();
task random_flip;
integer random_num;
integer row;
integer bitnum;
begin
  random_num = rflip.rollpli(0, 512);
  row = random_num / 128;
  bitnum = random_num % 128;
  target_flip(row, bitnum);
end
endtask
task target_flip;
input [1:0] row;
input [127:0] bitnum;
reg [127:0] data;
begin
  if(!$test$plusargs("no_display_target_flips"))
    $display("%m: flipping row %d bit %d at time %t", row, bitnum, $time);
  data = probe_mem_val(row);
  data[bitnum] = ~data[bitnum];
  init_mem_val(row, data);
  init_mem_commit();
end
endtask
`endif
`endif
`endif
// The main module is done
endmodule
//********************************************************************************

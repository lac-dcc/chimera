// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>simul_sensor12bits
 * @file simul_sensor12bits.v
 * @date 2015-07-29  
 * @author Andrey Filippov     
 *
 * @brief Generate sensor data
 *
 * @copyright Copyright (c) 2002-2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * simul_sensor12bits.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_sensor12bits.v is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/> .
 *
 * Additional permission under GNU GPL version 3 section 7:
 * If you modify this Program, or any covered work, by linking or combining it
 * with independent modules provided by the FPGA vendor only (this permission
 * does not extend to any 3-rd party modules, "soft cores" or macros) under
 * different license terms solely for the purpose of generating binary "bitstream"
 * files and/or simulating the code, the copyright holders of this Program give
 * you the right to distribute the covered work without those independent modules
 * as long as the source code for them is available from the FPGA vendor free of
 * charge, and there is no dependence on any encrypted modules for simulating of
 * the combined code. This permission applies to you if the distributed code
 * contains all the components and scripts required to completely simulate it
 * with at least one of the Free Software programs.
 */

module   simul_sensor12bits # (
    parameter SENSOR_IMAGE_TYPE =        "NORM", // "RUN1",
    parameter lline   =   192,   //   1664;//   line duration in clocks
    parameter ncols   =    66,   //58; //56; // 129; //128;   //1288;
    parameter nrows   =    18,   // 16;   //   1032;
    parameter nrowb =       1,   // number of "blank rows" from vact to 1-st hact
    parameter nrowa   =     1,   // number of "blank rows" from last hact to end of vact
//    parameter nAV   =      24,   //240;   // clocks from ARO to VACT (actually from en_dclkd)
    parameter nbpf   =     20,   //16; // bpf length
    parameter ngp1   =      8,   // bpf to hact
    parameter nVLO   =      1,   // VACT=0 in video mode (clocks)
    //parameter tMD   =   14;    //
    //parameter tDDO   =   10;   //   some confusion here - let's assume that it is from DCLK to Data out
    parameter tMD   =       4,   //
    parameter tDDO   =      2,   //   some confusion here - let's assume that it is from DCLK to Data out
    parameter tDDO1 =       5,   //
    parameter trigdly =     8,   // delay between trigger input and start of output (VACT) in lines
    parameter ramp  =       1,   // 1 - ramp, 0 - random (now - sensor.dat)
    parameter new_bayer =   0,   // 0 - old (16x16), 1 - new (18x18)
    parameter EXTRA_PERIOD = 0   // add these clockc before VACT 
) (
    input         MCLK,   // Master clock
    input         MRST,   // Master Reset - active low
    input         ARO,   // Array read Out.
    input         ARST,   // Array Reset. Active low
    input         OE,   // output Elphel, Inc.ock
    input         SCL,   // I2C data // SuppressThisWarning VEditor - not used
    inout         SDA,   // I2C data// SuppressThisWarning VEditor - not used/assigned
    input         OFST,   // I2C address ofset by 2: for simulation 0 - still mode, 1 - video mode.
    output [11:0] D,      // [11:0] data output
    output        DCLK,   // Data output clock
    output        BPF,   // Black Pixel Flag
    output        HACT,   // Horizontal Active
    output        VACT, // Vertical Active
    output        VACT1);

    
    localparam   s_stop=      0;
    localparam   s_preVACT=   1;
    localparam   s_firstline= 2;
    localparam   s_BPF=       3;
    localparam   s_preHACT=   4;
    localparam   s_HACT=      5;
    localparam   s_afterHACT= 6;
    localparam   s_lastline=  7;
    localparam   s_frame_done=8;
    
    localparam   t_preVACT=  lline* trigdly + EXTRA_PERIOD;
    localparam   t_firstline=nrowb*lline+1;   // 1664
    localparam   t_BPF=      nbpf;         // 16
    localparam   t_preHACT=   ngp1;         // 8
    localparam   t_HACT=      ncols;         // 1288
    localparam   t_afterHACT=lline-nbpf-ngp1-ncols;   // 352
    localparam   t_lastline=   nrowa*lline+1;   // 1664

//reg   [15:0]   sensor_data[0:4095]; // up to 64 x 64 pixels // SuppressThisWarning VEditor - Will be assigned by $readmem
///reg   [15:0]   sensor_data[0:65535]; // up to 1024 x 64 pixels // SuppressThisWarning VEditor - Will be assigned by $readmem
reg   [15:0]   sensor_data[0: nrows * ncols -1]; // up to 1024 x 64 pixels // SuppressThisWarning VEditor - Will be assigned by $readmem

//    $readmemh("sensor.dat",sensor_data);



reg         c;      // internal data out clock
//reg      [9:0]   id;      // internal pixel data (sync do DCLK)
//wire   [9:0]   nxt_d;   // will be calculated later - next pixel data
reg            stopped;
wire   #1      stoppedd=stopped;
reg            ibpf, ihact, ivact, ivact1;
reg            arst1;   //
reg      [11:0]   col;   // current row
reg      [11:0]   row;   // current column;
reg      [3:0]   state;
reg      [15:0]   cntr;
wire   [11:0]   cold;
wire   [11:0]   rowd;
wire   [3:0]   stated;
wire   [15:0]   cntrd;
wire         NMRST=!MRST;


//wire   [5:0] row_index=row[5:0]-new_bayer;
//wire   [5:0] col_index=col[5:0]-new_bayer;

wire   [11:0] row_index=row-new_bayer;
wire   [11:0] col_index=col-new_bayer;


// random
integer       seed;
integer         r;
reg            c_rand;
reg      [11:0]   d_rand;



assign      #1   cold=   col;
assign      #1   rowd=   row;
assign      #1   stated=   state;
assign      #1   cntrd=   cntr;



//assign   #tDDO   D   =  OE?   {12{1'bz}}:   ((ihact || ibpf)?   ((ramp)?({row[11:8],8'h0} + col[11:0]):(sensor_data[{row_index[5:0],col_index[5:0]}])): 12'b0); // just test pattern
assign   #tDDO   D   =  OE?   {12{1'bz}}:   ((ihact || ibpf)?   ((ramp)?({row[11:8],8'h0} + col[11:0]):(sensor_data[ncols * row_index + col_index])): 12'b0); // just test pattern



assign   #tDDO1   BPF   = ibpf;
assign   #tDDO1   HACT= ihact;
assign   #tDDO1   VACT= ivact;
assign   #tDDO1   VACT1= ivact && !ivact1;
assign         DCLK= c;
`ifndef ROOTPATH
    `include "IVERILOG_INCLUDE.v"// SuppressThisWarning VEditor - maybe not used
    `ifndef ROOTPATH
        `define ROOTPATH "."
    `endif
`endif

initial begin
//parameter ramp   =   1;   // 0 - ramp, 1 - random
//parameter lline   =   192; //   1664;//   line duration in clocks
//parameter ncols   =   58; //56; // 129; //128;   //1288;
//parameter nrows   =   16;   //   1032;

   $display ("sensor parameters");
   $display ("    -- image type = %s",SENSOR_IMAGE_TYPE);
   $display ("    -- ramp  = %d (0 - random, 1 - ramp)",ramp);
   $display ("    -- lline = %d (line duration in clocks)",lline);
   $display ("    -- ncols = %d (numer of clocks in HACT)",ncols);
   $display ("    -- nrows = %d (number of rows)",nrows);
   $display ("    -- t_afterHACT = %d ",t_afterHACT);
   $display ("    -- t_preHACT = %d ",t_preHACT);
   $display ("    -- new_bayer = %d ",new_bayer);


//  reg   [15:0]   sensor_data[0:4095]; // up to 64 x 64 pixels
    if      (SENSOR_IMAGE_TYPE == "NORM")      $readmemh({`ROOTPATH,"/input_data/sensor.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "RUN1")      $readmemh({`ROOTPATH,"/input_data/sensor_run1.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "HIST_TEST") $readmemh({`ROOTPATH,"/input_data/sensor_hist_test.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM1")     $readmemh({`ROOTPATH,"/input_data/sensor_01.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM2")     $readmemh({`ROOTPATH,"/input_data/sensor_02.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM3")     $readmemh({`ROOTPATH,"/input_data/sensor_03.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM4")     $readmemh({`ROOTPATH,"/input_data/sensor_04.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM5")     $readmemh({`ROOTPATH,"/input_data/sensor_05.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM6")     $readmemh({`ROOTPATH,"/input_data/sensor_06.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM7")     $readmemh({`ROOTPATH,"/input_data/sensor_07.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM8")     $readmemh({`ROOTPATH,"/input_data/sensor_08.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM9")     $readmemh({`ROOTPATH,"/input_data/sensor_09.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM10")    $readmemh({`ROOTPATH,"/input_data/sensor_10.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM11")    $readmemh({`ROOTPATH,"/input_data/sensor_11.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM12")    $readmemh({`ROOTPATH,"/input_data/sensor_12.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM13")    $readmemh({`ROOTPATH,"/input_data/sensor_13.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM14")    $readmemh({`ROOTPATH,"/input_data/sensor_14.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM15")    $readmemh({`ROOTPATH,"/input_data/sensor_15.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "NORM16")    $readmemh({`ROOTPATH,"/input_data/sensor_16.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "TEST01-1044X36") $readmemh({`ROOTPATH,"/input_data/test01-1044x36.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "TEST01-260X36")  $readmemh({`ROOTPATH,"/input_data/marching1_12b_260x36.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "TEST01-260X68")  $readmemh({`ROOTPATH,"/input_data/marching1_12b_260x68.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "260X260A")       $readmemh({`ROOTPATH,"/input_data/img260x260x12b.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "256X256A")       $readmemh({`ROOTPATH,"/input_data/img256x256-12b.dat"},sensor_data);
    else if (SENSOR_IMAGE_TYPE == "512X512A")       $readmemh({`ROOTPATH,"/input_data/img516x516-12b.dat"},sensor_data);
    else begin
       $display ("WARNING: Unrecognized sensor image :'%s', using default 'NORM': input_data/sensor.dat",SENSOR_IMAGE_TYPE);
       $readmemh({`ROOTPATH,"/input_data/sensor.dat"},sensor_data);
    end
   c=0;
//   {ibpf,ihact,ivact}=0;
   stopped=1;
   arst1=   0;
   seed=   1;
   d_rand=   0;
//   row=0;
//   col=0;

end
always @ (NMRST) begin
   c=0;
//   {ibpf,ihact,ivact}=0;
   stopped=1;
   arst1=0;
//   row=0;
//   col=0;
end

always begin
   @ (posedge MCLK) begin
//      #tMD   c = !stoppedd;
      #tMD   c = ARST && MRST; // NC393: when both are incative, (do not stop clock) 
      end
   @ (negedge MCLK) begin
      #tMD   c = 1'b0;
   end
end

always @ (posedge MCLK) begin
//   #1   stopped= !arst1 || (stoppedd  && !ARO) ;
   #1   stopped= !arst1 || ((stoppedd || (state== s_frame_done)) && ARO) ; /// ARO tow TRIGGER, active low
   #1   arst1=ARST;
end

always @ (posedge c) ivact1 = ivact;
always @ (posedge stoppedd or posedge c) begin
   if (stoppedd) begin
      {ibpf,ihact,ivact}=0;
      row=0;
      col=0;
//      id=0;
      state=0;
      cntr=0;
   end else if (|cntrd != 0) begin
      #1 cntr=cntrd-1;
      if (BPF || HACT) col=cold+1;
   end else begin
      case (stated)
      s_stop: begin
            cntr=   t_preVACT-1;
            state=   s_preVACT;
         end
      s_preVACT: begin
            ivact=   1'b1;
            cntr=   t_firstline-1;
            state=   s_firstline;
         end
       s_firstline: begin
            col=   0;
            row=   0;
            if (t_BPF>=1) begin
              ibpf=   1'b1;
              cntr=   t_BPF-1;
              state=   s_BPF;
            end else begin
              ihact=   1'b1;
              cntr=   t_HACT-1;
              state=   s_HACT;
            end
         end
      s_BPF: begin
            ibpf=   1'b0;
            cntr=   t_preHACT-1;
            state=   s_preHACT;
         end
      s_preHACT: begin
            ihact=   1'b1;
            col=   0;
            cntr=   t_HACT-1;
            state=   s_HACT;
         end
      s_HACT: begin
            ihact=   1'b0;
            row=   rowd+1;
            cntr=   t_afterHACT-1;
            state=   s_afterHACT;
         end
      s_afterHACT:
         if (rowd == nrows) begin
            cntr=   t_lastline-1;
            state=   s_lastline;
         end else begin
            col=   0;
            if (t_BPF>=1) begin
              ibpf=   1'b1;
              cntr=   t_BPF-1;
              state=   s_BPF;
            end else begin
              ihact=   1'b1;
              cntr=   t_HACT-1;
              state=   s_HACT;
            end
         end
      s_lastline: begin
            ivact=   1'b0;
            state=   s_frame_done;
            cntr=nVLO;
         end
      s_frame_done: if (OFST) begin
            ivact=   1'b1;
            cntr=   t_firstline-1;
            state=   s_firstline;
         end
      endcase

   end
// random data
   seed =   $random(seed);
   r =      (seed & 'h7fff);
   r=       (r * r) >> 20; // 10 bits
   c_rand = seed[16]; // >>16; // sign
   d_rand=c_rand?(D+(((1023-d_rand)*r)>>10)):(d_rand-((d_rand*r)>>10));
end



endmodule

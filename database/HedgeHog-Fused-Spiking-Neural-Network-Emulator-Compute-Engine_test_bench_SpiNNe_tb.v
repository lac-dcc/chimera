// SpiNNe_tb.v
//
// Author:  Jerry D. Harthcock
// Version:  1.23  June 28, 2020
// Copyright (C) 2020.  All rights reserved.
//
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//                                                                                                                    //
//                                                 SYMPL Open-Source                                                  //
//                          HedgeHog Fused Spiking Neural Network Emulator/Compute Engine                             //
//                                    Evaluation and Product Development License                                      //
//                                                                                                                    //
//                                                                                                                    //
// Open-source means:  this source code and this instruction set ("this IP") may be freely downloaded, copied,        //
// modified, distributed and used in accordance with the terms and conditons of the licenses provided herein.         //
//                                                                                                                    //
// Provided that you comply with all the terms and conditions set forth herein, Jerry D. Harthcock ("licensor"),      //
// the original author and exclusive copyright owner of this HedgeHog Fused Spiking Neural Network Emulator/Compute   //
// Engine, including related development software ("this IP"), hereby grants recipient of this IP ("licensee"),       //
// a world-wide, paid-up, non-exclusive license to implement this IP within the programmable fabric of Xilinx Kintex  //
// Ultra Plus brand FPGAs--only--and used only for the purposes of evaluation, education, and development of end      //
// products and related development tools.                                                                            //
//                                                                                                                    //
// Furthermore, limited to the purposes of prototyping, evaluation, characterization and testing of implementations   //
// in a hard, custom or semi-custom ASIC, any university or institution of higher education may have their            //
// implementation of this IP produced for said limited purposes at any foundary of their choosing provided that such  //
// prototypes do not ever wind up in commercial circulation, with this license extending to such foundary and is in   //
// connection with said academic pursuit under the supervision of said university or institution of higher education. //
//                                                                                                                    //
// Any copying, distribution, customization, modification, or derivative work of this IP must include an exact copy   //
// of this license and original copyright notice at the very top of each source file and any derived netlist, and,    //
// in the case of binaries, a printed copy of this license and/or a text format copy in a separate file distributed   //
// with said netlists or binary files having the file name, "LICENSE.txt".  You, the licensee, also agree not to      //
// remove any copyright notices from any source file covered or distributed under this Evaluation and Product         //
// Development License.                                                                                               //
//                                                                                                                    //
// LICENSOR DOES NOT WARRANT OR GUARANTEE THAT YOUR USE OF THIS IP WILL NOT INFRINGE THE RIGHTS OF OTHERS OR          //
// THAT IT IS SUITABLE OR FIT FOR ANY PURPOSE AND THAT YOU, THE LICENSEE, AGREE TO HOLD LICENSOR HARMLESS FROM        //
// ANY CLAIM BROUGHT BY YOU OR ANY THIRD PARTY FOR YOUR SUCH USE.                                                     //
//                                                                                                                    //
// Licensor reserves all his rights, including, but in no way limited to, the right to change or modify the terms     //
// and conditions of this Evaluation and Product Development License anytime without notice of any kind to anyone.    //
// By using this IP for any purpose, licensee agrees to all the terms and conditions set forth in this Evaluation     //
// and Product Development License.                                                                                   //
//                                                                                                                    //
// This Evaluation and Product Development License does not include the right to sell products that incorporate       //
// this IP or any IP derived from this IP. If you would like to obtain such a license, please contact Licensor.       //
//                                                                                                                    //
// Licensor can be contacted at:  SYMPL.gpu@gmail.com or Jerry.Harthcock@gmail.com                                    //
//                                                                                                                    //
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////




`timescale 1ns/100ps

module SpiNNe_tb();

parameter expTimeBuff   = 32'h00110000;  //0x00110000-0x00117FFF  exponentiated time (for possible use with SoftMax, etc)
parameter slopeBuff     = 32'h00108000;  //0x00108000-0x0010FFFF  slope (direction and amount from previous) buffer
parameter errBuff       = 32'h00100000;  //0x00100000-0x00107FFF  error (distance from firing threshold) buffer
parameter dendBuff      = 32'h000C0000;  //0x000C0000-0x000FFFFF  dendrite front-end result buffer
parameter ratesMem      = 32'h00080000;  //0x00080000-0x0008FFFF  charging rates memory
parameter binWeightsMem = 32'h00040000;  //0x00040000-0x0007FFFF  binary weights memory
parameter threshMem     = 32'h00018000;  //0x00018000-0x0001FFFF  thresholds memory
parameter accumSums     = 32'h00010000;  //0x00010000-0x00017FFF  accumulated sums memory
parameter spikeOutMem   = 32'h00008000;  //0x00008000-0x0000FFFF  spike output/result storage memory
parameter SNNinput      = 32'h00004000;  //0x00004000-0x00004FFF  SNN input
parameter spikeSrcMem   = 32'h00002000;  //0x00002000-0x00003FFF  spike train source storage
parameter STATUS_REG    = 32'h00007FF1;  //this is the location of the MOVER shell's STATUS register
parameter PC            = 32'h00007FF5;  //this is the MOVER shell's PC address

integer clk_high_time;               // high time for processor clock  
integer progLen;                     // length of program
integer r, file;
integer j, k;
integer ticks;                       //this is the number of ticks in the input spike train

reg [63:0] ProgBuff64[16383:0];       //64-bit memory initially loaded with "<prog>.hex" file for SCE
reg [79:0] WeightInBuf[16383:0];      //this will hold 16k raw h=7 decimal char sequence weights (plus CR LF) 
reg [79:0] SpikeInBuf[16383:0];      //this will hold 16k 8-char spike rows (plus CR LF) 
reg [87:0] BinDecFix[16383:0];      //this will hold 16k 12-char dec char sequences 

reg clk;
reg reset;
reg HostWren;
reg [2:0] HostWrSize;
reg [31:0] HostWraddrs;
reg [63:0] HostWrdata;
reg HostRden;
reg [2:0] HostRdSize;
reg [31:0] HostRdaddrs;
wire [63:0] HostRddata;

reg toBinWren;
reg [17:0] toBinWraddrs;
reg [63:0] toBinWrdata;
reg toBinRden;
reg [17:0] toBinRdaddrs;
wire [15:0] toBinRddata;

reg fromBinWren;   
reg [17:0] fromBinWraddrs;
reg [15:0] fromBinWrdata; 
reg fromBinRden;   
reg [17:0] fromBinRdaddrs;
wire [63:0] fromBinRddata; 

reg [63:0] dummyRead;
wire done;

HedgeHog shell(
   .CLK     (clk),
   .RESET   (reset),
   .wren    (HostWren),
   .wrSize  (HostWrSize),
   .wrdata  (HostWrdata),
   .wraddrs (HostWraddrs),
   .rden    (HostRden),
   .rdSize  (HostRdSize),
   .rdaddrs (HostRdaddrs),
   .rddata  (HostRddata),
   .done    (done)
   );


decCharToBinBuf toBin(      //this testbench uses this to convert incoming H=7 decimal char sequences from spreadsheets
    .RESET  (reset),       //or text editors to binary(7/8) format before loading into target memory space
    .CLK    (clk),
    .RM     (2'b00),       //round nearest
    .wren   (toBinWren),
    .wraddrs(toBinWraddrs[13:0]),
    .wrdata (toBinWrdata),
    .rden   (toBinRden),
    .rdaddrs(toBinRdaddrs),
    .rddata (toBinRddata)
    );
    
binToDecCharBuf fromBin(
     .CLK    (clk           ),
     .RESET  (reset         ),
     .RM     (2'b00         ),
     .wren   (fromBinWren   ),
     .wraddrs(fromBinWraddrs[13:0]),
     .wrdata (fromBinWrdata ),
     .rden   (fromBinRden   ),
     .rdaddrs(fromBinRdaddrs),
     .rddata (fromBinRddata )
        );    
    
initial begin
    clk = 0;
    reset = 1;
    clk_high_time = 5;
    HostWren = 0;
    HostWrSize = 0;
    HostWraddrs = 0;
    HostWrdata = 0;
    HostRden = 0;
    HostRdSize = 0;
    HostRdaddrs = 0;
    
    toBinWren = 0;
    toBinWraddrs = 0;
    toBinWrdata = 0;
    toBinRden = 0;
    toBinRdaddrs = 0;
    
    fromBinWren = 0;   
    fromBinWraddrs = 0;
    fromBinWrdata = 0; 
    fromBinRden = 0;   
    fromBinRdaddrs = 0;
    
    ticks = 32;  //for this demo, the input spike trains are all 32 ticks deep 
    
#503 reset = 0;

//load the H=7 decimal char sequence weights into input buffer then convert them to binary7/8 format    
    k=0;
    while(k<16384) begin //initialize weight input buffer to 0
        WeightInBuf[k] = 0;
        k=k+1;
    end        
//        file = $fopen("weights.txt", "rb");       //use this for 8x8 or 16x16 single layer
        file = $fopen("weights_32x32.txt", "rb");   //use this for 32x32 single layer
        r = $fread(WeightInBuf, file, 0);       
        $fclose(file); 
    k=0;
    j=0;
    while(k<16384)  begin 
        @(posedge clk);
        #1 toBinWrdata = WeightInBuf[k]>>16;
        toBinWren = 1;
        toBinWraddrs = k;
        if(~|toBinWrdata) begin
        #1 @(posedge clk);
            j=k;  //save weight count
            k=16384;
            toBinWren = 0;
            toBinWraddrs = 0;
            toBinWrdata = 0;
        end    
        else k=k+1;
    end 
         @(posedge clk); 
         
    k=0;
    while(k<j) begin    //copy decCharToBin weight results into target memory
        @(posedge clk);
        HOST_MONITOR_WRITE(3'b001, k+binWeightsMem, toBin.RAMA[k]);
        k=k+1;                    
    end      
//load the ascii character spike trains into temp input buffer    
        k=0;
        while(k<16384) begin //initialize spike input buffer to 0
            SpikeInBuf[k] = 0;
            k=k+1;
        end        
            file = $fopen("spike_trains.txt", "rb");   
            r = $fread(SpikeInBuf, file, 0);       
            $fclose(file); 

    k=0;
    while(k<j) begin    //convert to binary, then copy spike trains into target memory
        @(posedge clk);
        HOST_MONITOR_WRITE(3'b000, k+spikeSrcMem, {SpikeInBuf[k][72], SpikeInBuf[k][64], SpikeInBuf[k][56], SpikeInBuf[k][48], SpikeInBuf[k][40], SpikeInBuf[k][32], SpikeInBuf[k][24], SpikeInBuf[k][16]});
        k=k+1;                    
    end      

        @(posedge clk);         
       
        // load the SCE program into into SCE during initialization
//        file = $fopen("spikeDemo.HEX", "rb");            //use this for 8x8 single layer
//        file = $fopen("spikeDemo16x16.HEX", "rb");       //use this for 16x16 single layer
        file = $fopen("spikeDemo32x32.HEX", "rb");         //use this for 32x32 single layer
        r = $fread(ProgBuff64, file, 0);       
        $fclose(file); 
        @(posedge clk);
        progLen = ProgBuff64[1];                                                  
        k = 0;
        while(k<=progLen) begin
        #1
            shell.PRAM0.pram0.twoportRAMA[k] = ProgBuff64[k];    //the first 4k words of prog mem is dual-port on the read side  
            shell.PRAM0.pram0.twoportRAMB[k] = ProgBuff64[k];      
            k=k+1;
        end  
        @(posedge clk);         
         HOST_MONITOR_WRITE(3'b010, PC, ProgBuff64[0][31:0]);  //push program entry point into MOVER shell's PC   
        @(posedge clk);         
        HOST_RUN;
        wait(~done);
        wait(done);
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         

//retrieve resulting data, convert to decimal char sequences, then write to file(s) 
        k=0;
        //do dendrite buffer first
        while(k<ticks*64) begin      //use this for 8x8 single layer
            HOST_MONITOR_READ(3'b001, dendBuff+k, fromBinWrdata);
            fromBinWren = 1'b1; 
            fromBinWraddrs = k;
            k=k+1;
        end
        @(posedge clk);         
         #1 fromBinWren = 1'b0; 
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        @(posedge clk);         
        
        k=0;
        //replace token exponent with one a spreadsheet understands
        while(k<ticks*64) begin      //use this for 8x8 single layer
               
         BinDecFix[k] = (fromBin.RAMA[k][15:0]=="+0") ? {11{"0"}} : 
         (fromBin.RAMA[k][7:0]<":") ? {fromBin.RAMA[k], "e+00"} :
         
         {fromBin.RAMA[k][63:8], "e",((fromBin.RAMA[k][7:0]>7'd96) ? "-" : "+"), 
         (fromBin.RAMA[k][7:0]<"J") ? {"0", fromBin.RAMA[k][7:0]-7'd64 + 7'd48} :       
         (fromBin.RAMA[k][7:0]<"T") ? {"1", fromBin.RAMA[k][7:0]-7'd74 + 7'd48} :       
         (fromBin.RAMA[k][7:0]<"[") ? {"2", fromBin.RAMA[k][7:0]-7'd84 + 7'd48} : 
               
         (fromBin.RAMA[k][7:0]<"j") ? {"0", fromBin.RAMA[k][7:0]-7'd96 + 7'd48} :       
         (fromBin.RAMA[k][7:0]<"t") ? {"1", fromBin.RAMA[k][7:0]-7'd106 + 7'd48} : {"2", fromBin.RAMA[k][7:0]-7'd116 + 7'd48}}; 
         k=k+1;      
        end        
                
         k = 0;       
        file = $fopen("dendrite.txt", "wb");            
        while(k<ticks*64) begin      //use this for 8x8 single layer
        @(posedge clk);         
            $fwrite(file, "%s", {
                             BinDecFix[k+63],",",
                             BinDecFix[k+62],",",
                             BinDecFix[k+61],",",
                             BinDecFix[k+60],",",
                             BinDecFix[k+59],",",
                             BinDecFix[k+58],",",
                             BinDecFix[k+57],",",
                             BinDecFix[k+56],",",
                             BinDecFix[k+55],",",
                             BinDecFix[k+54],",",
                             BinDecFix[k+53],",",
                             BinDecFix[k+52],",",
                             BinDecFix[k+51],",",
                             BinDecFix[k+50],",",
                             BinDecFix[k+49],",",
                             BinDecFix[k+48],",",
                             BinDecFix[k+47],",",
                             BinDecFix[k+46],",",
                             BinDecFix[k+45],",",
                             BinDecFix[k+44],",",
                             BinDecFix[k+43],",",
                             BinDecFix[k+42],",",
                             BinDecFix[k+41],",",
                             BinDecFix[k+40],",",
                             BinDecFix[k+39],",",
                             BinDecFix[k+38],",",
                             BinDecFix[k+37],",",
                             BinDecFix[k+36],",",
                             BinDecFix[k+35],",",
                             BinDecFix[k+34],",",
                             BinDecFix[k+33],",",
                             BinDecFix[k+32],",",
                             BinDecFix[k+31],",",
                             BinDecFix[k+30],",",
                             BinDecFix[k+29],",",
                             BinDecFix[k+28],",",
                             BinDecFix[k+27],",",
                             BinDecFix[k+26],",",
                             BinDecFix[k+25],",",
                             BinDecFix[k+24],",",
                             BinDecFix[k+23],",",
                             BinDecFix[k+22],",",
                             BinDecFix[k+21],",",
                             BinDecFix[k+20],",",
                             BinDecFix[k+19],",",
                             BinDecFix[k+18],",",
                             BinDecFix[k+17],",",
                             BinDecFix[k+16],",",
                             BinDecFix[k+15],",",
                             BinDecFix[k+14],",",
                             BinDecFix[k+13],",",
                             BinDecFix[k+12],",",
                             BinDecFix[k+11],",",
                             BinDecFix[k+10],",",
                             BinDecFix[k+9],",",
                             BinDecFix[k+8],",",
                             BinDecFix[k+7],",",
                             BinDecFix[k+6],",",
                             BinDecFix[k+5],",",
                             BinDecFix[k+4],",",
                             BinDecFix[k+3],",",
                             BinDecFix[k+2],",",
                             BinDecFix[k+1],",",
                             BinDecFix[k+0]},"\n");
                            
            k = k + 64;
        end
 $fclose(file);       
//retrieve resulting output levels, convert to decimal char sequences, then write to file(s) 
                k=0;
                while(k<ticks*8) begin
                    HOST_MONITOR_READ(3'b001, accumSums+k, fromBinWrdata);
                    fromBinWren = 1'b1; 
                    fromBinWraddrs = k;
                    k=k+1;
                end
                @(posedge clk);         
                #1 fromBinWren = 1'b0; 
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                
                k=0;
                //replace token exponent with one a spreadsheet understands
                while(k<ticks*8) begin
                       
                 BinDecFix[k] = (fromBin.RAMA[k][15:0]=="+0") ? {11{"0"}} : 
                 (fromBin.RAMA[k][7:0]<":") ? {fromBin.RAMA[k], "e+00"} :
                 
                 {fromBin.RAMA[k][63:8], "e",((fromBin.RAMA[k][7:0]>7'd96) ? "-" : "+"), 
                 (fromBin.RAMA[k][7:0]<"J") ? {"0", fromBin.RAMA[k][7:0]-7'd64 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"T") ? {"1", fromBin.RAMA[k][7:0]-7'd74 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"[") ? {"2", fromBin.RAMA[k][7:0]-7'd84 + 7'd48} : 
                       
                 (fromBin.RAMA[k][7:0]<"j") ? {"0", fromBin.RAMA[k][7:0]-7'd96 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"t") ? {"1", fromBin.RAMA[k][7:0]-7'd106 + 7'd48} : {"2", fromBin.RAMA[k][7:0]-7'd116 + 7'd48}}; 
                 k=k+1;      
                end        
                        
                 k = 0;       
                file = $fopen("outputLevels.txt", "wb");            
                while(k<ticks*8) begin
                @(posedge clk);         
                    $fwrite(file, "%s", {
                                     BinDecFix[k+7],",",
                                     BinDecFix[k+6],",",
                                     BinDecFix[k+5],",",
                                     BinDecFix[k+4],",",
                                     BinDecFix[k+3],",",
                                     BinDecFix[k+2],",",
                                     BinDecFix[k+1],",",
                                     BinDecFix[k+0]},"\n");
                                    
                    k = k + 8;
                end 
         
        $fclose(file);

//retrieve error amounts, convert to decimal char sequences, then write to file(s) 
                k=0;
                while(k<ticks*8) begin
                    HOST_MONITOR_READ(3'b001, errBuff+k, fromBinWrdata);
                    #1 fromBinWren = 1'b1; 
                    fromBinWraddrs = k;
                    k=k+1;
                end
                @(posedge clk);         
                #1 fromBinWren = 1'b0; 
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                
                k=0;
                //replace token exponent with one a spreadsheet understands
                while(k<ticks*8) begin
                       
                 BinDecFix[k] = (fromBin.RAMA[k][15:0]=="+0") ? {11{"0"}} : 
                 (fromBin.RAMA[k][7:0]<":") ? {fromBin.RAMA[k], "e+00"} :
                 
                 {fromBin.RAMA[k][63:8], "e",((fromBin.RAMA[k][7:0]>7'd96) ? "-" : "+"), 
                 (fromBin.RAMA[k][7:0]<"J") ? {"0", fromBin.RAMA[k][7:0]-7'd64 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"T") ? {"1", fromBin.RAMA[k][7:0]-7'd74 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"[") ? {"2", fromBin.RAMA[k][7:0]-7'd84 + 7'd48} : 
                       
                 (fromBin.RAMA[k][7:0]<"j") ? {"0", fromBin.RAMA[k][7:0]-7'd96 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"t") ? {"1", fromBin.RAMA[k][7:0]-7'd106 + 7'd48} : {"2", fromBin.RAMA[k][7:0]-7'd116 + 7'd48}}; 
                 k=k+1;      
                end        
                        
                 k = 0;       
                file = $fopen("errAmounts.txt", "wb");            
                while(k<ticks*8) begin
                @(posedge clk);         
                    $fwrite(file, "%s", {
                                     BinDecFix[k+7],",",
                                     BinDecFix[k+6],",",
                                     BinDecFix[k+5],",",
                                     BinDecFix[k+4],",",
                                     BinDecFix[k+3],",",
                                     BinDecFix[k+2],",",
                                     BinDecFix[k+1],",",
                                     BinDecFix[k+0]},"\n");
                                    
                    k = k + 8;
                end 
         
        $fclose(file);                

//retrieve slope amounts, convert to decimal char sequences, then write to file(s) 
                k=0;
                while(k<ticks*8) begin
                    HOST_MONITOR_READ(3'b001, slopeBuff+k, fromBinWrdata);
                    #1 fromBinWren = 1'b1; 
                    fromBinWraddrs = k;
                    k=k+1;
                end
                @(posedge clk);         
                #1 fromBinWren = 1'b0; 
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                
                k=0;
                //replace token exponent with one a spreadsheet understands
                while(k<ticks*8) begin
                       
                 BinDecFix[k] = (fromBin.RAMA[k][15:0]=="+0") ? {11{"0"}} : 
                 (fromBin.RAMA[k][7:0]<":") ? {fromBin.RAMA[k], "e+00"} :
                 
                 {fromBin.RAMA[k][63:8], "e",((fromBin.RAMA[k][7:0]>7'd96) ? "-" : "+"), 
                 (fromBin.RAMA[k][7:0]<"J") ? {"0", fromBin.RAMA[k][7:0]-7'd64 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"T") ? {"1", fromBin.RAMA[k][7:0]-7'd74 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"[") ? {"2", fromBin.RAMA[k][7:0]-7'd84 + 7'd48} : 
                       
                 (fromBin.RAMA[k][7:0]<"j") ? {"0", fromBin.RAMA[k][7:0]-7'd96 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"t") ? {"1", fromBin.RAMA[k][7:0]-7'd106 + 7'd48} : {"2", fromBin.RAMA[k][7:0]-7'd116 + 7'd48}}; 
                 k=k+1;      
                end        
                        
                 k = 0;       
                file = $fopen("slopeAmounts.txt", "wb");            
                while(k<ticks*8) begin
                @(posedge clk);         
                    $fwrite(file, "%s", {
                                     BinDecFix[k+7],",",
                                     BinDecFix[k+6],",",
                                     BinDecFix[k+5],",",
                                     BinDecFix[k+4],",",
                                     BinDecFix[k+3],",",
                                     BinDecFix[k+2],",",
                                     BinDecFix[k+1],",",
                                     BinDecFix[k+0]},"\n");
                                    
                    k = k + 8;
                end 
         
        $fclose(file);                

//time exponentials : softMax : summation, convert to decimal char sequences, then write to file(s) 
                k=0;
                while(k<17) begin
                    HOST_MONITOR_READ(3'b001, expTimeBuff+k, fromBinWrdata);
                    #1 fromBinWren = 1'b1; 
                    fromBinWraddrs = k;
                    k=k+1;
                end
                @(posedge clk);         
                #1 fromBinWren = 1'b0; 
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                @(posedge clk);         
                
                k=0;
                //replace token exponent with one a spreadsheet understands
                while(k<17) begin
                       
                 BinDecFix[k] = (fromBin.RAMA[k][15:0]=="+0") ? {11{"0"}} : 
                 (fromBin.RAMA[k][7:0]<":") ? {fromBin.RAMA[k], "e+00"} :
                 
                 {fromBin.RAMA[k][63:8], "e",((fromBin.RAMA[k][7:0]>7'd96) ? "-" : "+"), 
                 (fromBin.RAMA[k][7:0]<"J") ? {"0", fromBin.RAMA[k][7:0]-7'd64 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"T") ? {"1", fromBin.RAMA[k][7:0]-7'd74 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"[") ? {"2", fromBin.RAMA[k][7:0]-7'd84 + 7'd48} : 
                       
                 (fromBin.RAMA[k][7:0]<"j") ? {"0", fromBin.RAMA[k][7:0]-7'd96 + 7'd48} :       
                 (fromBin.RAMA[k][7:0]<"t") ? {"1", fromBin.RAMA[k][7:0]-7'd106 + 7'd48} : {"2", fromBin.RAMA[k][7:0]-7'd116 + 7'd48}}; 
                 k=k+1;      
                end        
                        
                file = $fopen("exponentials.txt", "wb");            
                @(posedge clk);         
                    $fwrite(file, "%s", {
                                     BinDecFix[7],",",
                                     BinDecFix[6],",",
                                     BinDecFix[5],",",
                                     BinDecFix[4],",",
                                     BinDecFix[3],",",
                                     BinDecFix[2],",",
                                     BinDecFix[1],",",
                                     BinDecFix[0]},"\n");
                                    
         
        $fclose(file);                

                file = $fopen("softMax.txt", "wb");            
                @(posedge clk);         
                    $fwrite(file, "%s", {
                                     BinDecFix[15],",",
                                     BinDecFix[14],",",
                                     BinDecFix[13],",",
                                     BinDecFix[12],",",
                                     BinDecFix[11],",",
                                     BinDecFix[10],",",
                                     BinDecFix[9],",",
                                     BinDecFix[8]},"\n");
                                    
         
        $fclose(file);                

                file = $fopen("summation.txt", "wb");            
                @(posedge clk);         
                    $fwrite(file, "%s", BinDecFix[16],"\n");
                                    
        $fclose(file);                

       
    #100 $finish;  
end

task HOST_MONITOR_READ;     //performs a single read from target memory space       
    input [2:0]  monitorReadSize;
    input [31:0] monitorReadAddress;
    output [63:0] monitorReadData;
    reg [63:0] monitorReadData;
    begin
           HostRden    = 1'b1;
           HostRdSize  = monitorReadSize;
           HostRdaddrs = monitorReadAddress;    
        #1 @(posedge clk);
           @(posedge clk);
        #1 monitorReadData = HostRddata;    
           HostRden    = 1'b0;
    end
endtask     
     
task HOST_MONITOR_WRITE;   //performs a single write to target memory space
    input [1:0]  monitorWriteSize;
    input [31:0] monitorWriteAddress;
    input [63:0] monitorWriteData;
    begin                                           
          #1 HostWren    = 1'b1; 
             HostWrSize  = monitorWriteSize;                
             HostWraddrs = monitorWriteAddress;        
             HostWrdata  = monitorWriteData; 
         @(posedge clk);
          #1 HostWren    = 1'b0;                 
             HostWraddrs = 32'b0;        
             HostWrdata  = 64'b0; 
    end
endtask  
   

task HOST_CLEAR_FORCE_BREAK;
    begin    
          #1 HostWren    = 1'b1;                 
             HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
             HostWraddrs = STATUS_REG;        
             HostWrdata  = 64'b0; 
         @(posedge clk);
          #1 HostWren    = 1'b0;                 
             HostWraddrs = 32'b0;        
             HostWrdata  = 64'b0;
             HostWrSize  = 3'b000; 
    end
endtask 

task HOST_FORCE_BREAK;
    begin    
          #1 HostWren    = 1'b1;                 
             HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
             HostWraddrs = STATUS_REG;        
             HostWrdata  = 64'h0000_0002; 
         @(posedge clk);
          #1 HostWren    = 1'b0;                 
             HostWraddrs = 32'b0;        
             HostWrdata  = 64'b0;
             HostWrSize  = 3'b000; 
    end
endtask 

task HOST_SINGLE_STEP;
    begin    
          #1 HostWren    = 1'b1;                 
             HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
             HostWraddrs = STATUS_REG;        
             HostWrdata  = 64'h0000_0011; 
         @(posedge clk);
           #1 HostWren    = 1'b1;                 
            HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
            HostWraddrs = STATUS_REG;        
            HostWrdata  = 64'h0000_0010; 
          @(posedge clk);
        #1 HostWren    = 1'b0;                 
             HostWraddrs = 32'b0;        
             HostWrdata  = 64'b0;
             HostWrSize  = 3'b000; 
    end
endtask 

task HOST_RUN;
    begin    
          #1 HostWren    = 1'b1;                 
             HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
             HostWraddrs = STATUS_REG;        
             HostWrdata  = 64'h0000_0001; 
         @(posedge clk);
           #1 HostWren    = 1'b1;                 
            HostWrSize  = 3'b001;   //must indicate 16-bit write even though only the 2 LSBs are actually being written             
            HostWraddrs = STATUS_REG;        
            HostWrdata  = 64'h0000_0000; 
         @(posedge clk);
         #1 HostWren    = 1'b0;                 
             HostWraddrs = 32'b0;        
             HostWrdata  = 64'b0;
             HostWrSize  = 3'b000; 
    end
endtask 

always #clk_high_time clk = ~clk;

endmodule

// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>cmd_mux
 * @file cmd_mux.v
 * @date 2015-01-11  
 * @author Andrey Filippov     
 *
 * @brief Command multiplexer between AXI and frame-based command sequencer
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * cmd_mux.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  cmd_mux.v is distributed in the hope that it will be useful,
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
`timescale 1ns/1ps

module  cmd_mux #(
    parameter AXI_WR_ADDR_BITS=    14,
    parameter CONTROL_ADDR =       'h0000, // AXI write address of control write registers
    parameter CONTROL_ADDR_MASK =  'h3800, // AXI write address of control registers
    parameter NUM_CYCLES_LOW_BIT=   6, // decode addresses [NUM_CYCLES_LOW_BIT+:5] into command a/d length
    parameter NUM_CYCLES_00 =       2, // 2-cycle 000.003f
    parameter NUM_CYCLES_01 =       4, // 4-cycle 040.007f
    parameter NUM_CYCLES_02 =       3, // 3-cycle 080.00bf
    parameter NUM_CYCLES_03 =       3, // 3-cycle 0c0.00ff
    parameter NUM_CYCLES_04 =       6, // 6-cycle 100.013f
    parameter NUM_CYCLES_05 =       6, // 6-cycle 140.017f
    parameter NUM_CYCLES_06 =       4, // 4-cycle 180.01bf
    parameter NUM_CYCLES_07 =       4, // 4-cycle 1c0.01ff
    parameter NUM_CYCLES_08 =       6, // 6-cycle 200.023f
    parameter NUM_CYCLES_09 =       6, //
    parameter NUM_CYCLES_10 =       6, //
    parameter NUM_CYCLES_11 =       6, //
    parameter NUM_CYCLES_12 =       6, //
    parameter NUM_CYCLES_13 =       5, // 5-cycle - not yet used
    parameter NUM_CYCLES_14 =       6, // 6-cycle - not yet used
    parameter NUM_CYCLES_15 =       9, // single-cycle
    parameter NUM_CYCLES_16 =       6,  //
    parameter NUM_CYCLES_17 =       6,  //
    parameter NUM_CYCLES_18 =       6,  //
    parameter NUM_CYCLES_19 =       6,  //
    parameter NUM_CYCLES_20 =       6,  //
    parameter NUM_CYCLES_21 =       6,  //
    parameter NUM_CYCLES_22 =       6,  //
    parameter NUM_CYCLES_23 =       6,  //
    parameter NUM_CYCLES_24 =       6,  //
    parameter NUM_CYCLES_25 =       6,  //
    parameter NUM_CYCLES_26 =       6,  //
    parameter NUM_CYCLES_27 =       6,  //
    parameter NUM_CYCLES_28 =       6,  //
    parameter NUM_CYCLES_29 =       6,  //
    parameter NUM_CYCLES_30 =       6,  //
    parameter NUM_CYCLES_31 =       6  //
    
) (
    input                         axi_clk,
    input                         mclk,
    input                         mrst, // @posedge mclk - sync reset
    input                         arst, // @posedge axi_clk - sync reset
    // direct commands from AXI. No wait but for multi-cycle output and command sequencer (having higher priority)
    input  [AXI_WR_ADDR_BITS-1:0] pre_waddr,     // AXI write address, before actual writes (to generate busy), valid@start_burst
    input                         start_wburst, // burst start - should generate ~ready (should be AND-ed with !busy internally) 
    input  [AXI_WR_ADDR_BITS-1:0] waddr,        // write address, valid with wr_en
    input                         wr_en,        // write enable 
    input                  [31:0] wdata,        // write data, valid with waddr and wr_en
    output                        busy,         // interface busy (combinatorial delay from start_wburst and pre_addr), controls AXI FIFO
    
    // frame-based commands from the command sequencer (no wait but for multi-cycle output 
    input  [AXI_WR_ADDR_BITS-1:0] cseq_waddr,   // write address, valid with cseq_wr_en
    input                         cseq_wr_en,   // write enable 
    input                  [31:0] cseq_wdata,   // write data, valid with cseq_waddr and cseq_wr_en
    output                        cseq_ackn,    // command sequencer address/data accepted
    // Write address /data/strobe to slaves. Both parallel and byte-serial data available. COmbined from AXI and command sequencer
    output [AXI_WR_ADDR_BITS-1:0] par_waddr,    // parallel address
    output                 [31:0] par_data,     // parallel 32-bit data
    output                  [7:0] byte_ad,      // byte-wide address/data (AL-AH-DB0-DB1-DB2-DB3)
    output                        ad_stb        // low address output strobe (and parallel A/D)
);
// Minimal - 1 cycle, AH=DB0=DB1=DB2=DB3=0;
    reg busy_r=0;
    reg selected=0; // address range to be processed here (outside - buffer(s) and command sequencer?)
    wire fifo_half_empty; // just debugging with (* keep = "true" *)
    wire selected_w;
    wire ss;        // current command (in par_waddr) is a single-cycle one
    reg                    [47:0] par_ad;
    reg                           ad_stb_r;       // low address output strobe (and parallel A/D)
    reg                           cmdseq_full_r;  // address/data from the command sequencer is loaded to internal register (cseq_waddr_r,cseq_wdata_r)
    reg    [AXI_WR_ADDR_BITS-1:0] cseq_waddr_r;   // registered command address from the sequencer
    reg                    [31:0] cseq_wdata_r;   // registered command data from the sequencer
    reg                     [3:0] seq_length;     // encoded ROM output - number of cycles in command sequence, [3] - single cycle 
    reg                     [4:0] seq_busy_r;     // shift register loaded by decoded seq_length
    wire                    [4:0] seq_length_rom_a; // address range used to determine command length

    wire  can_start_w;  // can start command cycle (either from sequencer or from AXI)
    wire  start_w;      // start cycle
    wire  start_axi_w;  // start cycle from the AXI (==fifo_re)
    wire fifo_nempty;
    wire [AXI_WR_ADDR_BITS-1:0] waddr_fifo_out;
    wire                 [31:0] wdata_fifo_out;
    
    assign selected_w=((pre_waddr ^ CONTROL_ADDR) & CONTROL_ADDR_MASK)==0;

    assign busy=busy_r && (start_wburst? selected_w: selected);// should be just combinatorial delay from start_wburst and decoded command
    assign par_waddr=par_ad[AXI_WR_ADDR_BITS-1:0];    // parallel address
    assign par_data=par_ad[47:16];     // parallel 32-bit data
    assign byte_ad=par_ad[7:0];      // byte-wide address/data (AL-AH-DB0-DB1-DB2-DB3)
    assign ad_stb=ad_stb_r;       // low address output strobe (and parallel A/D)
    
    assign seq_length_rom_a=par_ad[NUM_CYCLES_LOW_BIT+:5];
    assign ss= seq_length[3];

    always @ (posedge axi_clk) begin
        if (arst)              selected <= 1'b0;
        else if (start_wburst) selected <= selected_w;
        if (arst)              busy_r <= 1'b0;
        else                   busy_r <= !fifo_half_empty;
    end
    
// ROM command length decoder TODO: put actual data
//    always @ (seq_length_rom_a) begin
    always @*
        case (seq_length_rom_a)  // just temporary - fill out later
            5'h00:seq_length <= NUM_CYCLES_00;
            5'h01:seq_length <= NUM_CYCLES_01;
            5'h02:seq_length <= NUM_CYCLES_02;
            5'h03:seq_length <= NUM_CYCLES_03;
            5'h04:seq_length <= NUM_CYCLES_04;
            5'h05:seq_length <= NUM_CYCLES_05;
            5'h06:seq_length <= NUM_CYCLES_06;
            5'h07:seq_length <= NUM_CYCLES_07;
            5'h08:seq_length <= NUM_CYCLES_08;
            5'h09:seq_length <= NUM_CYCLES_09;
            5'h0a:seq_length <= NUM_CYCLES_10;
            5'h0b:seq_length <= NUM_CYCLES_11;
            5'h0c:seq_length <= NUM_CYCLES_12;
            5'h0d:seq_length <= NUM_CYCLES_13;
            5'h0e:seq_length <= NUM_CYCLES_14;
            5'h0f:seq_length <= NUM_CYCLES_15;
            5'h10:seq_length <= NUM_CYCLES_16;
            5'h11:seq_length <= NUM_CYCLES_17;
            5'h12:seq_length <= NUM_CYCLES_18;
            5'h13:seq_length <= NUM_CYCLES_19;
            5'h14:seq_length <= NUM_CYCLES_20;
            5'h15:seq_length <= NUM_CYCLES_21;
            5'h16:seq_length <= NUM_CYCLES_22;
            5'h17:seq_length <= NUM_CYCLES_23;
            5'h18:seq_length <= NUM_CYCLES_24;
            5'h19:seq_length <= NUM_CYCLES_25;
            5'h1a:seq_length <= NUM_CYCLES_26;
            5'h1b:seq_length <= NUM_CYCLES_27;
            5'h1c:seq_length <= NUM_CYCLES_28;
            5'h1d:seq_length <= NUM_CYCLES_29;
            5'h1e:seq_length <= NUM_CYCLES_30;
            5'h1f:seq_length <= NUM_CYCLES_31;
        endcase
    always @ (posedge mclk) begin
        if (mrst) seq_busy_r<=0;
        else begin
            if (ad_stb) begin
                case (seq_length)
                    4'h2:    seq_busy_r<=5'h01;
                    4'h3:    seq_busy_r<=5'h03;
                    4'h4:    seq_busy_r<=5'h07;
                    4'h5:    seq_busy_r<=5'h0f;
                    4'h6:    seq_busy_r<=5'h1f;
                    default: seq_busy_r<=5'h00;
                endcase
            end else seq_busy_r <= {1'b0,seq_busy_r[4:1]};
        end
    end
    
    assign can_start_w=  ad_stb_r? ss: !seq_busy_r[1];
    assign start_axi_w=  can_start_w && ~cmdseq_full_r && fifo_nempty;
    assign start_w=      can_start_w && (cmdseq_full_r || fifo_nempty);
    always @ (posedge mclk) begin
        if (mrst) ad_stb_r <= 0;
        else      ad_stb_r <= start_w;
    end
    always @ (posedge mclk) begin
        if (start_w) par_ad <={cmdseq_full_r?cseq_wdata_r:wdata_fifo_out,{(16-AXI_WR_ADDR_BITS){1'b0}},cmdseq_full_r?cseq_waddr_r:waddr_fifo_out};
        else par_ad <={8'b0,par_ad[47:8]};
    end
    
    assign  cseq_ackn= cseq_wr_en && (!cmdseq_full_r || can_start_w); // cmddseq_full has priority over axi, so (can_start_w && cmdseq_full_r)
    
    always @ (posedge mclk) begin
        if (mrst) cmdseq_full_r <= 0;
        else cmdseq_full_r <= cseq_ackn || (cmdseq_full_r && !can_start_w);
    end
    always @ (posedge mclk) begin
        if (cseq_ackn) begin
            cseq_waddr_r <= cseq_waddr;
            cseq_wdata_r <= cseq_wdata;
        end
    end        

    /* FIFO to cross clock boundary */
    fifo_cross_clocks #(
        .DATA_WIDTH  (AXI_WR_ADDR_BITS+32),
        .DATA_DEPTH  (4)
    ) fifo_cross_clocks_i (
        .rst         (1'b0), // input
        .rrst        (mrst), // input
        .wrst        (arst), // input
        .rclk        (mclk), // input
        .wclk        (axi_clk), // input
        .we          (wr_en && selected), // input
        .re          (start_axi_w), // input
        .data_in     ({waddr[AXI_WR_ADDR_BITS-1:0],wdata[31:0]}), // input[15:0] 
        .data_out    ({waddr_fifo_out[AXI_WR_ADDR_BITS-1:0],wdata_fifo_out[31:0]}), // output[15:0] 
        .nempty      (fifo_nempty), // output
        .half_empty  (fifo_half_empty) // output
    );


endmodule

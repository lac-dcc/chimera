// This program was cloned from: https://github.com/Elphel/x393_sata
// License: GNU General Public License v3.0

/*******************************************************************************
 * Module: simul_axi_hp_rd
 * Date:2015-04-25  
 * Author: Andrey Filippov     
 * Description: Simplified model of AXI_HP read channel (64-bit only)
 *
 * Copyright (c) 2015 Elphel, Inc.
 * simul_axi_hp_rd.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  simul_axi_hp_rd.v is distributed in the hope that it will be useful,
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
 *******************************************************************************/
`timescale 1ns/1ps

module  simul_axi_hp_rd #(
    parameter [1:0] HP_PORT=0
)(
    input         rst,
    // AXI signals
    input         aclk,
    output        aresetn, // do not use?
    // read address
    input  [31:0] araddr,
    input         arvalid,
    output        arready,
    input  [ 5:0] arid,
    input  [ 1:0] arlock,
    input  [ 3:0] arcache,
    input  [ 2:0] arprot,
    input  [ 3:0] arlen,
    input  [ 1:0] arsize,
    input  [ 1:0] arburst,
    input  [ 3:0] arqos,
    // read data
    output [63:0] rdata,
    output        rvalid,
    input         rready,
    output [ 5:0] rid,
    output        rlast,
    output [ 1:0] rresp,
    // PL extra (non-AXI) signals
    output [ 7:0] rcount,
    output [ 2:0] racount,
    input         rdissuecap1en,
    // Simulation signals - use same aclk
    output [31:0] sim_rd_address,
    output [ 5:0] sim_rid,
    input         sim_rd_valid,
    output        sim_rd_ready,
    input  [63:0] sim_rd_data,
    output [ 2:0] sim_rd_cap,
    output [ 3:0] sim_rd_qos,
    input  [ 1:0] sim_rd_resp,
    input  [31:0] reg_addr,
    input         reg_wr,
    input         reg_rd,
    input  [31:0] reg_din,
    output [31:0] reg_dout
);
    localparam AFI_BASECTRL= 32'hf8008000+ (HP_PORT << 12);
    localparam AFI_RDCHAN_CTRL= AFI_BASECTRL + 'h00;
    localparam AFI_RDCHAN_ISSUINGCAP= AFI_BASECTRL + 'h4;
    localparam AFI_RDQOS= AFI_BASECTRL + 'h8;
    localparam AFI_RDDATAFIFO_LEVEL= AFI_BASECTRL + 'hc;
    localparam AFI_RDDEBUG= AFI_BASECTRL + 'h10; // SuppressThisWarning VEditor - not yet used


    localparam VALID_ARLOCK =  2'b0; // TODO
    localparam VALID_ARCACHE = 4'b0011; //
    localparam VALID_ARPROT =  3'b000;
    localparam VALID_ARLOCK_MASK =  2'b11; // TODO
    localparam VALID_ARCACHE_MASK = 4'b0011; //
    localparam VALID_ARPROT_MASK =  3'b010;

    assign aresetn= ~rst; // probably not needed at all - docs say "do not use"

    reg         rdQosHeadOfCmdQEn =   0;
    reg         rdFabricOutCmdEn =    0;
    reg         rdFabricQosEn =       0;
    reg         rd32BitEn =           0; // verify it i 0
    reg   [2:0] rdIssueCap1 =         0;
    reg   [2:0] rdIssueCap0 =         7;
    reg   [3:0] rdStaticQos =         0;
    
    wire  [3:0] rd_qos_in;
    wire  [3:0] rd_qos_out;
/*    
    wire        aw_nempty;
    wire        w_nempty;
    wire        enough_data; // enough data to start a new burst
    wire [11:3] next_wr_address; // bits that are incrtemented in 64-bit mode (higher are kept according to AXI 4KB inc. limit)
    reg  [31:0] write_address;
    wire        fifo_wd_rd; // read data fifo
    wire        last_confirmed_write;
*/

    wire  [5:0] arid_out; // verify it matches wid_out when outputting data
    wire  [1:0] arburst_out;
    wire  [1:0] arsize_out; // verify it is 3'h3
    wire  [3:0] arlen_out;
    wire [31:0] araddr_out;
    wire        ar_nempty;
    wire        r_nempty;
    reg   [7:0] fifo_with_requested=0; // fill level of data FIFO if all the requested data will arrive and nothing read
    wire        fifo_data_rd;
    wire  [7:0] next_with_requested;
    wire        start_read_burst_w;
    reg         was_data_fifo_read; // previos cycle was reading data from FIFO
    reg         was_data_fifo_write;// previos cycle was writing data to FIFO
    reg         was_addr_fifo_write; // previos cycle was writing addressto FIFO

    wire        read_in_progress_w; // should go inactive last confirmed upstream cycle
    reg         read_in_progress;
    reg   [3:0] read_left;
    reg   [1:0] rburst;
    reg   [3:0] rlen;
    wire [11:3] next_rd_address; // bits that are incrtemented in 64-bit mode (higher are kept according to AXI 4KB inc. limit)
    reg  [31:0] read_address;
    
    wire        last_confirmed_read;
    wire        last_read;
    
    
//    sim_rd_address = 
    assign sim_rd_qos = (rdQosHeadOfCmdQEn && (rd_qos_in > rd_qos_out))? rd_qos_in : rd_qos_out;
    assign sim_rd_cap = (rdFabricOutCmdEn && rdissuecap1en) ? rdIssueCap1 : rdIssueCap0;
    assign rd_qos_in =  rdFabricQosEn?(arqos & {4{arvalid}}) : rdStaticQos;
 //awqos & {4{awvalid}}   
    assign aresetn= ~rst; // probably not needed at all - docs say "do not use"
    //Supported control register fields
    assign reg_dout=(reg_rd && (reg_addr==AFI_RDDATAFIFO_LEVEL))?
                          {24'b0,rcount}:
                    (   (reg_rd && (reg_addr==AFI_RDCHAN_CTRL))?
                          {28'b0,rdQosHeadOfCmdQEn,rdFabricOutCmdEn,rdFabricQosEn,rd32BitEn}:
                     (  (reg_rd && (reg_addr==AFI_RDCHAN_ISSUINGCAP))?
                          {25'b0,rdIssueCap1,1'b0,rdIssueCap0}:
                      ( (reg_rd && (reg_addr==AFI_RDQOS))?
                          {28'b0,rdStaticQos}:32'bz)));

    always @ (posedge aclk or posedge rst) begin
        if (rst) begin
            rdQosHeadOfCmdQEn  <= 0;
            rdFabricOutCmdEn   <= 0;
            rdFabricQosEn      <= 1;
            rd32BitEn        <= 0;
        end else if (reg_wr && (reg_addr==AFI_RDCHAN_CTRL)) begin
            rdQosHeadOfCmdQEn  <= reg_din[3];
            rdFabricOutCmdEn   <= reg_din[2];
            rdFabricQosEn      <= reg_din[1];
            rd32BitEn        <= reg_din[0];
        end
        if (rst) begin
            rdIssueCap1  <= 0;
            rdIssueCap0  <= 7;
        end else if (reg_wr && (reg_addr==AFI_RDCHAN_ISSUINGCAP)) begin
            rdIssueCap1  <= reg_din[6:4];
            rdIssueCap0  <= reg_din[2:0];
        end
        if (rst) begin
            rdStaticQos  <= 0;
        end else if (reg_wr && (reg_addr==AFI_RDQOS)) begin
            rdStaticQos  <= reg_din[3:0];
        end
    end

    assign fifo_data_rd = rvalid && rready;
    assign next_with_requested= fifo_with_requested + {4'b0,arlen_out[3:0]} + {7'h0,~fifo_data_rd};
    assign start_read_burst_w= ar_nempty && (next_with_requested <= 8'h80) &&
                               (! read_in_progress || last_confirmed_read);
    assign read_in_progress_w= ar_nempty && (next_with_requested <= 8'h80) ||
                               (read_in_progress && !last_confirmed_read); 
//    assign rvalid= (|rcount[7:1]) ||  (rcount[0] && !was_data_fifo_read);
    assign rvalid= r_nempty && ((|rcount[7:1]) ||  !was_data_fifo_read);
    assign arready= !racount[2] && (!racount[1] || !racount[0] || !was_addr_fifo_write);
    assign last_read = (read_left==0);
    assign last_confirmed_read = (read_left==0) && sim_rd_valid && sim_rd_ready;
    // AXI: Bursts should not cross 4KB boundaries (... and to limit size of the address incrementer)
    // in 64 bit mode - low 3 bits are preserved, next 9 are incremented        
    assign      next_rd_address[11:3] =
      rburst[1]?
        (rburst[0]? {9'bx}:((read_address[11:3] + 1) & {5'h1f, ~rlen[3:0]})):
        (rburst[0]? (read_address[11:3]+1):(read_address[11:3]));
    assign sim_rd_address = read_address; 
    assign sim_rid =        arid_out;
    // Current model policy is not to initiate a new burst (read from simulation port) if it may overflow FIFO
    // - maybe the real module is done this way to aggregate external accesses.
    // So 'assign sim_rd_ready =   read_in_progress;' should be sufficient, but if that will chnage - below is 
    // full vesion that does not depend on the assumption.
    assign sim_rd_ready =   read_in_progress &&
           !rcount[7] && (!(&rcount[6:0]) || !was_data_fifo_write);
    
    always @ (posedge  aclk) begin
        if (start_read_burst_w) begin
            if (arsize_out != 2'h3) begin
                $display ("%m: at time %t ERROR: arsize_out=%h, currently only 'h3 (8 bytes) is valid",$time,arsize_out);
                $stop;
            end
        end
        if (arvalid && arready) begin
            if (((arlock ^ VALID_ARLOCK) & VALID_ARLOCK_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arlock = %h, valid %h with mask %h",$time, arlock, VALID_ARLOCK, VALID_ARLOCK_MASK);
                $stop;
            end
            if (((arcache ^ VALID_ARCACHE) & VALID_ARCACHE_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arcache = %h, valid %h with mask %h",$time, arcache, VALID_ARCACHE, VALID_ARCACHE_MASK);
                $stop;
            end
            if (((arprot ^ VALID_ARPROT) & VALID_ARPROT_MASK) != 0) begin
                $display ("%m: at time %t ERROR: arprot = %h, valid %h with mask %h",$time, arprot, VALID_ARPROT, VALID_ARPROT_MASK);
                $stop;
            end
        end
    end
    
    always @ (posedge aclk or posedge rst) begin
        if (rst)                     fifo_with_requested <= 0;
        else if (start_read_burst_w) fifo_with_requested <= next_with_requested;
        else                         fifo_with_requested <= fifo_with_requested - {7'h0,fifo_data_rd};
        
        if (rst)  was_data_fifo_read <= 0;
        else      was_data_fifo_read <= rvalid && rready;
        
        if (rst)  was_addr_fifo_write <= 0;
        else      was_addr_fifo_write <= arvalid && arready;

        if (rst)  was_data_fifo_write <= 0;
        else      was_data_fifo_write <= sim_rd_valid && sim_rd_ready;
        

        if   (rst)                   rburst[1:0] <= 0;
        else if (start_read_burst_w) rburst[1:0] <= arburst_out[1:0];

        if   (rst)                   rlen[3:0] <= 0;
        else if (start_read_burst_w) rlen[3:0] <=   arlen_out[3:0];

        if   (rst) read_in_progress <= 0;
        else       read_in_progress <= read_in_progress_w;
        
        if   (rst) read_left <= 0;
        else if (start_read_burst_w)           read_left <= arlen_out[3:0]; // precedence over inc
        else if (sim_rd_valid && sim_rd_ready) read_left <= read_left-1; //SuppressThisWarning ISExst Result of 32-bit expression is truncated to fit in 4-bit target.
                
        if   (rst)                             read_address <= 32'bx;
        else if (start_read_burst_w)           read_address <= araddr_out; // precedence over inc
        else if (sim_rd_valid && sim_rd_ready) read_address <= {read_address[31:12],next_rd_address[11:3],read_address[2:0]};
        
        
    end


fifo_same_clock_fill   #( .DATA_WIDTH(50),.DATA_DEPTH(2)) // read - 4, write - 32?
    raddr_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (arvalid && arready),
        .re           (start_read_burst_w),
        .data_in      ({arid[5:0],     arburst[1:0],    arsize[1:0],    arlen[3:0],    araddr[31:0],     rd_qos_in[3:0]}),
        .data_out     ({arid_out[5:0], arburst_out[1:0],arsize_out[1:0],arlen_out[3:0],araddr_out[31:0], rd_qos_out[3:0]}),
        .nempty       (ar_nempty),
        .half_full    (), //aw_half_full),
        .under        (), //waddr_under),  // output reg 
        .over         (), //waddr_over),   // output reg
        .wcount       (), //waddr_wcount), // output[3:0] reg 
        .rcount       (), //waddr_rcount), // output[3:0] reg 
        .wnum_in_fifo (racount),           // output[3:0] 
        .rnum_in_fifo ()                   // output[3:0] 
    );

fifo_same_clock_fill   #( .DATA_WIDTH(73),.DATA_DEPTH(7)) // read - 4, write - 32?
    rdata_i (
        .rst          (rst),
        .clk          (aclk),
        .sync_rst     (1'b0),
        .we           (sim_rd_valid && sim_rd_ready),
        .re           (rvalid && rready),
        .data_in      ({last_read, arid_out[5:0],  sim_rd_resp[1:0],  sim_rd_data[63:0]}),
        .data_out     ({rlast,     rid[5:0],       rresp[1:0],        rdata[63:0]}),
        .nempty       (r_nempty), //r_nempty),
        .half_full    (), //aw_half_full),
        .under        (), //waddr_under), 
        .over         (), //waddr_over), 
        .wcount       (), //waddr_wcount), 
        .rcount       (), //waddr_rcount), 
        .wnum_in_fifo (), 
        .rnum_in_fifo (rcount) 
    );



endmodule


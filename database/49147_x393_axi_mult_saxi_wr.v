// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>mult_saxi_wr
 * @file mult_saxi_wr.v
 * @date 2015-07-08  
 * @author Andrey Filippov     
 *
 * @brief send data from up to 4 sources to the system memory over S_AXI.
 * Each source should have a 32-bit wide buffer running at the same clock (mclk).
 * Buffer should contain at least burst size (4,8,16,32,64 bytes)
 * Burst size parameter-configurable (per-port) 
 *
 * @copyright Copyright (c) 2015 Elphel, Inc .
 *
 * <b>License:</b>
 *
 * mult_saxi_wr.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 *  mult_saxi_wr.v is distributed in the hope that it will be useful,
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

module  mult_saxi_wr #(
    parameter MULT_SAXI_ADDR =           'h730,  // ..'h737
    parameter MULT_SAXI_IRQLEN_ADDR =    'h738,  // ..'h73b
    parameter MULT_SAXI_CNTRL_ADDR =     'h73c,  // ..'h73e
    parameter MULT_SAXI_CNTRL_MODE =     'h0,  // 'h73c offset for mode register
    parameter MULT_SAXI_CNTRL_STATUS =   'h1,  // 'h73d offset for status control register
    parameter MULT_SAXI_CNTRL_IRQ =      'h2,  // 'h73e offset for IRQ control register (4 dibits): 0 - nop, 1 reset, 2 - disable, 3 - enable
    parameter MULT_SAXI_POINTERS_REG =   'h34,   //..'h37 uses 4 consecutive locations
    parameter MULT_SAXI_STATUS_REG =     'h3c,   //status and IRQ requests and masks
    parameter MULT_SAXI_HALF_BRAM =       1,     // 0 - use full 36Kb BRAM for the buffer, 1 - use just half
    parameter MULT_SAXI_BSLOG0 =          4,     // number of bits to represent burst size (4 - b.s. = 16, 0 - b.s = 1)
    parameter MULT_SAXI_BSLOG1 =          4,
    parameter MULT_SAXI_BSLOG2 =          4,
    parameter MULT_SAXI_BSLOG3 =          4,
    parameter MULT_SAXI_MASK =           'h7f8,  // 4 address/length pairs. In bytes, but lower bits are set to 0?
    parameter MULT_SAXI_IRQLEN_MASK =    'h7fc,  // number of address bits to change for interrupt - 4 locations
    parameter MULT_SAXI_CNTRL_MASK =     'h7fc,  // mode, status, irq - 3 locations
    parameter MULT_SAXI_AWCACHE =         4'h3, //..7 cache mode (4 bits, default 4'h3)
    parameter MULT_SAXI_ADV_WR =          4, // number of clock cycles before end of write to genearte adv_wr_done
    parameter MULT_SAXI_ADV_RD =          3 // number of clock cycles before end of write to genearte adv_wr_done
    
) (
//    input                      rst,           // global reset
    input                      mclk,          // system clock
    input                      aclk,          // global clock to run s_axi (@150MHz?)
    input                      mrst,          // @mclk sync reset
    input                      arst,          // @aclk sync reset
    // command interface
    input                [7:0] cmd_ad,        // byte-serial command address/data (up to 6 bytes: AL-AH-D0-D1-D2-D3 
    input                      cmd_stb,       // strobe (with first byte) for the command a/d
    output               [7:0] status_ad,     // status address/data - up to 5 bytes: A - {seq,status[1:0]} - status[2:9] - status[10:17] - status[18:25]
    output                     status_rq,     // input request to send status downstream
    input                      status_start,  // Acknowledge of the first status packet byte (address)

    output                     en_chn0,       // @mclk enable channel 0 input FIFO ( 0 - reset)
    input                      has_burst0,    // channel has at least 1 burst (should go down immediately after read_burst0 if no more data)
    output                     read_burst0,   // request to read a burst of data from channel 0
    input               [31:0] data_in_chn0,  // data read from channel 0 (with some latency)
    input                      pre_valid_chn0,// data valid (same latency)
    
    output                     en_chn1,       // @mclk enable channel 1 input FIFO ( 0 - reset)
    input                      has_burst1,    // channel has at least 1 burst (should go down immediately after read_burst0 if no more data)
    output                     read_burst1,   // request to read a burst of data from channel 0
    input               [31:0] data_in_chn1,  // data read from channel 0 (with some latency)
    input                      pre_valid_chn1,// data valid (same latency)
    
    output                     en_chn2,       // @mclk enable channel 2 input FIFO ( 0 - reset)
    input                      has_burst2,    // channel has at least 1 burst (should go down immediately after read_burst0 if no more data)
    output                     read_burst2,   // request to read a burst of data from channel 0
    input               [31:0] data_in_chn2,  // data read from channel 0 (with some latency)
    input                      pre_valid_chn2,// data valid (same latency)
    
    output                     en_chn3,       // @mclk enable channel 3 input FIFO ( 0 - reset)
    input                      has_burst3,    // channel has at least 1 burst (should go down immediately after read_burst0 if no more data)
    output                     read_burst3,   // request to read a burst of data from channel 0
    input               [31:0] data_in_chn3,  // data read from channel 0 (with some latency)
    input                      pre_valid_chn3,// data valid (same latency)
    
    output               [3:0] irq,           // per channel IRQ (generated after each 2^n DWORDS are transferred)

    // S_AXI inerface w/o read channel
    // write address    
    output              [31:0] saxi_awaddr,            // AXI PS Slave GP0 AWADDR[31:0], input
    output                     saxi_awvalid,           // AXI PS Slave GP0 AWVALID, input
    input                      saxi_awready,           // AXI PS Slave GP0 AWREADY, output
    output               [5:0] saxi_awid,              // AXI PS Slave GP0 AWID[5:0], input
    output               [1:0] saxi_awlock,            // AXI PS Slave GP0 AWLOCK[1:0], input
    output              [ 3:0] saxi_awcache,           // AXI PS Slave GP0 AWCACHE[3:0], input
    output              [ 2:0] saxi_awprot,            // AXI PS Slave GP0 AWPROT[2:0], input
    output              [ 3:0] saxi_awlen,             // AXI PS Slave GP0 AWLEN[3:0], input
    output              [ 1:0] saxi_awsize,            // AXI PS Slave GP0 AWSIZE[1:0], input
    output              [ 1:0] saxi_awburst,           // AXI PS Slave GP0 AWBURST[1:0], input
    output              [ 3:0] saxi_awqos,             // AXI PS Slave GP0 AWQOS[3:0], input
    // write data
    output              [31:0] saxi_wdata,             // AXI PS Slave GP0 WDATA[31:0], input
    output                     saxi_wvalid,            // AXI PS Slave GP0 WVALID, input
    input                      saxi_wready,            // AXI PS Slave GP0 WREADY, output
    output              [ 5:0] saxi_wid,               // AXI PS Slave GP0 WID[5:0], input
    output                     saxi_wlast,             // AXI PS Slave GP0 WLAST, input
    output              [ 3:0] saxi_wstrb,             // AXI PS Slave GP0 WSTRB[3:0], input
    // write response Not used - may add guaranteed address (as for the histogram)?
    input                      saxi_bvalid,            // AXI PS Slave GP0 BVALID, output   // @SuppressThisWarning VEditor unused
    output                     saxi_bready,            // AXI PS Slave GP0 BREADY, input 
    input               [ 5:0] saxi_bid,               // AXI PS Slave GP0 BID[5:0], output //TODO:  Update range !!!  // @SuppressThisWarning VEditor unused
    input               [ 1:0] saxi_bresp              // AXI PS Slave GP0 BRESP[1:0], output    // @SuppressThisWarning VEditor unused
);
//    parameter MULT_SAXI_BSLOG0 =          4,     // number of bits to represent burst size (4 - b.s. = 16, 0 - b.s = 1)

//    localparam BURSTS_CAP0= (MULT_SAXI_HALF_BRAM ? 'h400 : 'h800 ) / MULT_SAXI_BURST0 / 4;
    localparam BRAM_A_WDTH = MULT_SAXI_HALF_BRAM?9:10;
    localparam CHN_A_WDTH = BRAM_A_WDTH - 2;
    
    wire                 [3:0] en_chn_mclk;
    wire                 [3:0] run_chn_mclk;
    reg                  [7:0] mode_reg;
    wire                       en_mclk= |en_chn_mclk; // at least one channel enabled
    reg                  [3:0] en_chn_aclk;
    wire                       en_aclk= |en_chn_aclk; // at least one channel enabled
    wire                 [3:0] rq_wr;
    wire                 [3:0] grant_wr;
    wire [4 * CHN_A_WDTH - 1:0] wa_chn;
    wire                 [3:0] adv_wr_done; // outputs grant_wr for short bursts, or several clocks before end of wr
    wire                 [3:0] rq_out_chn;
    wire [4 * CHN_A_WDTH - 1:0] ra_chn;
    wire                 [3:0] pre_re;
    
    reg                        en_we_arb; // @mclk  should be reset by we_grant
    wire                       we_grant;  // @mclk
    wire                 [1:0] we_cur_chn; // @mclk
    wire               [127:0] data_in;
    wire                 [3:0] pre_valid;
    reg                  [3:0] valid;
    reg      [BRAM_A_WDTH-1:0] buf_wa; // multiplexed buffer write address
    reg                 [31:0] buf_wd; // multiplexed buffer write data
    reg                        buf_we; // multiplexed buffer write enable

    wire                 [3:0] grant_rd;
    wire                       grant_rd_any;
    wire                       en_out_arb;
    wire                 [1:0] re_cur_chn;

    reg      [BRAM_A_WDTH-1:0] buf_ra; // multiplexed buffer write address
    wire                [31:0] inter_buf_data; // multiplexed buffer write data
    reg                  [2:0] buf_re; // multiplexed buffer write enable
    
    wire                       fifo_half_full; // output FIFO  saxi_wdata is half full (stop writing to)
    wire                       fifo_nempty; // output FIFO  saxi_wdata is not empty (can read)
    wire                 [3:0] wdata_busy_chn; // output data busy (ends early to start next arbitration)
    wire                 [3:0] first_re; // reading first word in a burst from the buffer
    wire                 [3:0] last_re; // reading first word in a burst from the buffer
    
    wire                 [3:0] cmd_a; 
    wire                [31:0] cmd_data;
     
    wire                       we_ctrl;
    wire                       cmd_we_sa_len;
    wire                       irq_log_we;  // write number of address bits to change to generate interrupt
    wire                 [3:0] irqs_src;    // IRQ pulses to be used for IRQ generation
    reg                  [3:0] irq_r = 0;   // IRQ request (before mask)
    reg                  [3:0] irq_m = 0;   // IRQ enable
    wire                       irq_we;
    
    assign irq = irq_r & irq_m;
    assign                     saxi_bready=1'b1;
    
    assign {en_chn3, en_chn2, en_chn1, en_chn0} = en_chn_mclk; 

    assign {read_burst3, read_burst2, read_burst1, read_burst0} = grant_wr; // single clock pulse
    assign data_in = {data_in_chn3, data_in_chn2, data_in_chn1, data_in_chn0};
    assign pre_valid = {pre_valid_chn3, pre_valid_chn2, pre_valid_chn1, pre_valid_chn0};
    
    assign en_chn_mclk =  mode_reg[3:0];
    assign run_chn_mclk = mode_reg[7:4];
    assign irq_we = we_ctrl && (cmd_a[1:0] == MULT_SAXI_CNTRL_IRQ);
    
    always @ (posedge mclk) begin
        if      (mrst)                                            mode_reg <= 0;
        else if (we_ctrl && (cmd_a[1:0] == MULT_SAXI_CNTRL_MODE)) mode_reg <= cmd_data[7:0];
/*       
        if (mrst) irq_r <= 0;
        else      irq_r <= irqs_src | (irq_r & (irq_we?{cmd_data[7:6] != 1,
                                                        cmd_data[5:4] != 1,
                                                        cmd_data[3:2] != 1,
                                                        cmd_data[1:0] != 1}:4'hf));
*/                                                        
    end
    
    generate
        genvar i;
        for (i=0; i<4; i=i+1) begin: irq_ctrl_block
            always @ (posedge mclk) begin
                if      (mrst)                      irq_m[i] <= 0;
                else if (irq_we && cmd_data[2*i+1]) irq_m[i] <= cmd_data[2*i];
                
                if      (mrst)                                irq_r[i] <= 0;
                else if (irqs_src[i])                         irq_r[i] <= 1;
                else if (irq_we && (cmd_data[2*i +: 2] == 1)) irq_r[i] <= 0;
                
            end
        end
    endgenerate                                                
    

// Arbiter requests on copying from one of the input channels to the internal buffer

    mult_saxi_wr_chn #(
        .MULT_SAXI_HALF_BRAM (MULT_SAXI_HALF_BRAM),
        .MULT_SAXI_BSLOG     (MULT_SAXI_BSLOG0),
        .MULT_SAXI_ADV_WR    (MULT_SAXI_ADV_WR),
        .MULT_SAXI_ADV_RD    (MULT_SAXI_ADV_RD)
        
    ) mult_saxi_wr_sub0_i (
        .mclk          (mclk),             // input
        .aclk          (aclk),             // input
        .en            (en_chn_mclk[0]),   // input
        .has_burst     (has_burst0),       // input
        .valid         (valid[0]),         // input
        .rq_wr         (rq_wr[0]),         // output
        .grant_wr      (grant_wr[0]),      // input
        .wa            (wa_chn[0 * CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0]
        .adv_wr_done   (adv_wr_done[0]),   // output
        .rq_out        (rq_out_chn[0]),    // output reg 
        .grant_out     (grant_rd[0]),      // input
        .fifo_half_full(fifo_half_full),   // input
        .ra            (ra_chn[0* CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .pre_re        (pre_re[0]),        // output
        .first_re      (first_re[0]),      // output reg // 1 clock later than pre_re
        .last_re       (last_re[0]),       // output reg // 1 clock later than pre_re
        .wdata_busy    (wdata_busy_chn[0]) // output reg 
    );

    mult_saxi_wr_chn #(
        .MULT_SAXI_HALF_BRAM (MULT_SAXI_HALF_BRAM),
        .MULT_SAXI_BSLOG     (MULT_SAXI_BSLOG1),
        .MULT_SAXI_ADV_WR    (MULT_SAXI_ADV_WR),
        .MULT_SAXI_ADV_RD    (MULT_SAXI_ADV_RD)
    ) mult_saxi_wr_sub1_i (
        .mclk          (mclk),             // input
        .aclk          (aclk),             // input
        .en            (en_chn_mclk[1]),   // input
        .has_burst     (has_burst1),       // input
        .valid         (valid[1]),         // input
        .rq_wr         (rq_wr[1]),         // output
        .grant_wr      (grant_wr[1]),      // input
        .wa            (wa_chn[1 * CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .adv_wr_done   (adv_wr_done[1]),   // output
        .rq_out        (rq_out_chn[1]),    // output reg 
        .grant_out     (grant_rd[1]),      // input
        .fifo_half_full(fifo_half_full),   // input
        .ra            (ra_chn[1* CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .pre_re        (pre_re[1]),        // output
        .first_re      (first_re[1]),      // output reg // 1 clock later than pre_re
        .last_re       (last_re[1]),       // output reg // 1 clock later than pre_re
        .wdata_busy    (wdata_busy_chn[1]) // output reg 
    );

    mult_saxi_wr_chn #(
        .MULT_SAXI_HALF_BRAM (MULT_SAXI_HALF_BRAM),
        .MULT_SAXI_BSLOG     (MULT_SAXI_BSLOG2),
        .MULT_SAXI_ADV_WR    (MULT_SAXI_ADV_WR),
        .MULT_SAXI_ADV_RD    (MULT_SAXI_ADV_RD)
    ) mult_saxi_wr_sub2_i (
        .mclk          (mclk),             // input
        .aclk          (aclk),             // input
        .en            (en_chn_mclk[2]),   // input
        .has_burst     (has_burst2),       // input
        .valid         (valid[2]),         // input
        .rq_wr         (rq_wr[2]),         // output
        .grant_wr      (grant_wr[2]),      // input
        .wa            (wa_chn[2 * CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .adv_wr_done   (adv_wr_done[2]),   // output
        .rq_out        (rq_out_chn[2]),    // output reg 
        .grant_out     (grant_rd[2]),      // input
        .fifo_half_full(fifo_half_full),   // input
        .ra            (ra_chn[2* CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .pre_re        (pre_re[2]),        // output
        .first_re      (first_re[2]),      // output reg // 1 clock later than pre_re
        .last_re       (last_re[2]),       // output reg // 1 clock later than pre_re
        .wdata_busy    (wdata_busy_chn[2]) // output reg 
    );

    mult_saxi_wr_chn #(
        .MULT_SAXI_HALF_BRAM (MULT_SAXI_HALF_BRAM),
        .MULT_SAXI_BSLOG     (MULT_SAXI_BSLOG3),
        .MULT_SAXI_ADV_WR    (MULT_SAXI_ADV_WR),
        .MULT_SAXI_ADV_RD    (MULT_SAXI_ADV_RD)
    ) mult_saxi_wr_sub3_i (
        .mclk          (mclk),             // input
        .aclk          (aclk),             // input
        .en            (en_chn_mclk[3]),   // input
        .has_burst     (has_burst3),       // input
        .valid         (valid[3]),         // input
        .rq_wr         (rq_wr[3]),         // output
        .grant_wr      (grant_wr[3]),      // input
        .wa            (wa_chn[3 * CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .adv_wr_done   (adv_wr_done[3]),   // output
        .rq_out        (rq_out_chn[3]),    // output reg 
        .grant_out     (grant_rd[3]),      // input
        .fifo_half_full(fifo_half_full),   // input
        .ra            (ra_chn[3* CHN_A_WDTH +: CHN_A_WDTH]),        // output[7:0] 
        .pre_re        (pre_re[3]),        // output
        .first_re      (first_re[3]),      // output reg // 1 clock later than pre_re
        .last_re       (last_re[3]),       // output reg // 1 clock later than pre_re
        .wdata_busy    (wdata_busy_chn[3]) // output reg 
    );


    round_robin #(
        .FIXED_PRIORITY (0),  // 0 - round-robin, 1 - fixed channel priority (0 - highest)
        .BITS           (2)  // number of bits to encode channel number (1 << BITS) - number of inputs
    ) round_robin_mclk_i (
        .clk            (mclk),                 // input
        .srst           (!en_mclk),             // input sync. reset - needed to reset current channel output
        .rq             (rq_wr & run_chn_mclk), // input[3:0] 
        .en             (en_we_arb),            // input enable to grant highest priority request (should be reset by grant out)
        .grant          (we_grant),             // output stays on until reset by !en
        .chn            (we_cur_chn),           // output[1:0] 
        .grant_chn      (grant_wr)              // output[3:0] 1-hot grant output per-channel, single-clock pulse
    );

// multiplex channel data to a common buffer
    wire      pre_pre_buf_we;
    reg       pre_buf_we;
    reg [1:0] chn_wr;
    assign pre_pre_buf_we = pre_valid[we_cur_chn];
    always @ (posedge mclk) begin
        // Use advanced 'valid' signal (from the input channel external buffers) to copy we_cur_chn
        // to chn_wr - that allows to start arbitration (that will result in modification of the we_cur_chn)
        // early, before write operation to the buffer (using channel for multiplexing and address MSB)
        // is finished.
        valid <= pre_valid;
        pre_buf_we <= pre_pre_buf_we;
        buf_we <= pre_buf_we; // valid[we_cur_chn];
        if (pre_pre_buf_we &&  !pre_buf_we) chn_wr <= we_cur_chn; // to re-start arbitration early
        
        // multiplex address and data
        buf_wa <= {chn_wr, wa_chn[chn_wr * CHN_A_WDTH +: CHN_A_WDTH]};
        buf_wd <= data_in[chn_wr* 32 +: 32];
        // early re-enable arbitration (en_we_arb)
        if (!en_mclk || adv_wr_done[chn_wr]) en_we_arb <= 1;
        else if (we_grant)                   en_we_arb <= 0; 
 //       else if
    end

// Buffer output to S_AXI (will need a smaller FIFO 
    reg  [1:0] chn_rd;
    reg  [1:0] chn_rd_data;        // channel valid with read data
    reg        pre_first_rd_valid; // first inter_buf_data in a burst will be valid next cycle
    reg  [1:0] is_last_rd;         // [1] accompanies last  inter_buf_data in a burst (to generate wlast)
    wire [1:0] chn_fifo_out;       // channel number out from fifo (for wid)
//    wire       is_last_fifo_out;   // last data word out from fifo (for wlast)
    
    always @ (posedge aclk) begin
        en_chn_aclk <=en_chn_mclk;
        chn_rd <= re_cur_chn; // delay by 1 clock (to increase overlap)
        buf_ra <= {chn_rd, ra_chn[chn_rd* CHN_A_WDTH +: CHN_A_WDTH]};
        buf_re <= {buf_re[1:0], pre_re[chn_rd]};
        pre_first_rd_valid <= first_re[chn_rd];
        is_last_rd <= {is_last_rd[0], last_re[chn_rd]};
        if (pre_first_rd_valid) chn_rd_data <= chn_rd; // extend to later time to use as wid with overlapping requests
        // in parallel - read channel parameters (address, length, pointer)
        
        
        
    end

    round_robin #(
        .FIXED_PRIORITY (0),  // 0 - round-robin, 1 - fixed channel priority (0 - highest)
        .BITS           (2)  // number of bits to encode channel number (1 << BITS) - number of inputs
    ) round_robin_aclk_i (
        .clk            (aclk),            // input
        .srst           (!en_aclk),        // input sync. reset - needed to reset current channel output
        .rq             (rq_out_chn),       // input[3:0] 
        .en             (en_out_arb),       // input enable to grant highest priority request (should be reset by grant out)
        .grant          (grant_rd_any),     // output stays on until reset by !en
        .chn            (re_cur_chn),       // output[1:0] 
        .grant_chn      (grant_rd)          // output[3:0] 1-hot grant output per-channel, single-clock pulse
    );

// Process address, length and current pointers (all in 32-bit words). Pointers are updated once per burst (parameter defined per each channel)
    wire        axi_ptr_busy; // 
    wire [29:0] axi_addr; // 
    wire [ 3:0] axi_len;
    assign saxi_awaddr = {axi_addr,2'b0};
    assign saxi_awlen = axi_len;
    
    assign saxi_awlock=  2'h0;               // AXI PS Slave GP0 AWLOCK[1:0], input
    assign saxi_awcache= MULT_SAXI_AWCACHE;  // awcache_mode; // 4'h3;          // AXI PS Slave GP0 AWCACHE[3:0], input
    assign saxi_awprot=  3'h0;               // AXI PS Slave GP0 AWPROT[2:0], input
    assign saxi_awsize=  2'h2;               // 4 bytes; AXI PS Slave GP0 AWSIZE[1:0], input
    assign saxi_awburst= 2'h1;               // Increment address bursts AXI PS Slave GP0 AWBURST[1:0], input
    assign saxi_awqos=   4'h0;               // AXI PS Slave GP0 AWQOS[3:0], input
    
    
    
    wire [29:0] pntr_wd; // @aclk, re-clock and write to status
    wire  [1:0] pntr_wa; 
    wire        pntr_we;
    
    mult_saxi_wr_pointers #(
        .MULT_SAXI_BSLOG0   (MULT_SAXI_BSLOG0),
        .MULT_SAXI_BSLOG1   (MULT_SAXI_BSLOG1),
        .MULT_SAXI_BSLOG2   (MULT_SAXI_BSLOG2),
        .MULT_SAXI_BSLOG3   (MULT_SAXI_BSLOG3)
    ) mult_saxi_wr_pointers_i (
        .mclk         (mclk),           // input
        .mrst         (mrst),           // input
        .aclk         (aclk),           // input
        .arst         (arst),           // input
        .chn_en_mclk  (en_chn_mclk),    // input[3:0] 
        .sa_len_di    (cmd_data[29:0]), // input[29:0] 
        .sa_len_wa    (cmd_a[2:0]),     // input[2:0] 
        .sa_len_we    (cmd_we_sa_len),  // input
        .irq_log_we   (irq_log_we),     // input
        .chn          (re_cur_chn),     // input[1:0] 
        .start        (grant_rd_any),   // input make sure 1 cycle
        .busy         (axi_ptr_busy),   // output OR this busy with write data channel busy for en_out_arb
        .axi_addr     (axi_addr),       // output[29:0] reg valid 2 cycles after start of grant_rd_any
        .axi_len      (axi_len),        // output[3:0] reg 
        .pntr_wd      (pntr_wd),        // output[29:0] 
        .pntr_wa      (pntr_wa),        // output[1:0] 
        .pntr_we      (pntr_we),        // output
        .irqs         (irqs_src)        // output[3:0] 
        
    );

    // interface axi_aw channel
    reg         awvalid; //
    reg   [2:0] aw_seq;
//    wire        aw_busy; // use to control en_out_arb = !(aw_busy || <data_channel_busy>);
    reg   [1:0] chn_out;
    always @ (posedge aclk) begin
        if (!en_aclk) aw_seq <= 0;
        else          aw_seq <= {aw_seq[1:0], grant_rd_any};
    
        if      (!en_aclk)     awvalid <= 0;
        else if (aw_seq[0])    awvalid <= 1;
        else if (saxi_awready) awvalid <= 0;
        
        if (grant_rd_any) chn_out <= re_cur_chn;
    end 
//    assign aw_busy = axi_ptr_busy | awvalid; 
    assign saxi_awvalid = awvalid;
    assign saxi_awid = {4'b0, chn_out};
    assign en_out_arb = !(axi_ptr_busy || awvalid || (|wdata_busy_chn));
    wire      fifo_re;
    
    assign fifo_re= saxi_wvalid && saxi_wready;
//  s_axi write channel
    // Small extra FIFO to tolerate ram_var_w_var_r latency
//    assign fifo_re= saxi_wvalid && saxi_wready;
    assign saxi_wid={4'b0, chn_fifo_out};
    assign saxi_wvalid = en_aclk && fifo_nempty; 
    assign saxi_wstrb =    4'hf; // All bytes

    always @ (posedge aclk) begin
    end
    
    fifo_same_clock #(
        .DATA_WIDTH(35),
        .DATA_DEPTH(4)
    ) fifo_same_clock_i (
        .rst       (1'b0),             //   rst),  // input
        .clk       (aclk),             // input
        .sync_rst  (!en_aclk || arst), // input
        .we        (buf_re[2]),        // input
        .re        (fifo_re),          // input 
        .data_in   ({chn_rd_data,is_last_rd[1],inter_buf_data}), // input[31:0] 
        .data_out  ({chn_fifo_out,saxi_wlast, saxi_wdata}), // output[31:0] 
        .nempty    (fifo_nempty),      // output
        .half_full (fifo_half_full)   // output reg 
    );

    generate
        if (MULT_SAXI_HALF_BRAM)
            ram18_var_w_var_r #(
                .COMMENT("mult_saxi_wr_MULT_SAXI_HALF_BRAM"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(5),
                .LOG2WIDTH_RD(5),
                .DUMMY(0)
            ) ram_var_w_var_r_i (
                .rclk      (aclk), // input
                .raddr     (buf_ra[8:0]), // input[9:0] 
                .ren       (buf_re[0]), // input
                .regen     (buf_re[1]), // input
                .data_out  (inter_buf_data), // output[31:0] 
                .wclk      (mclk), // input
                .waddr     (buf_wa[8:0]), // input[9:0] 
                .we        (buf_we), // input
                .web       (4'hf), // input[7:0] 
                .data_in   (buf_wd) // input[31:0] 
            );
        else
            ram_var_w_var_r #(
                .COMMENT("mult_saxi_wr_not_MULT_SAXI_HALF_BRAM"),
                .REGISTERS(1),
                .LOG2WIDTH_WR(5),
                .LOG2WIDTH_RD(5),
                .DUMMY(0)
            ) ram_var_w_var_r_i (
                .rclk      (aclk), // input
                .raddr     ({buf_ra[BRAM_A_WDTH-1],buf_ra[8:0]}), // input[9:0] 
                .ren       (buf_re[0]), // input
                .regen     (buf_re[1]), // input
                .data_out  (inter_buf_data), // output[31:0] 
                .wclk      (mclk), // input
                .waddr     ({buf_wa[BRAM_A_WDTH-1],buf_wa[8:0]}), // input[9:0] 
                .we        (buf_we), // input
                .web       (8'hff), // input[7:0] 
                .data_in   (buf_wd) // input[31:0] 
            );
    endgenerate

    cmd_deser #(
        .ADDR        (MULT_SAXI_ADDR),
        .ADDR_MASK   (MULT_SAXI_MASK),
        .NUM_CYCLES  (6),
        .ADDR_WIDTH  (4),
        .DATA_WIDTH  (32),
        .ADDR1       (MULT_SAXI_CNTRL_ADDR),
        .ADDR_MASK1  (MULT_SAXI_CNTRL_MASK),
        .ADDR2       (MULT_SAXI_IRQLEN_ADDR),
        .ADDR_MASK2  (MULT_SAXI_IRQLEN_MASK)
    ) cmd_deser_mult_saxi_wr_i (
        .rst         (1'b0), //rst),                      // input
        .clk         (mclk),                              // input
        .srst        (mrst),                              // input
        .ad          (cmd_ad),                            // input[7:0] 
        .stb         (cmd_stb),                           // input
        .addr        (cmd_a),                             // output[3:0] 
        .data        (cmd_data),                          // output[31:0] 
        .we          ({irq_log_we,we_ctrl,cmd_we_sa_len}) // output
    );
    
    // now - converting all to parallel (TODO: use RAM for multi-word status data)
    reg   [29:0] status_pntr0;
    reg   [29:0] status_pntr1;
    reg   [29:0] status_pntr2;
    reg   [29:0] status_pntr3;
    wire         pntr_we_mclk;
//    wire [128:0] status_data;
    wire [137:0] status_data;
    reg          status_tgl;
    assign status_data = {2'b0, status_pntr3,
                          2'b0, status_pntr2,
                          2'b0, status_pntr1,
                          2'b0, status_pntr0,
                          irq_m[3:0],irq_r[3:0],
                          1'b0, status_tgl};
    always @ (posedge mclk) begin
        if      (!en_mclk)     status_tgl <= 0;
        else if (pntr_we_mclk) status_tgl <= ~status_tgl;
    
        if (pntr_we_mclk && (pntr_wa == 2'h0)) status_pntr0 <= pntr_wd;
        if (pntr_we_mclk && (pntr_wa == 2'h1)) status_pntr1 <= pntr_wd;
        if (pntr_we_mclk && (pntr_wa == 2'h2)) status_pntr2 <= pntr_wd;
        if (pntr_we_mclk && (pntr_wa == 2'h3)) status_pntr3 <= pntr_wd;
    end
    
    pulse_cross_clock status_wr_i (.rst(arst), .src_clk(aclk), .dst_clk(mclk), .in_pulse(pntr_we), .out_pulse(pntr_we_mclk),.busy());

    status_generate #(
        .STATUS_REG_ADDR   (MULT_SAXI_STATUS_REG),
        .PAYLOAD_BITS      (10),
        .REGISTER_STATUS   (1),
        .EXTRA_WORDS       (4),
        .EXTRA_REG_ADDR    (MULT_SAXI_POINTERS_REG)
    ) status_generate_i (
        .rst             (1'b0),                //rst), // input
        .clk             (mclk),                // input
        .srst            (mrst),                // input
        .we              (we_ctrl && (cmd_a[1:0] == MULT_SAXI_CNTRL_STATUS)), // input
        .wd              (cmd_data[7:0]),       // input[7:0] 
        .status          (status_data),         // input[137:0] 
        .ad              (status_ad),           // output[7:0] 
        .rq              (status_rq),           // output
        .start           (status_start)         // input
    );


endmodule


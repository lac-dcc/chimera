// This program was cloned from: https://github.com/Elphel/x393
// License: GNU General Public License v3.0

/*!
 * <b>Module:</b>sata_ahci_top
 * @file sata_ahci_top.v
 * @date  2015-07-11  
 * @author Alexey     
 *
 * @brief Top of the AHCI implementation of the host adapter
 *
 * @copyright Copyright (c) 2015 Elphel, Inc.
 *
 * <b>License:</b>
 *
 * sata_ahci_top.v is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * sata_ahci_top.v file is distributed in the hope that it will be useful,
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
/*
 * Takes commands from axi iface as a slave, transfers data with another axi iface as a master
 */
 module sata_ahci_top#(
    parameter PREFETCH_ALWAYS =       0,
//    parameter READ_REG_LATENCY =      2, // 0 if  reg_rdata is available with reg_re/reg_addr, 2 with re/regen
//    parameter READ_CT_LATENCY =       1, // 0 if  ct_rdata is available with reg_re/reg_addr, 2 with re/regen
    parameter ADDRESS_BITS =         10, // number of memory address bits - now fixed. Low half - RO/RW/RWC,RW1 (2-cycle write), 2-nd just RW (single-cycle)
`ifdef USE_DATASCOPE
    parameter DATASCOPE_START_BIT =  14, // bit of DRP "other_control" to start recording after 0->1 (needs DRP)
    parameter DATASCOPE_POST_MEAS = 256, // 16, // number of measurements to perform after event
`endif
    
    parameter HBA_RESET_BITS =        9, // duration of HBA reset in aclk periods (9: ~10usec)
    parameter RESET_TO_FIRST_ACCESS = 1, // keep port reset until first R/W any register by software
    parameter BITS_TO_START_XMIT =    6,   // wait H2D FIFO to have 1 << BITS_TO_START_XMIT to start FIS transmission (or all FIS fits)
    parameter DATA_BYTE_WIDTH =       4,
    parameter ELASTIC_DEPTH =         4, // 4, //5, With 4/7 got infrequent overflows!
    parameter ELASTIC_OFFSET =        7, //  5 //10
    parameter FREQ_METER_WIDTH =     16
 )(
    output  wire                sata_clk,
    output  wire                sata_rst,
    input   wire                arst, // extrst,
    
    // reliable clock to source drp and cpll lock det circuits
    input   wire                reliable_clk,
    
    input   wire                hclk,
    
/*
 * Commands interface
 */
    input   wire                ACLK,              // AXI PS Master GP1 Clock , input
    input   wire                ARESETN,           // AXI PS Master GP1 Reset, output // @SuppressThisWarning VEditor unused (arst instead)
// AXI PS Master GP1: Read Address    
    input   wire    [31:0]      ARADDR,            // AXI PS Master GP1 ARADDR[31:0], output  
    input   wire                ARVALID,           // AXI PS Master GP1 ARVALID, output
    output  wire                ARREADY,           // AXI PS Master GP1 ARREADY, input
    input   wire    [11:0]      ARID,              // AXI PS Master GP1 ARID[11:0], output
    input   wire    [3:0]       ARLEN,             // AXI PS Master GP1 ARLEN[3:0], output
    input   wire    [1:0]       ARSIZE,            // AXI PS Master GP1 ARSIZE[1:0], output
    input   wire    [1:0]       ARBURST,           // AXI PS Master GP1 ARBURST[1:0], output
// AXI PS Master GP1: Read Data
    output  wire    [31:0]      RDATA,             // AXI PS Master GP1 RDATA[31:0], input
    output  wire                RVALID,            // AXI PS Master GP1 RVALID, input
    input   wire                RREADY,            // AXI PS Master GP1 RREADY, output
    output  wire    [11:0]      RID,               // AXI PS Master GP1 RID[11:0], input
    output  wire                RLAST,             // AXI PS Master GP1 RLAST, input
    output  wire    [1:0]       RRESP,             // AXI PS Master GP1 RRESP[1:0], input
// AXI PS Master GP1: Write Address    
    input   wire    [31:0]      AWADDR,            // AXI PS Master GP1 AWADDR[31:0], output
    input   wire                AWVALID,           // AXI PS Master GP1 AWVALID, output
    output  wire                AWREADY,           // AXI PS Master GP1 AWREADY, input
    input   wire    [11:0]      AWID,              // AXI PS Master GP1 AWID[11:0], output
    input   wire    [3:0]       AWLEN,             // AXI PS Master GP1 AWLEN[3:0], outpu:t
    input   wire    [1:0]       AWSIZE,            // AXI PS Master GP1 AWSIZE[1:0], output
    input   wire    [1:0]       AWBURST,           // AXI PS Master GP1 AWBURST[1:0], output
// AXI PS Master GP1: Write Data
    input   wire    [31:0]      WDATA,             // AXI PS Master GP1 WDATA[31:0], output
    input   wire                WVALID,            // AXI PS Master GP1 WVALID, output
    output  wire                WREADY,            // AXI PS Master GP1 WREADY, input
    input   wire    [11:0]      WID,               // AXI PS Master GP1 WID[11:0], output
    input   wire                WLAST,             // AXI PS Master GP1 WLAST, output
    input   wire    [3:0]       WSTRB,             // AXI PS Master GP1 WSTRB[3:0], output
// AXI PS Master GP1: Write response
    output  wire                BVALID,            // AXI PS Master GP1 BVALID, input
    input   wire                BREADY,            // AXI PS Master GP1 BREADY, output
    output  wire    [11:0]      BID,               // AXI PS Master GP1 BID[11:0], input
    output  wire    [1:0]       BRESP,             // AXI PS Master GP1 BRESP[1:0], input

/*
 * Data interface
 */
    output  wire    [31:0]  afi_awaddr,
    output  wire            afi_awvalid,
    input   wire            afi_awready,
    output  wire    [5:0]   afi_awid,
    output  wire    [1:0]   afi_awlock,
    output  wire    [3:0]   afi_awcache,
    output  wire    [2:0]   afi_awprot,
    output  wire    [3:0]   afi_awlen,
    output  wire    [1:0]   afi_awsize,
    output  wire    [1:0]   afi_awburst,
    output  wire    [3:0]   afi_awqos,
    // write data
    output  wire    [63:0]  afi_wdata,
    output  wire            afi_wvalid,
    input   wire            afi_wready,
    output  wire    [5:0]   afi_wid,
    output  wire            afi_wlast,
    output  wire    [7:0]   afi_wstrb,
    // write response
    input   wire            afi_bvalid,
    output  wire            afi_bready,
    input   wire    [5:0]   afi_bid,
    input   wire    [1:0]   afi_bresp,
    // PL extra (non-AXI) signals
    input   wire    [7:0]   afi_wcount,
    input   wire    [5:0]   afi_wacount,
    output  wire            afi_wrissuecap1en,
    // AXI_HP signals - read channel
    // read address
    output  wire    [31:0]  afi_araddr,
    output  wire            afi_arvalid,
    input   wire            afi_arready,
    output  wire    [5:0]   afi_arid,
    output  wire    [1:0]   afi_arlock,
    output  wire    [3:0]   afi_arcache,
    output  wire    [2:0]   afi_arprot,
    output  wire    [3:0]   afi_arlen,
    output  wire    [1:0]   afi_arsize,
    output  wire    [1:0]   afi_arburst,
    output  wire    [3:0]   afi_arqos,
    // read data
    input   wire    [63:0]  afi_rdata,
    input   wire            afi_rvalid,
    output  wire            afi_rready,
    input   wire    [5:0]   afi_rid,
    input   wire            afi_rlast,
    input   wire    [1:0]   afi_rresp,
    // PL extra (non-AXI) signals
    input   wire    [7:0]   afi_rcount,
    input   wire    [2:0]   afi_racount,
    output  wire            afi_rdissuecap1en,

    output  wire            irq,
/*
 * PHY
 */
    output  wire            TXN,
    output  wire            TXP,
    input   wire            RXN,
    input   wire            RXP,

    input   wire            EXTCLK_P,
    input   wire            EXTCLK_N
 );

//    wire sata_clk;
//    wire sata_rst;
    
    wire hba_arst;  // @S uppressThisWarning VEditor unused
    wire port_arst; // @SuppressThisWarning VEditor unused
    wire port_arst_any;
//    wire exrst = port_arst_any; // now both hba_arst and port_arst are the same?
    wire exrst = port_arst_any || hba_arst; // now both hba_arst and port_arst are the same (only difference in fsm)
    
    
    
// Data/type FIFO, host -> device   
    // Data System memory or FIS -> device
    wire        [31:0] h2d_data;     // 32-bit data from the system memory to HBA (dma data)
    wire        [ 1:0] h2d_type;     // 0 - data, 1 - FIS head, 2 - FIS END (make FIS_Last?)
    wire               h2d_valid;    // output register full
    wire               h2d_ready;     // send FIFO has room for data (>= 8? dwords)
 
// Data/type FIFO, device -> host
    wire        [31:0] d2h_data;         // FIFO output data
    wire        [ 1:0] d2h_type;    // 0 - data, 1 - FIS head, 2 - R_OK, 3 - R_ERR
    wire               d2h_valid;  // Data available from the transport layer in FIFO                
    wire               d2h_many;    // Multiple DWORDs available from the transport layer in FIFO           
    wire               d2h_ready;   // This module or DMA consumes DWORD
    
    // communication with transport/link/phys layers
//    wire               phy_rst;      // frome phy, as a response to hba_arst || port_arst. It is deasserted when clock is stable
    wire        [ 1:0] phy_speed; // 0 - not ready, 1..3 - negotiated speed
    wire               xmit_ok;      // FIS transmission acknowledged OK
    wire               xmit_err;     // Error during sending of a FIS
    wire               syncesc_recv; // These two inputs interrupt transmit
    wire               pcmd_st_cleared; // bit was cleared by software    
    wire               syncesc_send;  // Send sync escape
    wire               syncesc_send_done; // "SYNC escape until the interface is quiescent..."
    wire               comreset_send;     // Not possible yet?
    wire               cominit_got;
    wire               set_offline; // electrically idle
    wire               x_rdy_collision; // X_RDY/X_RDY collision on interface 
    
    wire               send_R_OK;    // Should it be originated in this layer SM?
    wire               send_R_ERR;
    
    // additional errors from SATA layers (single-clock pulses):
    wire               serr_DT;   // RWC: Transport state transition error
    wire               serr_DS;   // RWC: Link sequence error
    wire               serr_DH;   // RWC: Handshake Error (i.e. Device got CRC error)
    wire               serr_DC;   // RWC: CRC error in Link layer
    wire               serr_DB;   // RWC: 10B to 8B decode error
    wire               serr_DW;   // RWC: COMMWAKE signal was detected
    wire               serr_DI;   // RWC: PHY Internal Error
                                  // sirq_PRC,
    wire               serr_EE;   // RWC: Internal error (such as elastic buffer overflow or primitive mis-alignment)
    wire               serr_EP;   // RWC: Protocol Error - a violation of SATA protocol detected
    wire               serr_EC;   // RWC: Persistent Communication or Data Integrity Error
    wire               serr_ET;   // RWC: Transient Data Integrity Error (error not recovered by the interface)
    wire               serr_EM;   // RWC: Communication between the device and host was lost but re-established
    wire               serr_EI;   // RWC: Recovered Data integrity Error
    // additional control signals for SATA layers
    wire         [3:0] sctl_ipm;          // Interface power management transitions allowed
    wire         [3:0] sctl_spd;          // Interface maximal speed
    
    reg          [2:0] nhrst_r;
    wire               hrst = !nhrst_r[2];
    wire               debug_link_send_data; // @sata clk - last symbol was data output
    wire               debug_link_dmatp;     // @clk (sata clk) - received CODE_DMATP
    
    wire [FREQ_METER_WIDTH-1:0] xclk_period;
`ifdef USE_DATASCOPE
// Datascope interface (write to memory that can be software-read)
    wire                     datascope_clk;
    wire  [ADDRESS_BITS-1:0] datascope_waddr;      
    wire                     datascope_we;
    wire              [31:0] datascope_di;
`endif    
    
`ifdef USE_DRP
    wire               drp_en;
    wire               drp_we;
    wire        [14:0] drp_addr;       
    wire        [15:0] drp_di;
    wire               drp_rdy;
    wire        [15:0] drp_do; 
`endif    
    
    
    wire        [31:0] debug_phy;
    wire        [31:0] debug_link;
    
    always @ (posedge hclk or posedge arst) begin
        if (arst) nhrst_r <= 0;
        else      nhrst_r <= (nhrst_r << 1) | 1;
    end

    
    ahci_top #(
        .PREFETCH_ALWAYS       (PREFETCH_ALWAYS),
//        .READ_REG_LATENCY      (READ_REG_LATENCY),
//        .READ_CT_LATENCY       (READ_CT_LATENCY),
        .ADDRESS_BITS          (ADDRESS_BITS),
        .HBA_RESET_BITS        (HBA_RESET_BITS),
        .RESET_TO_FIRST_ACCESS (RESET_TO_FIRST_ACCESS),
        .FREQ_METER_WIDTH      (FREQ_METER_WIDTH)
    ) ahci_top_i (
        .aclk              (ACLK),              // input
        .arst              (arst),              // input
        .mclk              (sata_clk),          // input
        .mrst              (sata_rst),          // input
        .hba_arst          (hba_arst),          // output
        .port_arst         (port_arst),         // output
        .port_arst_any     (port_arst_any),     // port0 async set by software and by arst
        
        .hclk              (hclk),              // input
        .hrst              (hrst),              // input
        
        .awaddr            (AWADDR),            // input[31:0] 
        .awvalid           (AWVALID),           // input
        .awready           (AWREADY),           // output
        .awid              (AWID),              // input[11:0] 
        .awlen             (AWLEN),             // input[3:0] 
        .awsize            (AWSIZE),            // input[1:0] 
        .awburst           (AWBURST),           // input[1:0] 
        .wdata             (WDATA),             // input[31:0] 
        .wvalid            (WVALID),            // input
        .wready            (WREADY),            // output
        .wid               (WID),               // input[11:0] 
        .wlast             (WLAST),             // input
        .wstb              (WSTRB),             // input[3:0] 
        .bvalid            (BVALID),            // output
        .bready            (BREADY),            // input
        .bid               (BID),               // output[11:0] 
        .bresp             (BRESP),             // output[1:0] 
        .araddr            (ARADDR),            // input[31:0] 
        .arvalid           (ARVALID),           // input
        .arready           (ARREADY),           // output
        .arid              (ARID),              // input[11:0] 
        .arlen             (ARLEN),             // input[3:0] 
        .arsize            (ARSIZE),            // input[1:0] 
        .arburst           (ARBURST),           // input[1:0] 
        .rdata             (RDATA),             // output[31:0] 
        .rvalid            (RVALID),            // output
        .rready            (RREADY),            // input
        .rid               (RID),               // output[11:0] 
        .rlast             (RLAST),             // output
        .rresp             (RRESP),             // output[1:0] 
        .afi_awaddr        (afi_awaddr),        // output[31:0] 
        .afi_awvalid       (afi_awvalid),       // output
        .afi_awready       (afi_awready),       // input
        .afi_awid          (afi_awid),          // output[5:0] 
        .afi_awlock        (afi_awlock),        // output[1:0] 
        .afi_awcache       (afi_awcache),       // output[3:0] 
        .afi_awprot        (afi_awprot),        // output[2:0] 
        .afi_awlen         (afi_awlen),         // output[3:0] 
        .afi_awsize        (afi_awsize),        // output[1:0] 
        .afi_awburst       (afi_awburst),       // output[1:0] 
        .afi_awqos         (afi_awqos),         // output[3:0] 
        .afi_wdata         (afi_wdata),         // output[63:0] 
        .afi_wvalid        (afi_wvalid),        // output
        .afi_wready        (afi_wready),        // input
        .afi_wid           (afi_wid),           // output[5:0] 
        .afi_wlast         (afi_wlast),         // output
        .afi_wstrb         (afi_wstrb),         // output[7:0] 
        .afi_bvalid        (afi_bvalid),        // input
        .afi_bready        (afi_bready),        // output
        .afi_bid           (afi_bid),           // input[5:0] 
        .afi_bresp         (afi_bresp),         // input[1:0] 
        .afi_wcount        (afi_wcount),        // input[7:0] 
        .afi_wacount       (afi_wacount),       // input[5:0] 
        .afi_wrissuecap1en (afi_wrissuecap1en), // output
        .afi_araddr        (afi_araddr),        // output[31:0] 
        .afi_arvalid       (afi_arvalid),       // output
        .afi_arready       (afi_arready),       // input
        .afi_arid          (afi_arid),          // output[5:0] 
        .afi_arlock        (afi_arlock),        // output[1:0] 
        .afi_arcache       (afi_arcache),       // output[3:0] 
        .afi_arprot        (afi_arprot),        // output[2:0] 
        .afi_arlen         (afi_arlen),         // output[3:0] 
        .afi_arsize        (afi_arsize),        // output[1:0] 
        .afi_arburst       (afi_arburst),       // output[1:0] 
        .afi_arqos         (afi_arqos),         // output[3:0] 
        .afi_rdata         (afi_rdata),         // input[63:0] 
        .afi_rvalid        (afi_rvalid),        // input
        .afi_rready        (afi_rready),        // output
        .afi_rid           (afi_rid),           // input[5:0] 
        .afi_rlast         (afi_rlast),         // input
        .afi_rresp         (afi_rresp),         // input[1:0] 
        .afi_rcount        (afi_rcount),        // input[7:0] 
        .afi_racount       (afi_racount),       // input[2:0] 
        .afi_rdissuecap1en (afi_rdissuecap1en), // output
        
        .h2d_data          (h2d_data),          // output[31:0] 
        .h2d_type          (h2d_type),          // output[1:0] 
        .h2d_valid         (h2d_valid),         // output
        .h2d_ready         (h2d_ready),         // input
        
        .d2h_data          (d2h_data),          // input[31:0] 
        .d2h_type          (d2h_type),          // input[1:0] 
        .d2h_valid         (d2h_valid),         // input
        .d2h_many          (d2h_many),          // input
        .d2h_ready         (d2h_ready),         // output
        
        .phy_ready         (phy_speed),         // input[1:0] 
        .xmit_ok           (xmit_ok),           // input
        .xmit_err          (xmit_err),          // input
        .syncesc_recv      (syncesc_recv),      // input
        .pcmd_st_cleared   (pcmd_st_cleared),   // output
        .syncesc_send      (syncesc_send),      // output
        .syncesc_send_done (syncesc_send_done), // input
        .comreset_send     (comreset_send),     // output
        .cominit_got       (cominit_got),       // input
        .set_offline       (set_offline),       // output
        .x_rdy_collision   (x_rdy_collision),   // input
        .send_R_OK         (send_R_OK),         // output
        .send_R_ERR        (send_R_ERR),        // output
        .serr_DT           (serr_DT),           // input
        .serr_DS           (serr_DS),           // input
        .serr_DH           (serr_DH),           // input
        .serr_DC           (serr_DC),           // input
        .serr_DB           (serr_DB),           // input
        .serr_DW           (serr_DW),           // input
        .serr_DI           (serr_DI),           // input
        .serr_EE           (serr_EE),           // input
        .serr_EP           (serr_EP),           // input
        .serr_EC           (serr_EC),           // input
        .serr_ET           (serr_ET),           // input
        .serr_EM           (serr_EM),           // input
        .serr_EI           (serr_EI),           // input
        .sctl_ipm          (sctl_ipm),          // output[3:0] 
        .sctl_spd          (sctl_spd),          // output[3:0] 
        .irq               (irq),               // output
        .debug_link_send_data (debug_link_send_data), // input @posedge sata_clk - last symbol was data output (to count sent out)
        .debug_link_dmatp  (debug_link_dmatp),        // link received DMATp from device
`ifdef USE_DATASCOPE
        .datascope1_clk    (datascope_clk),     // input
        .datascope1_waddr  (datascope_waddr),   // input[9:0] 
        .datascope1_we     (datascope_we),      // input
        .datascope1_di     (datascope_di),      // input[31:0] 
`endif        
        
`ifdef USE_DRP
        .drp_en           (drp_en),             // output reg 
        .drp_we           (drp_we),             // output reg 
        .drp_addr         (drp_addr),           // output[14:0] reg 
        .drp_di           (drp_di),             // output[15:0] reg 
        .drp_rdy          (drp_rdy),            // input
        .drp_do           (drp_do),             // input[15:0] 
`endif   
        .xclk_period       (xclk_period),       // input[11:0] 
        .debug_in_phy      (debug_phy),         // input[31:0]
        .debug_in_link     (debug_link)         // input[31:0]
    );

    ahci_sata_layers #(
`ifdef USE_DATASCOPE
        .ADDRESS_BITS        (ADDRESS_BITS),  // for datascope
        .DATASCOPE_START_BIT (DATASCOPE_START_BIT), // bit of DRP "other_control" to start recording after 0->1 (needs DRP)
        .DATASCOPE_POST_MEAS (DATASCOPE_POST_MEAS), // number of measurements to perform after event
`endif    
        .BITS_TO_START_XMIT  (BITS_TO_START_XMIT),
        .DATA_BYTE_WIDTH     (DATA_BYTE_WIDTH),
        .ELASTIC_DEPTH       (ELASTIC_DEPTH),
        .ELASTIC_OFFSET      (ELASTIC_OFFSET),
        .FREQ_METER_WIDTH    (FREQ_METER_WIDTH)
    ) ahci_sata_layers_i (
        .exrst             (exrst),             // input
        .reliable_clk      (reliable_clk),      // input
        .rst               (sata_rst),          // output
        .clk               (sata_clk),          // output
        
        .h2d_data          (h2d_data),          // input[31:0] 
        .h2d_mask          (2'h3),              //h2d_mask), // input[1:0] 
        .h2d_type          (h2d_type),          // input[1:0] 
        .h2d_valid         (h2d_valid),         // input
        .h2d_ready         (h2d_ready),         // output
        
        .d2h_data          (d2h_data),          // output[31:0] 
        .d2h_mask          (),                  // 2h_mask), // output[1:0] 
        .d2h_type          (d2h_type),          // output[1:0] 
        .d2h_valid         (d2h_valid),         // output
        .d2h_many          (d2h_many),          // output
        .d2h_ready         (d2h_ready),         // input
        
        .phy_speed         (phy_speed),         // output[1:0] 
        .gtx_ready(), // output
        .xmit_ok           (xmit_ok),           // output
        .xmit_err          (xmit_err),          // output
        .x_rdy_collision   (x_rdy_collision),   // output
        .syncesc_recv      (syncesc_recv),      // output
        .pcmd_st_cleared   (pcmd_st_cleared),   // input
        .syncesc_send      (syncesc_send),      // input
        .syncesc_send_done (syncesc_send_done), // output
        .comreset_send     (comreset_send),     // input
        .cominit_got       (cominit_got),       // output
        .set_offline       (set_offline),       // input
        .send_R_OK         (send_R_OK),         // input
        .send_R_ERR        (send_R_ERR),        // input
        .serr_DT           (serr_DT),           // output
        .serr_DS           (serr_DS),           // output
        .serr_DH           (serr_DH),           // output
        .serr_DC           (serr_DC),           // output
        .serr_DB           (serr_DB),           // output
        .serr_DW           (serr_DW),           // output
        .serr_DI           (serr_DI),           // output
        .serr_EE           (serr_EE),           // output
        .serr_EP           (serr_EP),           // output
        .serr_EC           (serr_EC),           // output
        .serr_ET           (serr_ET),           // output
        .serr_EM           (serr_EM),           // output
        .serr_EI           (serr_EI),           // output
        .sctl_ipm          (sctl_ipm),          // input[3:0] 
        .sctl_spd          (sctl_spd),          // input[3:0] 
        .extclk_p          (EXTCLK_P),          // input wire 
        .extclk_n          (EXTCLK_N),          // input wire 
        .txp_out           (TXP),               // output wire 
        .txn_out           (TXN),               // output wire 
        .rxp_in            (RXP),               // input wire 
        .rxn_in            (RXN),               // input wire
        .debug_is_data     (debug_link_send_data), //output  @clk (sata clk) - last symbol was data output
        .debug_dmatp       (debug_link_dmatp),  // @clk (sata clk) - received CODE_DMATP
        
        
`ifdef USE_DATASCOPE
        .datascope_clk     (datascope_clk),     // output
        .datascope_waddr   (datascope_waddr),   // output[9:0] 
        .datascope_we      (datascope_we),      // output
        .datascope_di      (datascope_di),      // output[31:0] 
`endif        
`ifdef USE_DRP
        .drp_rst           (arst),              // input
        .drp_clk           (ACLK),              // input
        .drp_en            (drp_en),            // input
        .drp_we            (drp_we),            // input
        .drp_addr          (drp_addr),          // input[14:0] 
        .drp_di            (drp_di),            // input[15:0] 
        .drp_rdy           (drp_rdy),           // output
        .drp_do            (drp_do),            // output[15:0] 
`endif 
        .xclk_period       (xclk_period),       // output[11:0] 
        .debug_phy         (debug_phy),         // output[31:0]
        .debug_link        (debug_link)         // output[31:0]
       ,.hclk(hclk)
    );


endmodule

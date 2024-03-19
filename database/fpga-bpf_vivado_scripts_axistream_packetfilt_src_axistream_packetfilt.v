//Copyright 2020 Marco Merlini. This file is part of the fpga-bpf project,
//whose license information can be found at 
//https://github.com/UofT-HPRC/fpga-bpf/blob/master/LICENSE

`timescale 1ns / 1ps
`default_nettype none

/*

axistream_packetfilt.v

Top-level module for one version of the packet filter. Wraps the packet filter 
core with bridges for AXI Lite (for new code) and AXI Stream (for snooping and 
forwarding)

Note: Icarus Verilog doesn't support SystemVerilog. For that reason, I use the 
preprocessor to disconnect the AirHDL-generated AXILite registers. Anyway, 
writing a testbench for AXILite would have been fairly painful, so this makes 
my life easier anyway

By the way, something I only recently discovered: since Icarus Verilog doesn't 
support localparam, I Was just using parameters. But Vivado will add them to 
the formal parameter list, so I do more tricky preprocessing for compatibility.

TODO: Update rest of code to do this

*/

`ifdef FROM_AXISTREAM_PACKETFILT
`define DISABLE_AXILITE
`include "parallel_cores/parallel_cores.v"
`include "snoopers/axistream_snooper/axistream_snooper.v"
`include "forwarders/axistream_forwarder/axistream_forwarder.v"
`include "parallel_cores/packetfilter_core/packetfilter_core.v"
`define localparam parameter
`else /*For Vivado*/
`define localparam localparam
`endif

`define CLOG2(x) (\
   (((x) <= 1) ? 0 : \
   (((x) <= 2) ? 1 : \
   (((x) <= 4) ? 2 : \
   (((x) <= 8) ? 3 : \
   (((x) <= 16) ? 4 : \
   (((x) <= 32) ? 5 : \
   (((x) <= 64) ? 6 : \
   (((x) <= 128) ? 7 : \
   (((x) <= 256) ? 8 : \
   (((x) <= 512) ? 9 : \
   (((x) <= 1024) ? 10 : \
   (((x) <= 2048) ? 11 : \
   (((x) <= 4096) ? 12 : \
   (((x) <= 8192) ? 13 : \
   (((x) <= 16384) ? 14 : \
   (((x) <= 32768) ? 15 : \
   (((x) <= 65536) ? 16 : \
   -1))))))))))))))))))

`define KEEP_WIDTH (SN_FWD_DATA_WIDTH/8)
module axistream_packetfilt # (
        parameter N = 4,
        parameter PACKET_MEM_BYTES = 2048,
        parameter INST_MEM_DEPTH = 512,
        parameter SN_FWD_DATA_WIDTH = 64,
        parameter BUF_IN = 0,
        parameter BUF_OUT = 0,
        parameter PESS = 0,
        parameter ENABLE_BACKPRESSURE = 0,
        
        //Not to be set manually
        parameter CODE_ADDR_WIDTH = `CLOG2(INST_MEM_DEPTH),
        parameter CODE_DATA_WIDTH = 64,
		parameter BYTE_ADDR_WIDTH = `CLOG2(PACKET_MEM_BYTES)
`ifndef DISABLE_AXILITE
        , //yes, this comma needs to be here
        parameter AXI_ADDR_WIDTH = 12 // width of the AXI address bus
`endif
) (
        input wire clk,
        input wire rst,
    
        
        //AXI stream snoop interface
        input wire [SN_FWD_DATA_WIDTH-1:0] sn_TDATA,
        input wire [`KEEP_WIDTH-1:0] sn_TKEEP,
        input wire sn_TREADY,
        output wire sn_bp_TREADY,
        input wire sn_TVALID,
        input wire sn_TLAST,
    
    
        //AXI Stream forwarder interface
        output wire [SN_FWD_DATA_WIDTH-1:0] fwd_TDATA,
        output wire [`KEEP_WIDTH-1:0] fwd_TKEEP,
        output wire fwd_TLAST,
        output wire fwd_TVALID,
        input wire fwd_TREADY,
        
        //Debug outputs
        output wire [15:0] num_packets_dropped,
        output wire [BYTE_ADDR_WIDTH -1 :0] cpu0_byte_rd_addr,
        output wire cpu0_rd_en,
        output wire [31:0] cpu0_resized_mem_data,
        output wire cpu0_resized_mem_data_valid,
        output wire cpu0_acc,
        output wire cpu0_rej,
        output wire [CODE_ADDR_WIDTH -1:0] cpu0_inst_rd_addr,
        output wire cpu0_inst_rd_en,
        output wire [CODE_DATA_WIDTH -1:0] cpu0_inst_rd_data
    
`ifndef DISABLE_AXILITE
        , //yes, this comma needs to be here
        // AXI Write Address Channel     
        input  wire [AXI_ADDR_WIDTH-1:0] s_axi_awaddr,
        input  wire [2:0]                s_axi_awprot,
        input  wire                      s_axi_awvalid,
        output wire                      s_axi_awready,
                                         
        // AXI Write Data Channel        
        input  wire [31:0]               s_axi_wdata,
        input  wire [3:0]                s_axi_wstrb,
        input  wire                      s_axi_wvalid,
        output wire                      s_axi_wready,
                                         
        // AXI Read Address Channel      
        input  wire [AXI_ADDR_WIDTH-1:0] s_axi_araddr,
        input  wire [2:0]                s_axi_arprot,
        input  wire                      s_axi_arvalid,
        output wire                      s_axi_arready,
                                         
        // AXI Read Data Channel         
        output wire [31:0]               s_axi_rdata,
        output wire [1:0]                s_axi_rresp,
        output wire                      s_axi_rvalid,
        input  wire                      s_axi_rready,
                                         
        // AXI Write Response Channel    
        output wire [1:0]                s_axi_bresp,
        output wire                      s_axi_bvalid,
        input  wire                      s_axi_bready
`endif
        
        
);

    //`localparam CODE_ADDR_WIDTH = `CLOG2(INST_MEM_DEPTH);
    //`localparam CODE_DATA_WIDTH = 64;
    //`localparam BYTE_ADDR_WIDTH = `CLOG2(PACKET_MEM_BYTES);
    `localparam SN_FWD_ADDR_WIDTH = BYTE_ADDR_WIDTH - `CLOG2(SN_FWD_DATA_WIDTH/8);
    `localparam PLEN_WIDTH = 32;
    `localparam PACKMEM_DATA_WIDTH = (SN_FWD_DATA_WIDTH < 64) ? 64 : SN_FWD_DATA_WIDTH;
    `localparam PACKMEM_ADDR_WIDTH = SN_FWD_ADDR_WIDTH - `CLOG2(PACKMEM_DATA_WIDTH/SN_FWD_DATA_WIDTH);
    `localparam MEM_LAT = 1 + BUF_IN + BUF_OUT;
    `localparam PACKMEM_INC_WIDTH = `CLOG2(PACKMEM_DATA_WIDTH/8)+1;
    
    `localparam DBG_INFO_WIDTH = 
			  BYTE_ADDR_WIDTH	//byte_rd_addr
			+ 1					//cpu_rd_en
			+ 32				//resized_mem_data
			+ 1					//resized_mem_data_vld
			+ 1					//cpu_acc
			+ 1					//cpu_rej
			+ CODE_ADDR_WIDTH	//inst_rd_addr
			+ 1					//inst_rd_en
			+ CODE_DATA_WIDTH	//inst_rd_data
    ;

`ifdef ICARUS_VERILOG
    initial begin
        $display("SN_FWD_ADDR_WIDTH: %d", SN_FWD_ADDR_WIDTH);
        $display("SN_FWD_DATA_WIDTH: %d", SN_FWD_DATA_WIDTH);
        
        $display("PACKMEM_ADDR_WIDTH: %d", PACKMEM_ADDR_WIDTH);
        $display("PACKMEM_DATA_WIDTH: %d", PACKMEM_DATA_WIDTH);
        
        $display("MEM_LAT: %d", MEM_LAT);
    end
`endif

    /***********************************/
    /***CONNECTIONS TO PARALLEL CORES***/
    /***********************************/
    
    //Interface from packet mem to snooper
    wire [PACKMEM_ADDR_WIDTH-1:0] sn_addr;
    wire [PACKMEM_DATA_WIDTH-1:0] sn_wr_data;
    wire sn_wr_en;
    wire [PACKMEM_INC_WIDTH-1:0] sn_byte_inc;
    wire sn_done;
    wire rdy_for_sn;
    wire rdy_for_sn_ack; //Yeah, I'm ready for a snack
    
    //Interface from packet mem to forwarder
    wire [PACKMEM_ADDR_WIDTH-1:0] fwd_addr;
    wire fwd_rd_en;
    wire [PACKMEM_DATA_WIDTH-1:0] fwd_rd_data;
    wire fwd_rd_data_vld;
    wire [PLEN_WIDTH-1:0] fwd_byte_len;
    wire fwd_done;
    wire rdy_for_fwd;
    wire rdy_for_fwd_ack;
    
`ifndef DISABLE_AXILITE
    //from axilite_regs <=> regstrb2mem
    wire status_strobe; // Strobe logic for register 'Status' (pulsed when the register is read from the bus)
    wire [15:0] status_num_packets_dropped; // Value of register 'Status', field 'num_packets_dropped'
    wire control_strobe; // Strobe logic for register 'Control' (pulsed when the register is written from the bus)
    wire [0:0] control_start; // Value of register 'Control', field 'start'
    wire inst_low_strobe; // Strobe logic for register 'inst_low' (pulsed when the register is written from the bus)
    wire [31:0] inst_low_value; // Value of register 'inst_low', field 'value'
    wire inst_high_strobe; // Strobe logic for register 'inst_high' (pulsed when the register is written from the bus)
    wire [31:0] inst_high_value; // Value of register 'inst_high', field 'value'
`else
    reg control_start = 1;
`endif
    
    //Maintain count of dropped packets
    wire dropped_inc;
    reg [15:0] dropped_cnt = 0;
    always @(posedge clk) dropped_cnt <= dropped_cnt + dropped_inc;
    
    //Send output count to all the right places
    assign num_packets_dropped = dropped_cnt;
`ifndef DISABLE_AXILITE
    assign status_num_packets_dropped = dropped_cnt;
`endif

    //Interface for new code input
    //In simulation, these get forced from the testbench
    wire [CODE_ADDR_WIDTH-1:0] inst_wr_addr;
    wire [CODE_DATA_WIDTH-1:0] inst_wr_data;
    wire inst_wr_en;   
    
    /********************/
    /***INSTANTIATIONS***/
    /********************/

`ifndef DISABLE_AXILITE

    packet_filter_regs # (
        .AXI_ADDR_WIDTH(AXI_ADDR_WIDTH) // width of the AXI address bus
    ) axilite_regs (
        // Clock and Reset
        .axi_aclk(clk),
        .axi_aresetn(!rst),
                                         
        // AXI Write Address Channel     
        .s_axi_awaddr(s_axi_awaddr),
        .s_axi_awprot(s_axi_awprot),
        .s_axi_awvalid(s_axi_awvalid),
        .s_axi_awready(s_axi_awready),
                                         
        // AXI Write Data Channel        
        .s_axi_wdata(s_axi_wdata),
        .s_axi_wstrb(s_axi_wstrb),
        .s_axi_wvalid(s_axi_wvalid),
        .s_axi_wready(s_axi_wready),
                                         
        // AXI Read Address Channel      
        .s_axi_araddr(s_axi_araddr),
        .s_axi_arprot(s_axi_arprot),
        .s_axi_arvalid(s_axi_arvalid),
        .s_axi_arready(s_axi_arready),
                                         
        // AXI Read Data Channel         
        .s_axi_rdata(s_axi_rdata),
        .s_axi_rresp(s_axi_rresp),
        .s_axi_rvalid(s_axi_rvalid),
        .s_axi_rready(s_axi_rready),
                                         
        // AXI Write Response Channel    
        .s_axi_bresp(s_axi_bresp),
        .s_axi_bvalid(s_axi_bvalid),
        .s_axi_bready(s_axi_bready),
        
        // User Ports          
        .status_strobe(status_strobe), // Strobe logic for register 'Status' (pulsed when the register is read from the bus)
        .status_num_packets_dropped(status_num_packets_dropped), // Value of register 'Status', field 'num_packets_dropped'
        .control_strobe(control_strobe), // Strobe logic for register 'Control' (pulsed when the register is written from the bus)
        .control_start(control_start), // Value of register 'Control', field 'start'
        .inst_low_strobe(inst_low_strobe), // Strobe logic for register 'inst_low' (pulsed when the register is written from the bus)
        .inst_low_value(inst_low_value), // Value of register 'inst_low', field 'value'
        .inst_high_strobe(inst_high_strobe), // Strobe logic for register 'inst_high' (pulsed when the register is written from the bus)
        .inst_high_value(inst_high_value) // Value of register 'inst_high', field 'value'
    );
    
    regstrb2mem reg2mem (
        .clk(clk),

        //Interface to codemem
        .code_mem_wr_addr(inst_wr_addr),
        .code_mem_wr_data(inst_wr_data),
        .code_mem_wr_en(inst_wr_en),
        
        //Interface from regs
        .inst_high_value(inst_high_value),
        .inst_high_strobe(inst_high_strobe),
        .inst_low_value(inst_low_value),
        .inst_low_strobe(inst_low_strobe),
            
        .control_start(control_start)
    );
`endif

    axistream_snooper # (
        .SN_FWD_DATA_WIDTH(SN_FWD_DATA_WIDTH),
        .SN_FWD_ADDR_WIDTH(SN_FWD_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH), 
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_INC_WIDTH(PACKMEM_INC_WIDTH),
        .PESS(PESS),
        .ENABLE_BACKPRESSURE(ENABLE_BACKPRESSURE)
    ) the_snooper (
        .clk(clk),
        .rst(!control_start),

        //AXI stream snoop interface
        .sn_TDATA(sn_TDATA),
        .sn_TKEEP(sn_TKEEP),
        .sn_TREADY(sn_TREADY),
        .sn_bp_TREADY(sn_bp_TREADY),
        .sn_TVALID(sn_TVALID),
        .sn_TLAST(sn_TLAST),

        //Interface to parallel_cores
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack), //Yeah, I'm ready for a snack
        .packet_dropped_inc(dropped_inc)
    );

//SPECIAL CASE: When N = 1, we don't instantiate all that complicated logic for
//arbitration. Normally I would prefer to keep things simple and pay the price
//of unneeded extra logic, but I expect N=1 to be fairly common. So, we'll do
//the optimization

	wire [N*DBG_INFO_WIDTH -1:0] dbg_info;

generate if (N > 1) begin
    //Here we need the parallel_cores module
    parallel_cores # (
        .N(N),
        .PACKET_MEM_BYTES(PACKET_MEM_BYTES),
        .INST_MEM_DEPTH(INST_MEM_DEPTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT),
        .PESS(PESS)
    ) the_actual_filter (
        .clk(clk),
        .rst(!control_start),


        //Interface to snooper
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack), //Yeah, I'm ready for a snack

        //Interface to forwarder
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),
        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack),

        //Interface for new code input
        .inst_wr_addr(inst_wr_addr),
        .inst_wr_data(inst_wr_data),
        .inst_wr_en(inst_wr_en),
        
        //Debug probes
        .dbg_info(dbg_info)
    );
    
end else begin
    //In this case, N = 1 and we only need one packetfilter_core
    //Here we only need a packetfilter_core module
    packetfilter_core # (
        .PACKET_MEM_BYTES(PACKET_MEM_BYTES),
        .INST_MEM_DEPTH(INST_MEM_DEPTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .BUF_IN(BUF_IN),
        .BUF_OUT(BUF_OUT),
        .PESS(PESS)
    ) the_actual_filter (
        .clk(clk),
        .rst(!control_start),


        //Interface to snooper
        .sn_addr(sn_addr),
        .sn_wr_data(sn_wr_data),
        .sn_wr_en(sn_wr_en),
        .sn_byte_inc(sn_byte_inc),
        .sn_done(sn_done),
        .rdy_for_sn(rdy_for_sn),
        .rdy_for_sn_ack(rdy_for_sn_ack), //Yeah, I'm ready for a snack

        //Interface to forwarder
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),
        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack),

        //Interface for new code input
        .inst_wr_addr(inst_wr_addr),
        .inst_wr_data(inst_wr_data),
        .inst_wr_en(inst_wr_en),
        
        //Debug probes
        .dbg_info(dbg_info)
    );

end endgenerate
	
	//Assign debug probes
	assign {
        cpu0_byte_rd_addr,
        cpu0_rd_en,
        cpu0_resized_mem_data,
        cpu0_resized_mem_data_valid,
        cpu0_acc,
        cpu0_rej,
        cpu0_inst_rd_addr,
        cpu0_inst_rd_en,
        cpu0_inst_rd_data
    } = dbg_info[DBG_INFO_WIDTH -1:0];
	
    axistream_forwarder # (
        .SN_FWD_ADDR_WIDTH(SN_FWD_ADDR_WIDTH),
        .SN_FWD_DATA_WIDTH(SN_FWD_DATA_WIDTH),
        .PACKMEM_ADDR_WIDTH(PACKMEM_ADDR_WIDTH),
        .PACKMEM_DATA_WIDTH(PACKMEM_DATA_WIDTH),
        .MEM_LAT(MEM_LAT),
        .PLEN_WIDTH(PLEN_WIDTH)
    ) the_forwarder (
        .clk(clk),
        .rst(!control_start),

        //AXI Stream interface
        .fwd_TDATA(fwd_TDATA),
        .fwd_TKEEP(fwd_TKEEP),
        .fwd_TLAST(fwd_TLAST),
        .fwd_TVALID(fwd_TVALID),
        .fwd_TREADY(fwd_TREADY),

        //Interface to parallel_cores
        .fwd_addr(fwd_addr),
        .fwd_rd_en(fwd_rd_en),
        .fwd_rd_data(fwd_rd_data),
        .fwd_rd_data_vld(fwd_rd_data_vld),
        .fwd_byte_len(fwd_byte_len),

        .fwd_done(fwd_done),
        .rdy_for_fwd(rdy_for_fwd),
        .rdy_for_fwd_ack(rdy_for_fwd_ack)
    );
endmodule

`undef KEEP_WIDTH
`undef localparam
`undef CLOG2
`undef DISABLE_AXILITE

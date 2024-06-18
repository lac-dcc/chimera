// This program was cloned from: https://github.com/M17-Project/OpenHT-fpga
// License: GNU General Public License v3.0

`ifndef _FIFO_MASTER_
`define _FIFO_MASTER_

`timescale 1 ns / 1 ns

module fifo_master # (
    parameter WADDR_DEPTH               = 512,
    parameter WADDR_WIDTH               = clog2(WADDR_DEPTH),
    parameter WDATA_WIDTH               = 36,
    parameter RADDR_DEPTH               = 512,
    parameter RADDR_WIDTH               = clog2(RADDR_DEPTH),
    parameter RDATA_WIDTH               = 36,
    parameter REGMODE                   = "reg",
    parameter ENABLE_ALMOST_FULL_FLAG   = "TRUE",
    parameter ENABLE_ALMOST_EMPTY_FLAG  = "TRUE",
    parameter ENABLE_DATA_COUNT_WR      = "FALSE",
    parameter ENABLE_DATA_COUNT_RD      = "FALSE",
    parameter DATA_COUNT_CHK            = "FALSE",
    parameter WR_DEASSERT_CHK           = 1,
    parameter RD_DEASSERT_CHK           = 1
)(
    input                        wr_clk_i,
    input                        rd_clk_i,
    input                        rst_i,
    input                        rp_rst_i,

    output reg [WADDR_WIDTH-1:0] almost_full_th_i,
    output reg [WADDR_WIDTH-1:0] almost_full_clr_th_i,
    output reg [RADDR_WIDTH-1:0] almost_empty_th_i,
    output reg [RADDR_WIDTH-1:0] almost_empty_clr_th_i,

    output reg [WDATA_WIDTH-1:0] wr_data_i,
    output reg                   wr_en_i,
    output reg                   rd_en_i,

    output reg [WADDR_WIDTH-1:0] waddr_i,
    output reg [RADDR_WIDTH-1:0] raddr_i,
	
	output reg					 m_rst_o,
	output reg					 m_rp_rst_o,
							
    input [RDATA_WIDTH-1:0]      rd_data_o,     
    input                        full_o,
    input                        empty_o,
    input                        almost_full_o,
    input                        almost_empty_o,
    input [WADDR_WIDTH:0]        wr_data_cnt_o,
    input [RADDR_WIDTH:0]        rd_data_cnt_o,
							     
    input [RDATA_WIDTH-1:0]      rd_data_test_o,
    input                        full_test_o,
    input                        empty_test_o,
    input                        afull_test_o,
    input                        aempty_test_o,
    input [WADDR_WIDTH:0]        wr_datacnt_test_o,
    input [RADDR_WIDTH:0]        rd_datacnt_test_o
);

reg dout_r;
reg full_r; 
reg empty_r; 
reg afull_r;
reg aempty_r;
reg wdcnt_r;
reg rdcnt_r;
reg dcnt_r;

reg wr_en_p_r;
reg rd_en_p_r;
reg rd_en_p2_r;

reg dout_latch;
reg full_latch; 
reg empty_latch; 
reg afull_latch;
reg aempty_latch;
reg wdcnt_latch;
reg rdcnt_latch;
reg dcnt_latch;

reg [255:0] din;
reg [WADDR_WIDTH-1:0] waddr_p_r;
wire [WADDR_WIDTH-1:0] waddr_nxt_c;

wire mstr_rst       = rst_i | rp_rst_i;
wire rd_pntr        = (REGMODE == "noreg") ? rd_en_p_r : rd_en_p2_r;
wire dout_chk       = (rd_pntr  ? (rd_data_o == rd_data_test_o) : 1'b1);
wire full_chk       = (WADDR_DEPTH == 2 ** clog2(WADDR_DEPTH)) ? (~WR_DEASSERT_CHK & ~wr_en_p_r) | (full_o == full_test_o) 
                                                               : (wr_en_p_r & full_o) ? ((WADDR_DEPTH-1 == waddr_p_r) & full_o)
                                                                                      : 1'b1;
wire empty_chk      = (~RD_DEASSERT_CHK & ~rd_en_p_r) | (empty_o == empty_test_o);
wire afull_chk;
wire aempty_chk;
wire wdcnt_chk;
wire rdcnt_chk;
wire dcnt_chk;

wire dout_latch_c   = dout_latch   & dout_chk;  
wire full_latch_c   = full_latch   & full_chk;  
wire empty_latch_c  = empty_latch  & empty_chk; 
wire afull_latch_c;
wire aempty_latch_c;
wire wdcnt_latch_c;
wire rdcnt_latch_c;
wire dcnt_latch_c;

wire master_latch;
assign master_latch   = dout_latch & full_latch & empty_latch &
                        afull_latch & aempty_latch & wdcnt_chk & rdcnt_chk;

assign waddr_nxt_c    = (wr_en_i) ? waddr_i : waddr_p_r;
           
if(ENABLE_ALMOST_FULL_FLAG == "TRUE") begin
    assign afull_latch_c = (afull_latch  & afull_chk);
    assign afull_chk     = (~WR_DEASSERT_CHK & ~wr_en_p_r) | (almost_full_o == afull_test_o);
end
else begin
    assign afull_latch_c = 1'b1;
    assign afull_chk     = 1'b1;
end

if(ENABLE_ALMOST_EMPTY_FLAG == "TRUE") begin
    assign aempty_chk     = (~RD_DEASSERT_CHK & ~rd_en_p_r) | (almost_empty_o == aempty_test_o);
    assign aempty_latch_c = (aempty_latch & aempty_chk);
end
else begin
    assign aempty_chk     = 1'b1;
    assign aempty_latch_c = 1'b1;
end

if(ENABLE_DATA_COUNT_WR == "TRUE") begin
    assign wdcnt_latch_c = (wdcnt_latch  & wdcnt_chk);
    assign wdcnt_chk     = (~WR_DEASSERT_CHK & ~wr_en_p_r) | (wr_data_cnt_o == wr_datacnt_test_o);
end
else begin
    assign wdcnt_latch_c = 1'b1;
    assign wdcnt_chk     = 1'b1;
end

if(ENABLE_DATA_COUNT_RD == "TRUE") begin
    assign rdcnt_latch_c = (rdcnt_latch  & rdcnt_chk);
    assign rdcnt_chk     = (~RD_DEASSERT_CHK & ~rd_en_p_r) | (rd_data_cnt_o == rd_datacnt_test_o);
end
else begin
    assign rdcnt_latch_c = 1'b1;
    assign rdcnt_chk     = 1'b1;
end

//------------------------------------------------------------------------------
// Register Declarations
//------------------------------------------------------------------------------
generate
    genvar igen;
    for(igen = 0; igen < (256/32); igen = igen + 1) begin
        always @ (posedge wr_clk_i) begin
            din[igen * 32 +: 32] <= $urandom_range({32{1'b0}}, {32{1'b1}});
        end
    end
endgenerate

always @ (posedge wr_clk_i, posedge rst_i) begin
    if(rst_i) begin
        full_r       <= 1'b1;
        afull_r      <= 1'b1;
        wdcnt_r      <= 1'b1;
        dcnt_r       <= 1'b1;

        wr_en_p_r    <= 1'b0;

        full_latch   <= 1'b1;
        afull_latch  <= 1'b1;
        wdcnt_latch  <= 1'b1;
        dcnt_latch   <= 1'b1;

        waddr_p_r    <= {WADDR_WIDTH{1'b0}};
    end              
    else begin       
        full_r       <= full_chk;
        afull_r      <= afull_chk;
        wdcnt_r      <= wdcnt_chk;
        dcnt_r       <= dcnt_chk;

        wr_en_p_r    <= wr_en_i;
					 
        full_latch   <= full_latch_c;
        afull_latch  <= afull_latch_c;
        wdcnt_latch  <= wdcnt_latch_c;
        dcnt_latch   <= dcnt_latch_c;

        waddr_p_r    <= waddr_nxt_c;
    end
end

always @ (posedge rd_clk_i, posedge rst_i) begin
    if(rst_i) begin
        dout_r       <= 1'b1;
        empty_r      <= 1'b1;
        aempty_r     <= 1'b1;
        rdcnt_r      <= 1'b1;

        dout_latch   <= 1'b1;
        empty_latch  <= 1'b1;
        aempty_latch <= 1'b1;
        rdcnt_latch  <= 1'b1;

        rd_en_p_r    <= 1'b0;
        rd_en_p2_r   <= 1'b0;
    end
    else begin
        dout_r       <= dout_chk;
        empty_r      <= empty_chk;
        aempty_r     <= aempty_chk;
        rdcnt_r      <= rdcnt_chk;

        dout_latch   <= dout_latch_c;  
        empty_latch  <= empty_latch_c; 
        aempty_latch <= aempty_latch_c;
        rdcnt_latch  <= rdcnt_latch_c;

        rd_en_p_r    <= rd_en_i;
        rd_en_p2_r   <= rd_en_p_r;
    end
end

//------------------------------------------------------------------------------
// TESTBENCH program
//------------------------------------------------------------------------------
initial begin
    almost_full_th_i      <= WADDR_DEPTH/2;
    almost_full_clr_th_i  <= WADDR_DEPTH/2 - 5;
    almost_empty_th_i     <= RADDR_DEPTH/2 + 5;
    almost_empty_clr_th_i <= RADDR_DEPTH/2;
    
    wr_data_i             <= {WDATA_WIDTH{1'b0}};
    wr_en_i               <= 1'b0;
    rd_en_i               <= 1'b0;
    
    waddr_i               <= {WADDR_WIDTH{1'b0}};
    raddr_i               <= {RADDR_WIDTH{1'b0}};
	
	m_rst_o				  <= 1'b0;
	m_rp_rst_o			  <= 1'b0;
end

initial begin
    @(negedge mstr_rst);
    @(posedge wr_clk_i);
    fifo_write(WADDR_DEPTH);
    @(posedge wr_clk_i);
    @(posedge wr_clk_i);
    @(posedge wr_clk_i);
    @(posedge rd_clk_i);
    fifo_read(RADDR_DEPTH);
    @(posedge rd_clk_i);
    @(posedge rd_clk_i);
    print_output();
    $finish;
end
    

//------------------------------------------------------------------------------
// Task Definition
//------------------------------------------------------------------------------

task print_output;
    begin
        if(dout_latch == 1'b1) begin
            $display("-----------------------------------------------------");
            $display("----------------- DATA CHECK PASSED -----------------");
            $display("-----------------------------------------------------");
        end
        else begin
            $display("-----------------------------------------------------");
            $display("!!!!!!!!!!!!!!!!! DATA CHECK FAILED !!!!!!!!!!!!!!!!!");
            $display("-----------------------------------------------------");
        end

        if(full_latch) begin
            if(WADDR_DEPTH == 2 ** clog2(WADDR_DEPTH)) begin
                $display("## FULL Flag Check: PASSED with Waveform");
            end
            else begin
                $display("## FULL Flag Check: PASSED with Logic Check only");
            end
        end
        else begin
            $display("## FULL Flag Check: FAILED");
        end
	    
        if(empty_latch) begin
            $display("## EMPTY Flag Check: PASSED");
        end
        else begin
            $display("## EMPTY Flag Check: FAILED");
        end
	    
        if(ENABLE_ALMOST_FULL_FLAG == "TRUE") begin
            if(afull_latch) begin
                $display("## ALMOST FULL Flag Check: PASSED");
            end
            else begin
                $display("## ALMOST FULL Flag Check: FAILED");
            end
        end
	    
        if(ENABLE_ALMOST_EMPTY_FLAG == "TRUE") begin
            if(aempty_latch) begin
                $display("## ALMOST EMPTY Flag Check: PASSED");
            end
            else begin
                $display("## ALMOST EMPTY Flag Check: FAILED");
            end
        end
	    
        if(ENABLE_DATA_COUNT_WR == "TRUE") begin
            if(wdcnt_latch) begin
                $display("## Data Count (WR) Check: PASSED");
            end
            else begin
                $display("## Data Count (WR) Check: FAILED");
            end
        end
	    
        if(ENABLE_DATA_COUNT_RD == "TRUE") begin
            if(rdcnt_latch) begin
                $display("## Data Count (RD) Check: PASSED");
            end
            else begin
                $display("## Data Count (RD) Check: FAILED");
            end
        end
	    
        if(master_latch) begin
            $display("-----------------------------------------------------");
            $display("----------------- SIMULATION PASSED -----------------");
            $display("-----------------------------------------------------");
        end
        else begin
            $display("-----------------------------------------------------");
            $display("!!!!!!!!!!!!!!!!! SIMULATION FAILED !!!!!!!!!!!!!!!!!");
            $display("-----------------------------------------------------");
        end
    end
endtask

task fifo_write;
    input [31:0] burst;
    integer i0;
    begin
		waddr_i <= {WADDR_WIDTH{1'b0}};
        for(i0 = 0; i0 < burst; i0 = i0 + 1) begin
            if(!full_o) begin
                wr_en_i <= 1'b1;
                wr_data_i <= din[WDATA_WIDTH-1:0];
                @(posedge wr_clk_i);
                waddr_i <= (waddr_i == WADDR_DEPTH-1) ? {WADDR_WIDTH{1'b0}} : waddr_i + 1'b1;
            end
            else begin
                wr_en_i <= 1'b0;
                wr_data_i <= {WDATA_WIDTH{1'b0}};
                @(posedge wr_clk_i);
            end
        end
        wr_en_i <= 1'b0;
        wr_data_i <= {WDATA_WIDTH{1'b0}};
    end
endtask

task fifo_read;
    input [31:0] burst;
    integer i0;
    begin
		raddr_i	<= {RADDR_WIDTH{1'b0}};
        for(i0 = 0; i0 < burst; i0 = i0 + 1) begin
            if(!empty_o) begin
                rd_en_i <= 1'b1;
                @(posedge rd_clk_i);
                raddr_i <= (raddr_i == RADDR_DEPTH-1) ? {RADDR_WIDTH{1'b0}} : raddr_i + 1'b1;
            end
            else begin
                rd_en_i <= 1'b0;
                @(posedge rd_clk_i);
            end
        end
        rd_en_i <= 1'b0;
        @(posedge rd_clk_i);
        if(REGMODE == "reg") @(posedge rd_clk_i);
    end
endtask

//------------------------------------------------------------------------------
// Function Definition
//------------------------------------------------------------------------------

function [31:0] clog2;
  input [31:0] value;
  reg   [31:0] num;
  begin
    num = value - 1;
    for (clog2=0; num>0; clog2=clog2+1) num = num>>1;
  end
endfunction

endmodule
`endif

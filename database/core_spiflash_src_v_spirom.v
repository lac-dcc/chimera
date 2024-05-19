// This program was cloned from: https://github.com/ultraembedded/core_spiflash
// License: GNU Lesser General Public License v2.1

//-----------------------------------------------------------------
//                     SPI-Flash XIP Interface
//                              V0.2
//              github.com/ultraembedded/core_spiflash
//                       Copyright 2019-2021
//
//                 Email: admin@ultra-embedded.com
//
//                       License: LGPL
//-----------------------------------------------------------------
//
// This source file may be used and distributed without         
// restriction provided that this copyright statement is not    
// removed from the file and that any derivative work contains  
// the original copyright notice and the associated disclaimer. 
//
// This source file is free software; you can redistribute it   
// and/or modify it under the terms of the GNU Lesser General   
// Public License as published by the Free Software Foundation; 
// either version 2.1 of the License, or (at your option) any   
// later version.
//
// This source is distributed in the hope that it will be       
// useful, but WITHOUT ANY WARRANTY; without even the implied   
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      
// PURPOSE.  See the GNU Lesser General Public License for more 
// details.
//
// You should have received a copy of the GNU Lesser General    
// Public License along with this source; if not, write to the 
// Free Software Foundation, Inc., 59 Temple Place, Suite 330, 
// Boston, MA  02111-1307  USA
//-----------------------------------------------------------------

module spirom
(
    // Inputs
     input           clk_i
    ,input           rst_i
    ,input           inport_awvalid_i
    ,input  [ 31:0]  inport_awaddr_i
    ,input  [  3:0]  inport_awid_i
    ,input  [  7:0]  inport_awlen_i
    ,input  [  1:0]  inport_awburst_i
    ,input           inport_wvalid_i
    ,input  [ 31:0]  inport_wdata_i
    ,input  [  3:0]  inport_wstrb_i
    ,input           inport_wlast_i
    ,input           inport_bready_i
    ,input           inport_arvalid_i
    ,input  [ 31:0]  inport_araddr_i
    ,input  [  3:0]  inport_arid_i
    ,input  [  7:0]  inport_arlen_i
    ,input  [  1:0]  inport_arburst_i
    ,input           inport_rready_i
    ,input           spi_miso_i

    // Outputs
    ,output          inport_awready_o
    ,output          inport_wready_o
    ,output          inport_bvalid_o
    ,output [  1:0]  inport_bresp_o
    ,output [  3:0]  inport_bid_o
    ,output          inport_arready_o
    ,output          inport_rvalid_o
    ,output [ 31:0]  inport_rdata_o
    ,output [  1:0]  inport_rresp_o
    ,output [  3:0]  inport_rid_o
    ,output          inport_rlast_o
    ,output          spi_clk_o
    ,output          spi_mosi_o
    ,output          spi_cs_o
);



parameter tSLCH_CYCLES = 1; // Select to SPI clock rising (e.g. 4nS)
parameter tSLSL_CYCLES = 4; // Deselect to next select (e.g. 50nS)
parameter CLK_DIV      = 8; // Clock divisor (0 - 65535) - spi_clk = clk_i / (1 + CLK_DIV)

//-----------------------------------------------------------------
// AXI Interface
//-----------------------------------------------------------------
wire          inport_cvalid_w;
wire [ 31:0]  inport_caddr_w;
wire [ 31:0]  inport_cdata_w;
wire [  3:0]  inport_cstrb_w;
wire [  3:0]  inport_cid_w;
wire [  7:0]  inport_clen_w;
wire          inport_cwrite_w;
wire          inport_cfirst_w;
wire          inport_clast_w;
wire [  2:0]  inport_ctype_w;
wire          inport_rready_w;
wire          inport_cready_w;
wire          inport_cburstok_w;
wire          inport_rvalid_w;
wire          inport_rwrite_w;
wire [ 31:0]  inport_rdata_w;
wire [  1:0]  inport_rresp_w;
wire [  3:0]  inport_rid_w;
wire          inport_rlast_w;

spirom_axi
u_axi
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    ,.axi_awvalid_i(inport_awvalid_i)
    ,.axi_awaddr_i(inport_awaddr_i)
    ,.axi_awid_i(inport_awid_i)
    ,.axi_awlen_i(inport_awlen_i)
    ,.axi_awburst_i(inport_awburst_i)
    ,.axi_wvalid_i(inport_wvalid_i)
    ,.axi_wdata_i(inport_wdata_i)
    ,.axi_wstrb_i(inport_wstrb_i)
    ,.axi_wlast_i(inport_wlast_i)
    ,.axi_bready_i(inport_bready_i)
    ,.axi_arvalid_i(inport_arvalid_i)
    ,.axi_araddr_i(inport_araddr_i)
    ,.axi_arid_i(inport_arid_i)
    ,.axi_arlen_i(inport_arlen_i)
    ,.axi_arburst_i(inport_arburst_i)
    ,.axi_rready_i(inport_rready_i)
    ,.axi_awready_o(inport_awready_o)
    ,.axi_wready_o(inport_wready_o)
    ,.axi_bvalid_o(inport_bvalid_o)
    ,.axi_bresp_o(inport_bresp_o)
    ,.axi_bid_o(inport_bid_o)
    ,.axi_arready_o(inport_arready_o)
    ,.axi_rvalid_o(inport_rvalid_o)
    ,.axi_rdata_o(inport_rdata_o)
    ,.axi_rresp_o(inport_rresp_o)
    ,.axi_rid_o(inport_rid_o)
    ,.axi_rlast_o(inport_rlast_o)

    ,.outport_cvalid_o(inport_cvalid_w)
    ,.outport_caddr_o(inport_caddr_w)
    ,.outport_cdata_o(inport_cdata_w)
    ,.outport_cstrb_o(inport_cstrb_w)
    ,.outport_cid_o(inport_cid_w)
    ,.outport_clen_o(inport_clen_w)
    ,.outport_cwrite_o(inport_cwrite_w)
    ,.outport_cfirst_o(inport_cfirst_w)
    ,.outport_clast_o(inport_clast_w)
    ,.outport_ctype_o(inport_ctype_w)
    ,.outport_rready_o(inport_rready_w)
    ,.outport_cready_i(inport_cready_w)
    ,.outport_cburstok_i(inport_cburstok_w)
    ,.outport_rvalid_i(inport_rvalid_w)
    ,.outport_rwrite_i(inport_rwrite_w)
    ,.outport_rdata_i(inport_rdata_w)
    ,.outport_rresp_i(inport_rresp_w)
    ,.outport_rid_i(inport_rid_w)
    ,.outport_rlast_i(inport_rlast_w)
);

//-----------------------------------------------------------------
// Bus Interface
//-----------------------------------------------------------------
wire [ 31:0]  ram_addr_w;
wire [  3:0]  ram_wr_w;
wire          ram_rd_w;
wire          ram_accept_w;
wire [ 7:0]   ram_len_w;
wire [ 31:0]  ram_read_data_w;
wire          ram_ack_w;

// NOTE: Writes are accepted and actioned as reads to keep the SM simple,
// however the converter will error write transactions.
wire          ram_req_w = (ram_wr_w != 4'b0) | ram_rd_w;

spirom_sbm
u_bus
(
     .clk_i(clk_i)
    ,.rst_i(rst_i)

    // Bus
    ,.inport_cvalid_i(inport_cvalid_w)
    ,.inport_caddr_i(inport_caddr_w)
    ,.inport_cdata_i(inport_cdata_w)
    ,.inport_cstrb_i(inport_cstrb_w)
    ,.inport_cid_i(inport_cid_w)
    ,.inport_clen_i(inport_clen_w)
    ,.inport_cwrite_i(inport_cwrite_w)
    ,.inport_cfirst_i(inport_cfirst_w)
    ,.inport_clast_i(inport_clast_w)
    ,.inport_ctype_i(inport_ctype_w)
    ,.inport_rready_i(inport_rready_w)
    ,.inport_cready_o(inport_cready_w)
    ,.inport_cburstok_o(inport_cburstok_w)
    ,.inport_rvalid_o(inport_rvalid_w)
    ,.inport_rwrite_o(inport_rwrite_w)
    ,.inport_rdata_o(inport_rdata_w)
    ,.inport_rresp_o(inport_rresp_w)
    ,.inport_rid_o(inport_rid_w)
    ,.inport_rlast_o(inport_rlast_w)
    
    // RAM interface
    ,.ram_addr_o(ram_addr_w)
    ,.ram_accept_i(ram_accept_w)
    ,.ram_wr_o(ram_wr_w)
    ,.ram_rd_o(ram_rd_w)
    ,.ram_len_o(ram_len_w)
    ,.ram_write_data_o()
    ,.ram_ack_i(ram_ack_w)
    ,.ram_error_i(1'b0)
    ,.ram_read_data_i(ram_read_data_w)
);

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------

// SPI
reg                         spi_start_r;
wire                        spi_done_w;
reg [7:0]                   spi_data_wr_r;
wire [7:0]                  spi_data_rd_w;

localparam STATE_W           = 3;
localparam STATE_IDLE        = 3'd0;
localparam STATE_CS_SELECT   = 3'd1;
localparam STATE_CMD         = 3'd2;
localparam STATE_ADDR1       = 3'd3;
localparam STATE_ADDR2       = 3'd4;
localparam STATE_ADDR3       = 3'd5;
localparam STATE_DATA        = 3'd6;
localparam STATE_CS_DESELECT = 3'd7;
reg [STATE_W-1:0]           state_q;
reg [STATE_W-1:0]           next_state_r;

reg [9:0]                   byte_count_q;
wire                        cs_blocked_w;

reg                         spi_reset_q;

// SPI Flash Commands
localparam SPI_CMD_READ      = 8'h03;
localparam SPI_CMD_RESET     = 8'hFF;

//-----------------------------------------------------------------
// Instantiation
//-----------------------------------------------------------------  

// SPI Master
spirom_master  
#(
    .CLK_DIV(CLK_DIV)
) 
u_spi
(
    // Clocking / Reset
    .clk_i(clk_i), 
    .rst_i(rst_i), 
    // Control & Status
    .start_i(spi_start_r), 
    .done_o(spi_done_w), 
    .busy_o(), 
    // Data
    .data_i(spi_data_wr_r), 
    .data_o(spi_data_rd_w), 
    // SPI interface
    .spi_clk_o(spi_clk_o), 
    .spi_mosi_o(spi_mosi_o),
    .spi_miso_i(spi_miso_i)
);

//-----------------------------------------------------------------
// Next State Logic
//-----------------------------------------------------------------
always @ *
begin
    next_state_r = state_q;

    case (state_q)
    //-------------------------------
    // STATE_IDLE
    //-------------------------------
    STATE_IDLE : 
    begin
        // Access request (and transfer in-active)
        if (ram_req_w || spi_reset_q)
            next_state_r = STATE_CS_SELECT;
    end
    //-------------------------------
    // STATE_CS_SELECT
    //-------------------------------
    STATE_CS_SELECT : 
    begin 
        if (!cs_blocked_w)
            next_state_r = STATE_CMD;
    end
    //-------------------------------
    // STATE_CMD
    //-------------------------------
    STATE_CMD :
        next_state_r = STATE_ADDR1;
    //-------------------------------
    // STATE_ADDR1
    //-------------------------------
    STATE_ADDR1 :
        next_state_r = spi_reset_q ? STATE_CS_DESELECT : STATE_ADDR2;
    //-------------------------------
    // STATE_ADDR2
    //-------------------------------
    STATE_ADDR2 :
        next_state_r = STATE_ADDR3;
    //-------------------------------
    // STATE_ADDR3
    //-------------------------------
    STATE_ADDR3 :
        next_state_r = STATE_DATA;
    //-------------------------------
    // STATE_DATA
    //-------------------------------
    STATE_DATA :
    begin
        // Bytes remaining
        if (byte_count_q != 10'b0)
            next_state_r = STATE_DATA;
        // Last byte
        else
            next_state_r = STATE_CS_DESELECT;
    end
    //-------------------------------
    // STATE_CS_DESELECT
    //-------------------------------
    STATE_CS_DESELECT : 
    begin
        if (!cs_blocked_w)
            next_state_r = STATE_IDLE;
    end
    default :
        ;
    endcase
end

// Update state
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    state_q <= STATE_IDLE;
else if (state_q == STATE_IDLE || state_q == STATE_CS_SELECT || state_q == STATE_CS_DESELECT || spi_done_w)
    state_q <= next_state_r;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    spi_reset_q <= 1'b1;
else if (state_q == STATE_CS_DESELECT)
    spi_reset_q <= 1'b0;

//-----------------------------------------------------------------
// SPI Tx
//-----------------------------------------------------------------
always @ *
begin
    spi_start_r   = 1'b0;
    spi_data_wr_r = 8'b0;

    case (state_q)
    //-------------------------------
    // STATE_CS_SELECT
    //-------------------------------
    STATE_CS_SELECT : 
    begin
        if (!cs_blocked_w)
        begin
            spi_start_r   = 1'b1;
            spi_data_wr_r = spi_reset_q ? SPI_CMD_RESET : SPI_CMD_READ;
        end
    end
    //-------------------------------
    // STATE_CMD
    //-------------------------------
    STATE_CMD :
    begin
        spi_start_r   = 1'b1;
        spi_data_wr_r = spi_reset_q ? SPI_CMD_RESET : ram_addr_w[23:16];
    end
    //-------------------------------
    // STATE_ADDR1
    //-------------------------------
    STATE_ADDR1 :
    begin
        spi_start_r   = ~spi_reset_q;
        spi_data_wr_r = ram_addr_w[15:8];
    end
    //-------------------------------
    // STATE_ADDR2
    //-------------------------------
    STATE_ADDR2 :
    begin
        spi_start_r   = 1'b1;
        spi_data_wr_r = ram_addr_w[7:0];
    end
    //-------------------------------
    // STATE_ADDR3
    //-------------------------------
    STATE_ADDR3 :
    begin
        spi_start_r   = 1'b1;
        spi_data_wr_r = 8'hFF;
    end
    //-------------------------------
    // STATE_DATA
    //-------------------------------
    STATE_DATA : 
    begin 
        if (byte_count_q != 10'b0)
        begin
            spi_start_r   = 1'b1;
            spi_data_wr_r = 8'hFF;
        end
    end
    default :
        ;
    endcase
end

//-----------------------------------------------------------------
// SPI Rx
//-----------------------------------------------------------------
reg [31:0] data_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    data_q <= 32'b0;
else if (state_q == STATE_DATA && spi_done_w)
    data_q  <= {spi_data_rd_w, data_q[31:8]};

assign ram_read_data_w = data_q;

//-----------------------------------------------------------------
// SPI Chip Select
//-----------------------------------------------------------------
reg       spi_ss_q;
reg [7:0] cs_delay_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    spi_ss_q   <= 1'b1;
    cs_delay_q <= 8'b0;
end
else if (state_q == STATE_IDLE)
    cs_delay_q <= tSLCH_CYCLES;
else if (state_q == STATE_CS_SELECT && cs_blocked_w)
begin
    spi_ss_q   <= 1'b0;
    cs_delay_q <= cs_delay_q - 8'd1;
end
else if (state_q == STATE_ADDR1 && spi_reset_q && spi_done_w)
    cs_delay_q <= tSLSL_CYCLES;
else if (state_q == STATE_DATA && byte_count_q == 10'b0 && spi_done_w)
    cs_delay_q <= tSLSL_CYCLES;
else if (state_q == STATE_CS_DESELECT && cs_blocked_w)
begin
    spi_ss_q   <= 1'b1;
    cs_delay_q <= cs_delay_q - 8'd1;
end

assign cs_blocked_w = (cs_delay_q != 8'b0);

assign spi_cs_o = spi_ss_q;

//-----------------------------------------------------------------
// Data ready
//-----------------------------------------------------------------
reg ack_q;

always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    ack_q <= 1'b0;
else if (state_q == STATE_DATA && spi_done_w)
    ack_q  <= (byte_count_q[1:0] == 2'b00);
else
    ack_q  <= 1'b0;

assign ram_ack_w = ack_q;

//-----------------------------------------------------------------
// Byte count
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    byte_count_q <= 10'b0;
else if (state_q == STATE_ADDR3)
    byte_count_q <= {ram_len_w, 2'b11};
else if (state_q == STATE_DATA && spi_done_w)
    byte_count_q <= byte_count_q - 10'd1;

//-----------------------------------------------------------------
// Combinatorial
//-----------------------------------------------------------------    
assign ram_accept_w    = ((state_q == STATE_ADDR3) ||
                         (state_q == STATE_DATA && (byte_count_q != 10'b0 && byte_count_q[1:0] == 2'b00))) &&
                         spi_done_w && !spi_reset_q;

endmodule


module spirom_master
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
    parameter CLK_DIV = 32
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    input         clk_i,
    input         rst_i,
    input         start_i,
    output        done_o,
    output        busy_o,
    input [7:0]   data_i,
    output [7:0]  data_o,
    output        spi_clk_o,
    output        spi_mosi_o,
    input         spi_miso_i
);

//-----------------------------------------------------------------
// Registers
//-----------------------------------------------------------------
reg        active_q;
reg [3:0]  bit_count_q;
reg [7:0]  shift_reg_q;
reg [15:0] clk_div_q;
reg        done_q;

// Xilinx placement pragmas:
//synthesis attribute IOB of spi_clk_q is "TRUE"
//synthesis attribute IOB of spi_mosi_q is "TRUE"
reg   spi_clk_q;
reg   spi_mosi_q;

//-----------------------------------------------------------------
// Implementation
//-----------------------------------------------------------------
// Something to do, SPI enabled...
wire start_w = start_i & ~active_q;

// SPI Clock Generator
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
    clk_div_q <= 16'd0;
else if (start_w || clk_div_q == 16'd0)
    clk_div_q <= CLK_DIV;
else
    clk_div_q <= clk_div_q - 16'd1;

wire clk_en_w = (clk_div_q == 16'd0);

//-----------------------------------------------------------------
// Sample, Drive pulse generation (CPOL=0, CHPA=0)
//-----------------------------------------------------------------
reg sample_r;
reg drive_r;

always @ *
begin
    sample_r = 1'b0;
    drive_r  = 1'b0;

    // SPI = IDLE
    if (start_w)    
        drive_r  = 1'b1; // Drive initial data (CPHA=0)
    // SPI = ACTIVE
    else if (active_q && clk_en_w)
    begin
        // Sample
        // CPHA=0, sample on the first edge
        if (bit_count_q[0] == 1'b0)
            sample_r = 1'b1;
        // Drive (CPHA = 0)
        else 
            drive_r = (bit_count_q != 4'b0) && (bit_count_q != 4'd15);
    end
end

//-----------------------------------------------------------------
// Shift register
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    shift_reg_q    <= 8'b0;
    spi_clk_q      <= 1'b0;
    spi_mosi_q     <= 1'b0;
end
else
begin
    // SPI = IDLE
    if (start_w)
    begin
        spi_clk_q      <= 1'b0;

        // CPHA = 0
        spi_mosi_q     <= data_i[7];
        shift_reg_q    <= {data_i[6:0], 1'b0};
    end
    // SPI = ACTIVE
    else if (active_q && clk_en_w)
    begin
        // Toggle SPI clock output
        spi_clk_q <= ~spi_clk_q;

        // Drive MOSI
        if (drive_r)
        begin
            spi_mosi_q  <= shift_reg_q[7];
            shift_reg_q <= {shift_reg_q[6:0],1'b0};
        end
        // Sample MISO
        else if (sample_r)
            shift_reg_q[0] <= spi_miso_i;
    end
end

//-----------------------------------------------------------------
// Bit counter
//-----------------------------------------------------------------
always @ (posedge clk_i or posedge rst_i)
if (rst_i)
begin
    bit_count_q    <= 4'b0;
    active_q       <= 1'b0;
    done_q         <= 1'b0;
end
else if (start_w)
begin
    bit_count_q    <= 4'b0;
    active_q       <= 1'b1;
    done_q         <= 1'b0;
end
else if (active_q && clk_en_w)
begin
    // End of SPI transfer reached
    if (bit_count_q == 4'd15)
    begin
        // Go back to IDLE active_q
        active_q  <= 1'b0;

        // Set transfer complete flags
        done_q   <= 1'b1;
    end
    // Increment cycle counter
    else 
        bit_count_q <= bit_count_q + 4'd1;
end
else
    done_q         <= 1'b0;

assign spi_clk_o  = spi_clk_q;
assign spi_mosi_o = spi_mosi_q;
assign done_o     = done_q;
assign busy_o     = active_q;
assign data_o     = shift_reg_q;




endmodule

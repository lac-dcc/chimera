//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bu_write_addr_generator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module hbm_dummy_read
# (
    parameter ENGINE_ID       = 0  ,
    parameter ADDR_WIDTH      = 33 ,
    parameter DATA_WIDTH      = 256,  
    parameter ID_WIDTH        = 5  
)
(
    input  wire                   clk,    
    input  wire                   rst_n, 

    input  wire                   start_read,
    input  wire  [32-1:0]         read_ops,
    input  wire  [32-1:0]         stride,
    input  wire  [ADDR_WIDTH-1:0] init_addr,
    input  wire  [16-1:0]           mem_burst_size,

    /////////////////////////Read Address///////////////////////// 
    output wire                       m_axi_ARVALID , //rd address valid
    output reg [ADDR_WIDTH - 1:0] m_axi_ARADDR  , //rd byte address
    output reg   [ID_WIDTH - 1:0] m_axi_ARID    , //rd address id
    output reg              [7:0] m_axi_ARLEN   , //rd burst=awlen+1,
    output reg              [2:0] m_axi_ARSIZE  , //rd 3'b101, 32B
    output reg              [1:0] m_axi_ARBURST , //rd burst type: 01 (INC), 00 (FIXED)
    output reg              [1:0] m_axi_ARLOCK  , //rd no
    output reg              [3:0] m_axi_ARCACHE , //rd no
    output reg              [2:0] m_axi_ARPROT  , //rd no
    output reg              [3:0] m_axi_ARQOS   , //rd no
    output reg              [3:0] m_axi_ARREGION, //rd no
    input  wire                       m_axi_ARREADY , //rd ready to accept address.

    /////////////////////////  Read Data  /////////////////////////
    input  wire                    m_axi_RVALID, //rd data valid
    input  wire [DATA_WIDTH - 1:0] m_axi_RDATA , //rd data 
    input  wire                    m_axi_RLAST , //rd data last
    input  wire   [ID_WIDTH - 1:0] m_axi_RID   , //rd data id
    input  wire              [1:0] m_axi_RRESP , //rd data status. 
    output wire                    m_axi_RREADY,

    /////////////////////////  Dn Data  ///////////////////////
    output wire                     dn_vld, 
    output wire  [DATA_WIDTH - 1:0] dn_dat 
);

reg    [32-1:0]         read_ops_r;
reg    [32-1:0]         stride_r;
reg    [32-1:0]         read_ops_counter;
reg    [ADDR_WIDTH-1:0] offset_addr;
reg    [15:0] mem_burst_size_r ;
reg           ARVALID_r;
reg     [4-1:0]  AXI_SEL_ADDR;
reg  [ADDR_WIDTH-1:0] init_addr_r;
always @(posedge clk) 
begin
    mem_burst_size_r <= mem_burst_size;
    m_axi_ARID     <= {ID_WIDTH{1'b0}};
    m_axi_ARLEN    <= (mem_burst_size_r>>($clog2(DATA_WIDTH)))-8'b1;
    m_axi_ARSIZE   <= (DATA_WIDTH==256)? 3'b101:3'b110; //just for 256-bit or 512-bit.
    m_axi_ARBURST  <= 2'b01;   // INC, not FIXED (00)
    m_axi_ARLOCK   <= 2'b00;   // Normal memory operation
    m_axi_ARCACHE  <= 4'b0000; // 4'b0011: Normal, non-cacheable, modifiable, bufferable (Xilinx recommends)
    m_axi_ARPROT   <= 3'b010;  // 3'b000: Normal, secure, data
    m_axi_ARQOS    <= 4'b0000; // Not participating in any Qos schem, a higher value indicates a higher priority transaction
    m_axi_ARREGION <= 4'b0000; // Region indicator, default to 0
    AXI_SEL_ADDR   <= ENGINE_ID;
    read_ops_r     <= read_ops;
    stride_r       <= stride;
    init_addr_r    <= {1'b0, AXI_SEL_ADDR, init_addr[27:0]};
end

assign m_axi_RREADY = 1'b1;
assign  m_axi_ARVALID = 1'b0;
// =========================================================================== //
// FSM for Control
// =========================================================================== //


always @(posedge clk)
begin
    m_axi_ARADDR <= 0;
end

/*
localparam idle_mode = 2'b00;
localparam read_mode = 2'b01;

reg [2-1:0]                    state;

always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    state <= idle_mode;
    read_ops_counter <= 0;
    offset_addr <= {ADDR_WIDTH{1'b0}};
    ARVALID_r <= 1'b0;
end
else begin
    if (state == idle_mode) begin // positive
        ARVALID_r <= 1'b0;
        if (start_read) begin
            read_ops_counter <= 0;
            offset_addr <= {ADDR_WIDTH{1'b0}};
            state <= read_mode;
        end
    end
    else if (state == read_mode) begin
        ARVALID_r <= 1'b1;
        m_axi_ARADDR <= init_addr_r + offset_addr;
        if (m_axi_ARREADY & m_axi_ARVALID)
        begin
            offset_addr <= offset_addr + stride_r; 
            read_ops_counter <= read_ops_counter + 1'b1;
            if (read_ops_counter >= (read_ops_r-1))begin
                state <= idle_mode; 
                ARVALID_r  <= 1'b0;
            end
            else
                state <= read_mode; 
        end
    end
end
*/
assign dn_vld = m_axi_RVALID;
assign dn_dat = m_axi_RDATA;

endmodule

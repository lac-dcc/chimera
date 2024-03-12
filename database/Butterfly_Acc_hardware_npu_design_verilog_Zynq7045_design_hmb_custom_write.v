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


module hbm_custom_write
# (
    parameter ENGINE_ID       = 0  ,
    parameter ADDR_WIDTH      = 33 ,
    parameter DATA_WIDTH      = 256,  
    parameter ID_WIDTH        = 5  
)
(
    input  wire                   clk,    
    input  wire                   rst_n, 

    input  wire                   start_write,
    input  wire  [32-1:0]         write_ops,
    input  wire  [32-1:0]         stride,
    input  wire  [ADDR_WIDTH-1:0] init_addr,
    input  wire  [15:0]           mem_burst_size,
    input wire   [DATA_WIDTH - 1:0] up_dat,
    input wire                    is_auto_write,

    /////////////////////////Write Address///////////////////////// 
    output wire                       m_axi_AWVALID , //write address valid
    output reg [ADDR_WIDTH - 1:0] m_axi_AWADDR  , //write byte address
    output reg   [ID_WIDTH - 1:0] m_axi_AWID    , //write address id
    output reg              [7:0] m_axi_AWLEN   , //write burst=awlen+1,
    output reg              [2:0] m_axi_AWSIZE  , //write 3'b101, 32B
    output reg              [1:0] m_axi_AWBURST , //write burst type: 01 (INC), 00 (FIXED)
    output reg              [1:0] m_axi_AWLOCK  , //write no
    output reg              [3:0] m_axi_AWCACHE , //write no
    output reg              [2:0] m_axi_AWPROT  , //write no
    output reg              [3:0] m_axi_AWQOS   , //write no
    output reg              [3:0] m_axi_AWREGION, //write no
    input  wire                       m_axi_AWREADY , //write ready to accept address.

    ///////////////////////// Write Data  /////////////////////////
    output wire                     m_axi_WVALID, //write data valid
    output reg  [DATA_WIDTH - 1:0] m_axi_WDATA , //write data 
    output reg [DATA_WIDTH/8-1:0] m_axi_WSTRB,  //wr data strob
    output wire                     m_axi_WLAST , //write data last
    output reg [ID_WIDTH - 1:0] m_axi_WID,      //wr data id
    input  wire                   m_axi_WREADY,

    input wire                    m_axi_BVALID,
    input [1:0]               m_axi_BRESP,
    input [ID_WIDTH - 1:0]    m_axi_BID,
    output wire                   m_axi_BREADY
);

reg    [32-1:0]         write_ops_r;
reg    [32-1:0]         stride_r;
reg    [32-1:0]         addr_write_ops_counter;
reg    [ADDR_WIDTH-1:0] offset_addr;
reg    [15:0] mem_burst_size_r ;
reg           AWVALID_r;
reg           WVALID_r;
reg     [4-1:0]  AXI_SEL_ADDR;
reg  [ADDR_WIDTH-1:0] init_addr_r;
always @(posedge clk)
begin
    mem_burst_size_r <= mem_burst_size;
    m_axi_AWID  <= {ID_WIDTH{1'b0}};
    m_axi_AWLEN <= (mem_burst_size_r>>($clog2(DATA_WIDTH)))-8'b1;
    m_axi_AWSIZE   <= (DATA_WIDTH == 256)? 3'b101:3'b110; //just for 256-bit or 512-bit.
    m_axi_AWBURST  <= 2'b01;   // INC, not FIXED (00)
    m_axi_AWLOCK   <= 2'b00;   // Normal memory operation
    m_axi_AWCACHE  <= 4'b0000; //4'b0011; // Normal, non-cacheable, modifiable, bufferable (Xilinx recommends)
    m_axi_AWPROT   <= 3'b010; //3'b000;  // Normal, secure, data
    m_axi_AWQOS    <= 4'b0000; // Not participating in any Qos schem, a higher value indicates a higher priority transaction
    m_axi_AWREGION <= 4'b0000; // Region indicator, default to 0
    
    if (is_auto_write) m_axi_WDATA <= up_dat;        //data port
    else m_axi_WDATA <= {{(DATA_WIDTH-1){1'b0}}, 1'b1};
    m_axi_WSTRB <= {(DATA_WIDTH/8){1'b1}};
    m_axi_WID   <= {ID_WIDTH{1'b0}};          //maybe play with it.
    AXI_SEL_ADDR   <= ENGINE_ID;
    write_ops_r     <= write_ops;
    stride_r       <= stride;
    init_addr_r    <= {1'b0, AXI_SEL_ADDR, init_addr[27:0]};
end

assign m_axi_BREADY = 1'b1;

assign  m_axi_AWVALID = AWVALID_r;

// =========================================================================== //
// FSM for Control
// =========================================================================== //

localparam idle_mode = 2'b00;
localparam write_mode = 2'b01;
localparam wait_mode = 2'b01;

reg [2-1:0]                    state;
reg                       is_in_progress; 
///////////////////////// Control for write counter  ///////////////////////
reg             [63:0] write_ops_counter;
reg             [7 :0] burst_inc;
reg                    wr_data_done;
always @(posedge clk)
begin
    if (!rst_n) begin
        burst_inc    <= 8'b0;
        write_ops_counter <= 64'b0;
        wr_data_done <= 1'b0;
    end
    else if (start_write) begin
        burst_inc    <= 8'b0;
        wr_data_done <= 1'b0;
        write_ops_counter       <= 64'b0;
    end
    else if (is_in_progress) begin
        if (m_axi_WREADY & WVALID_r) begin
            burst_inc <= burst_inc + 8'b1;
            if (burst_inc == m_axi_AWLEN) begin
                burst_inc <= 8'b0;
                write_ops_counter <= write_ops_counter + 1'b1;
                if (write_ops_counter == (write_ops_r-1)) begin
                    wr_data_done <= 1'b1;
                end
            end
        end
    end
end
///////////////////////// Control for address write counter  ///////////////////////
always @(posedge clk or negedge rst_n)
if(!rst_n) begin
    state <= idle_mode;
    addr_write_ops_counter <= 0;
    offset_addr <= {ADDR_WIDTH{1'b0}};
    AWVALID_r <= 1'b0;
    WVALID_r <= 1'b0;
    is_in_progress <= 1'b0;
end
else begin
    if (state == idle_mode) begin // positive
        is_in_progress <= 1'b0;
        AWVALID_r <= 1'b0;
        WVALID_r <= 1'b0;
        if (start_write) begin
            addr_write_ops_counter <= 0;
            offset_addr <= {ADDR_WIDTH{1'b0}};
            state <= write_mode;
            is_in_progress <= 1'b1;
        end
    end
    else if (state == write_mode) begin
        is_in_progress <= 1'b1;
        AWVALID_r <= 1'b1;
        WVALID_r <= 1'b1;
        m_axi_AWADDR <= init_addr_r + offset_addr;
        if (m_axi_AWREADY & m_axi_AWVALID) begin
            offset_addr <= offset_addr + stride_r; 
            addr_write_ops_counter <= addr_write_ops_counter + 1'b1;
            if (addr_write_ops_counter >= (write_ops_r-1))begin
                AWVALID_r  <= 1'b0;
                if (wr_data_done) begin
                    state <= idle_mode;
                    is_in_progress <= 1'b0;
                end
                else begin
                    state <= wait_mode;
                    is_in_progress <= 1'b1;                  
                end
            end
        end
    end
    else if (state == wait_mode) begin // Wait until the last batch of burst length finish
        is_in_progress <= 1'b1;
        AWVALID_r <= 1'b0;
        WVALID_r <= 1'b1;
        if (wr_data_done) begin
            is_in_progress <= 1'b0;
            AWVALID_r <= 1'b0;
            WVALID_r <= 1'b0;
            state <= idle_mode;
        end
    end
end

assign m_axi_WLAST  = (burst_inc == m_axi_AWLEN) & WVALID_r;
// assign m_axi_WVALID = (write_ops_counter != write_ops_r) & WVALID_r;
assign m_axi_WVALID = (!wr_data_done) & WVALID_r;

assign dn_vld = m_axi_WVALID;
assign dn_dat = m_axi_WDATA;

endmodule

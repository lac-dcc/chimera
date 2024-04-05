`include "rmt_cpu_regs_defines.v"

//parameters to be added to the top module parameters
#(
    // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,
    parameter C_S_AXI_ADDR_WIDTH    = 32
)
//ports to be added to the top module ports
(
// Signals for AXI_IP and IF_REG (Added for debug purposes)
    // Slave AXI Ports
    input                                     S_AXI_ACLK,
    input                                     S_AXI_ARESETN,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    input                                     S_AXI_AWVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
    input                                     S_AXI_WVALID,
    input                                     S_AXI_BREADY,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    input                                     S_AXI_ARVALID,
    input                                     S_AXI_RREADY,
    output                                    S_AXI_ARREADY,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
    output     [1 : 0]                        S_AXI_RRESP,
    output                                    S_AXI_RVALID,
    output                                    S_AXI_WREADY,
    output     [1 :0]                         S_AXI_BRESP,
    output                                    S_AXI_BVALID,
    output                                    S_AXI_AWREADY
)


    // define registers
    wire     [`REG_VLAN_DROP_FLAGS_BITS]    vlan_drop_flags_reg;
    reg      [`REG_CTRL_TOKEN_BITS]    ctrl_token_reg;
    reg      [`REG_VLAN_1_CNT_BITS]    vlan_1_cnt_reg;
    reg      [`REG_VLAN_2_CNT_BITS]    vlan_2_cnt_reg;
    reg      [`REG_VLAN_3_CNT_BITS]    vlan_3_cnt_reg;

//Registers section
 rmt_cpu_regs
 #(
     .C_BASE_ADDRESS        (C_BASEADDR ),
     .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
     .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
 ) rmt_cpu_regs_inst
 (
   // General ports
    .clk                    (axis_aclk),
    .resetn                 (axis_resetn),
   // AXI Lite ports
    .S_AXI_ACLK             (S_AXI_ACLK),
    .S_AXI_ARESETN          (S_AXI_ARESETN),
    .S_AXI_AWADDR           (S_AXI_AWADDR),
    .S_AXI_AWVALID          (S_AXI_AWVALID),
    .S_AXI_WDATA            (S_AXI_WDATA),
    .S_AXI_WSTRB            (S_AXI_WSTRB),
    .S_AXI_WVALID           (S_AXI_WVALID),
    .S_AXI_BREADY           (S_AXI_BREADY),
    .S_AXI_ARADDR           (S_AXI_ARADDR),
    .S_AXI_ARVALID          (S_AXI_ARVALID),
    .S_AXI_RREADY           (S_AXI_RREADY),
    .S_AXI_ARREADY          (S_AXI_ARREADY),
    .S_AXI_RDATA            (S_AXI_RDATA),
    .S_AXI_RRESP            (S_AXI_RRESP),
    .S_AXI_RVALID           (S_AXI_RVALID),
    .S_AXI_WREADY           (S_AXI_WREADY),
    .S_AXI_BRESP            (S_AXI_BRESP),
    .S_AXI_BVALID           (S_AXI_BVALID),
    .S_AXI_AWREADY          (S_AXI_AWREADY),

   // Register ports
   .vlan_drop_flags_reg          (vlan_drop_flags_reg),
   .ctrl_token_reg          (ctrl_token_reg),
   .vlan_1_cnt_reg          (vlan_1_cnt_reg),
   .vlan_2_cnt_reg          (vlan_2_cnt_reg),
   .vlan_3_cnt_reg          (vlan_3_cnt_reg),
   // Global Registers - user can select if to use
   .cpu_resetn_soft(),//software reset, after cpu module
   .resetn_soft    (),//software reset to cpu module (from central reset management)
   .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
);
//registers logic, current logic is just a placeholder for initial compil, required to be changed by the user
always @(posedge axis_aclk)
	if (~resetn_sync) begin
        ctrl_token_reg <= #1    `REG_CTRL_TOKEN_DEFAULT;
        vlan_1_cnt_reg <= #1    `REG_VLAN_1_CNT_DEFAULT;
        vlan_2_cnt_reg <= #1    `REG_VLAN_2_CNT_DEFAULT;
        vlan_3_cnt_reg <= #1    `REG_VLAN_3_CNT_DEFAULT;
	end
	else begin
        ctrl_token_reg <= #1    `REG_CTRL_TOKEN_DEFAULT;
        vlan_1_cnt_reg <= #1    `REG_VLAN_1_CNT_DEFAULT;
        vlan_2_cnt_reg <= #1    `REG_VLAN_2_CNT_DEFAULT;
        vlan_3_cnt_reg <= #1    `REG_VLAN_3_CNT_DEFAULT;
        end


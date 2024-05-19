// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module DRAMReader(
    //AXI port
    input wire ACLK,
    input wire ARESETN,
    output reg [31:0] M_AXI_ARADDR,
    input wire M_AXI_ARREADY,
    output wire  M_AXI_ARVALID,
    input wire [63:0] M_AXI_RDATA,
    output wire M_AXI_RREADY,
    input wire [1:0] M_AXI_RRESP,
    input wire M_AXI_RVALID,
    input wire M_AXI_RLAST,
    output wire [3:0] M_AXI_ARLEN,
    output wire [1:0] M_AXI_ARSIZE,
    output wire [1:0] M_AXI_ARBURST,
    
    //Control config
    input wire CONFIG_VALID,
    output wire CONFIG_READY,
    input wire [31:0] CONFIG_START_ADDR,
    input wire [31:0] CONFIG_NBYTES,
    
    //RAM port
    input wire DATA_READY_DOWNSTREAM,
    output wire DATA_VALID,
    output wire [63:0] DATA
);

assign M_AXI_ARLEN = 4'b1111;
assign M_AXI_ARSIZE = 2'b11;
assign M_AXI_ARBURST = 2'b01;
parameter IDLE = 0, RWAIT = 1;
    
//ADDR logic
reg [31:0] a_count;
reg a_state;  
assign M_AXI_ARVALID = (a_state == RWAIT);
always @(posedge ACLK) begin
    if (ARESETN == 0) begin
        a_state <= IDLE;
        M_AXI_ARADDR <= 0;
        a_count <= 0;
    end else case(a_state)
        IDLE: begin
            if(CONFIG_VALID) begin
                M_AXI_ARADDR <= CONFIG_START_ADDR;
                a_count <= CONFIG_NBYTES[31:7];
                a_state <= RWAIT;
            end
        end
        RWAIT: begin
            if (M_AXI_ARREADY == 1) begin
                if(a_count - 1 == 0)
                    a_state <= IDLE;
                a_count <= a_count - 1;
                M_AXI_ARADDR <= M_AXI_ARADDR + 128; // Bursts are 128 bytes long
            end
        end
    endcase
end
    
//READ logic
reg [31:0] b_count;
reg r_state;
assign M_AXI_RREADY = (r_state == RWAIT) && DATA_READY_DOWNSTREAM;
always @(posedge ACLK) begin
    if (ARESETN == 0) begin
        r_state <= IDLE;
        b_count <= 0;
    end else case(r_state)
        IDLE: begin
            if(CONFIG_VALID) begin
                b_count <= {CONFIG_NBYTES[31:7],7'b0}; // round to nearest 128 bytes
                r_state <= RWAIT;
            end
        end
        RWAIT: begin
            if (M_AXI_RVALID && DATA_READY_DOWNSTREAM) begin
                //use M_AXI_RDATA
                if(b_count - 8 == 0)
                    r_state <= IDLE;
                b_count <= b_count - 8; // each valid cycle the bus provides 8 bytes
            end
        end
    endcase
end

assign DATA = M_AXI_RDATA;
assign DATA_VALID = M_AXI_RVALID && (r_state == RWAIT);
assign CONFIG_READY = (r_state == IDLE) && (a_state == IDLE);

endmodule // DRAMReader


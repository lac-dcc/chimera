
module Conf(
    input wire ACLK,
    input wire ARESETN,
    //AXI Inputs
    input wire [31:0] S_AXI_ARADDR,
    input wire [11:0] S_AXI_ARID,
    output wire S_AXI_ARREADY,
    input wire S_AXI_ARVALID,
    input wire [31:0] S_AXI_AWADDR,
    input wire [11:0] S_AXI_AWID,
    output wire S_AXI_AWREADY,
    input wire S_AXI_AWVALID,
    output wire [11:0] S_AXI_BID,
    input wire S_AXI_BREADY,
    output wire [1:0] S_AXI_BRESP,
    output wire S_AXI_BVALID,
    output wire [31:0] S_AXI_RDATA,
    output wire [11:0] S_AXI_RID,
    output wire S_AXI_RLAST,
    input wire S_AXI_RREADY,
    output wire [1:0] S_AXI_RRESP,
    output wire S_AXI_RVALID,
    input wire [31:0] S_AXI_WDATA,
    output wire S_AXI_WREADY,
    input wire [3:0] S_AXI_WSTRB,
    input wire S_AXI_WVALID,
    
    output wire CONFIG_VALID,
    input wire CONFIG_READY,
    output wire [31:0] CONFIG_CMD,
    output wire [31:0] CONFIG_SRC,
    output wire [31:0] CONFIG_DEST,
    output wire [31:0] CONFIG_LEN,
    output wire CONFIG_IRQ
    );

    //Convert Input signals to AXI lite, to avoid ID matching
    wire [31:0] LITE_ARADDR;
    wire LITE_ARREADY;
    wire LITE_ARVALID;
    wire [31:0] LITE_AWADDR;
    wire LITE_AWREADY;
    wire LITE_AWVALID;
    wire LITE_BREADY;
    reg [1:0] LITE_BRESP;
    wire LITE_BVALID;
    reg [31:0] LITE_RDATA;
    wire LITE_RREADY;
    reg [1:0] LITE_RRESP;
    wire LITE_RVALID;
    wire [31:0] LITE_WDATA;
    wire LITE_WREADY;
    wire [3:0] LITE_WSTRB;
    wire LITE_WVALID;
    
    ict106_axilite_conv axilite(
    .ACLK(ACLK),
    .ARESETN(ARESETN),
    .S_AXI_ARADDR(S_AXI_ARADDR), 
    .S_AXI_ARID(S_AXI_ARID),  
    .S_AXI_ARREADY(S_AXI_ARREADY), 
    .S_AXI_ARVALID(S_AXI_ARVALID), 
    .S_AXI_AWADDR(S_AXI_AWADDR), 
    .S_AXI_AWID(S_AXI_AWID), 
    .S_AXI_AWREADY(S_AXI_AWREADY), 
    .S_AXI_AWVALID(S_AXI_AWVALID), 
    .S_AXI_BID(S_AXI_BID), 
    .S_AXI_BREADY(S_AXI_BREADY), 
    .S_AXI_BRESP(S_AXI_BRESP), 
    .S_AXI_BVALID(S_AXI_BVALID), 
    .S_AXI_RDATA(S_AXI_RDATA), 
    .S_AXI_RID(S_AXI_RID), 
    .S_AXI_RLAST(S_AXI_RLAST), 
    .S_AXI_RREADY(S_AXI_RREADY), 
    .S_AXI_RRESP(S_AXI_RRESP), 
    .S_AXI_RVALID(S_AXI_RVALID), 
    .S_AXI_WDATA(S_AXI_WDATA), 
    .S_AXI_WREADY(S_AXI_WREADY), 
    .S_AXI_WSTRB(S_AXI_WSTRB), 
    .S_AXI_WVALID(S_AXI_WVALID),
       
    .M_AXI_ARADDR(LITE_ARADDR),
    .M_AXI_ARREADY(LITE_ARREADY),
    .M_AXI_ARVALID(LITE_ARVALID),
    .M_AXI_AWADDR(LITE_AWADDR),
    .M_AXI_AWREADY(LITE_AWREADY),
    .M_AXI_AWVALID(LITE_AWVALID),
    .M_AXI_BREADY(LITE_BREADY),
    .M_AXI_BRESP(LITE_BRESP),
    .M_AXI_BVALID(LITE_BVALID),
    .M_AXI_RDATA(LITE_RDATA),
    .M_AXI_RREADY(LITE_RREADY),
    .M_AXI_RRESP(LITE_RRESP),
    .M_AXI_RVALID(LITE_RVALID),
    .M_AXI_WDATA(LITE_WDATA),
    .M_AXI_WREADY(LITE_WREADY),
    .M_AXI_WSTRB(LITE_WSTRB),
    .M_AXI_WVALID(LITE_WVALID)
  );

   parameter ADDR_BASE = 32'd0;
   
parameter NREG = 4;
parameter W = 32;

reg [W-1:0] data[NREG-1:0];

parameter IDLE = 0, RWAIT = 1;
parameter OK = 2'b00, SLVERR = 2'b10;

reg [31:0] counter;

//READS
reg r_state = IDLE;
wire [1:0] r_select;
assign r_select  = LITE_ARADDR[3:2];
wire    ar_good;
assign ar_good = {LITE_ARADDR[31:4], 2'b00, LITE_ARADDR[1:0]} == ADDR_BASE;
assign LITE_ARREADY = (r_state == IDLE);
assign LITE_RVALID = (r_state == RWAIT);
always @(posedge ACLK) begin
    if(ARESETN == 0) begin
        r_state <= IDLE;
    end else case(r_state)
        IDLE: begin
            if(LITE_ARVALID) begin
                LITE_RRESP <= ar_good ? OK : SLVERR;
                LITE_RDATA <= (r_select == 2'b0) ? counter : data[r_select];
                r_state <= RWAIT;
            end
        end
        RWAIT: begin
            if(LITE_RREADY)
                r_state <= IDLE;
        end
    endcase
end 

//WRITES
reg w_state = IDLE;
reg [1:0] w_select_r;
reg w_wrotedata = 0;
reg w_wroteresp = 0;

wire [1:0] w_select;
assign w_select  = LITE_AWADDR[3:2];
wire    aw_good;
assign aw_good = {LITE_AWADDR[31:4], 2'b00, LITE_AWADDR[1:0]} == ADDR_BASE;

assign LITE_AWREADY = (w_state == IDLE);
assign LITE_WREADY = (w_state == RWAIT) && !w_wrotedata;
assign LITE_BVALID = (w_state == RWAIT) && !w_wroteresp;

always @(posedge ACLK) begin
    if(ARESETN == 0) begin
        w_state <= IDLE;
        w_wrotedata <= 0;
        w_wroteresp <= 0;
    end else case(w_state)
        IDLE: begin
            if(LITE_AWVALID) begin
                LITE_BRESP <= aw_good ? OK : SLVERR;
                w_select_r <= w_select;
                w_state <= RWAIT; 
                w_wrotedata <= 0;
                w_wroteresp <= 0;
            end
        end
        RWAIT: begin
            if (LITE_WREADY)
                data[w_select_r] <= LITE_WDATA;
            if((w_wrotedata || LITE_WVALID) && (w_wroteresp || LITE_BREADY)) begin
                w_wrotedata <= 0;
                w_wroteresp <= 0;
                w_state <= IDLE;
            end else if (LITE_WVALID)
                w_wrotedata <= 1;
            else if (LITE_BREADY)
                w_wroteresp <= 1;
        end
    endcase
end

reg v_state = IDLE;
assign CONFIG_VALID = (v_state == RWAIT);
always @(posedge ACLK) begin
    if (ARESETN == 0)
        v_state <= IDLE;
    else case(v_state)
        IDLE:
            if (LITE_WVALID && LITE_WREADY && w_select_r == 2'b00)
                v_state <= RWAIT;
        RWAIT:
            if (CONFIG_READY)
                v_state <= IDLE;
    endcase
end

assign CONFIG_CMD = data[0];
assign CONFIG_SRC = data[1];
assign CONFIG_DEST = data[2];
assign CONFIG_LEN = data[3];


//how many cycles does the operation take?
always @(posedge ACLK) begin
    if (ARESETN == 0)
        counter <= 0;
    else if (CONFIG_READY && CONFIG_VALID)
        counter <= 0;
    else if (!CONFIG_READY)
        counter <= counter + 1;
end

reg busy = 0;
reg busy_last = 0;
always @(posedge ACLK) begin
    if (ARESETN == 0) begin
        busy <= 0;
        busy_last <= 0;
    end else begin
        if (CONFIG_READY) begin
            busy <= CONFIG_VALID ? 1 : 0;
        end
        busy_last <= busy;
    end
end

assign CONFIG_IRQ = !busy;

endmodule // Conf


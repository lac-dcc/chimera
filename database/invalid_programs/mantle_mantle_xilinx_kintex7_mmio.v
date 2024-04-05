module MMIO_slave(
    input fclk,
    input rst_n,
    //AXI Inputs
    output S_AXI_ACLK,
    input [31:0] S_AXI_ARADDR,
    input [11:0] S_AXI_ARID,
    output S_AXI_ARREADY,
    input S_AXI_ARVALID,
    input [31:0] S_AXI_AWADDR,
    input [11:0] S_AXI_AWID,
    output S_AXI_AWREADY,
    input S_AXI_AWVALID,
    output [11:0] S_AXI_BID,
    input S_AXI_BREADY,
    output [1:0] S_AXI_BRESP,
    output S_AXI_BVALID,
    
    output [31:0] S_AXI_RDATA,
    output [11:0] S_AXI_RID,
    output S_AXI_RLAST,
    input S_AXI_RREADY,
    output [1:0] S_AXI_RRESP,
    output S_AXI_RVALID,
    input [31:0] S_AXI_WDATA,
    output S_AXI_WREADY,
    input [3:0] S_AXI_WSTRB,
    input S_AXI_WVALID,
    

    // MMIO regs
    output [31:0] MMIO_CMD,
    output [31:0] MMIO_CAM0_CMD,
    output [31:0] MMIO_CAM1_CMD,
    output [31:0] MMIO_FRAME_BYTES0,
    output [31:0] MMIO_TRIBUF_ADDR0,
    output [31:0] MMIO_FRAME_BYTES1,
    output [31:0] MMIO_TRIBUF_ADDR1,
    output [31:0] MMIO_FRAME_BYTES2,
    output [31:0] MMIO_TRIBUF_ADDR2,
    
    output reg rw_cam0_cmd_valid,
    input [17:0] rw_cam0_resp,
    input rw_cam0_resp_valid,
   
    output reg rw_cam1_cmd_valid,
    input [17:0] rw_cam1_resp,
    input rw_cam1_resp_valid,
    
    output MMIO_IRQ
    );

    assign S_AXI_ACLK = fclk;
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
    
    wire MMIO_READY;
    assign MMIO_READY = 1;
    
    ict106_axilite_conv axilite(
    .ACLK(S_AXI_ACLK),
    .ARESETN(rst_n),
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
    function integer clog2;
       input integer value;
       
       begin  
          value = value-1;
          for (clog2=0; value>0; clog2=clog2+1)
             value = value>>1;
       end  
       
    endfunction

    `include "macros.vh"

    parameter MMIO_SIZE = `MMIO_SIZE;

    parameter [31:0] MMIO_STARTADDR = 32'h7000_0000;
    parameter W = 32;


    //This will only work on Verilog 2005
    localparam MMIO_BITS = clog2(MMIO_SIZE);

    reg [W-1:0] data[MMIO_SIZE-1:0];

    parameter IDLE = 0, RWAIT = 1;
    parameter OK = 2'b00, SLVERR = 2'b10;


    //READS
    reg r_state;
    wire [MMIO_BITS-1:0] r_select;
    assign r_select  = LITE_ARADDR[MMIO_BITS+1:2];
    assign ar_good = {LITE_ARADDR[31:(2+MMIO_BITS)], {MMIO_BITS{1'b0}}, LITE_ARADDR[1:0]} == MMIO_STARTADDR;
    assign LITE_ARREADY = (r_state == IDLE);
    assign LITE_RVALID = (r_state == RWAIT);

    //TODO 
    assign  cam0_cmd_write = (w_state==RWAIT) && LITE_WREADY && (w_select_r==`MMIO_CAM_CMD(0));


    // Only need to specify read only registers
    reg [31:0] read_data;
    always @(*) begin
        case(r_select)
            `MMIO_DEBUG(0) : read_data = debug0;
            `MMIO_DEBUG(1) : read_data = debug1;
            `MMIO_DEBUG(2) : read_data = debug2;
            `MMIO_DEBUG(3) : read_data = debug3;
            `MMIO_CAM_RESP(0) : read_data = cam0_resp;
            `MMIO_CAM_RESP_CNT(0) : read_data = cam0_resp_cnt;
            `MMIO_CAM_RESP(1) : read_data = cam1_resp;
            `MMIO_CAM_RESP_CNT(1) : read_data = cam1_resp_cnt;
            default : read_data = data[r_select];
        endcase
    end

    // MMIO Mappings
    assign MMIO_CMD            = data[`MMIO_CMD             ];
    assign MMIO_CAM0_CMD       = data[`MMIO_CAM_CMD(0)      ];
    assign MMIO_CAM1_CMD       = data[`MMIO_CAM_CMD(1)      ];
    assign MMIO_FRAME_BYTES0   = data[`MMIO_FRAME_BYTES(0)  ];
    assign MMIO_TRIBUF_ADDR0   = data[`MMIO_TRIBUF_ADDR(0)  ];
    assign MMIO_FRAME_BYTES1   = data[`MMIO_FRAME_BYTES(1)  ];
    assign MMIO_TRIBUF_ADDR1   = data[`MMIO_TRIBUF_ADDR(1)  ];
    assign MMIO_FRAME_BYTES2   = data[`MMIO_FRAME_BYTES(2)  ];
    assign MMIO_TRIBUF_ADDR2   = data[`MMIO_TRIBUF_ADDR(2)  ];




    always @(posedge fclk) begin
        if(rst_n == 0) begin
            r_state <= IDLE;
        end else case(r_state)
            IDLE: begin
                if(LITE_ARVALID) begin
                    LITE_RRESP <= ar_good ? OK : SLVERR;
                    LITE_RDATA <= read_data;
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
    reg w_state;
    reg [MMIO_BITS-1:0] w_select_r;
    reg w_wrotedata;
    reg w_wroteresp;

    wire [MMIO_BITS-1:0] w_select;
    assign w_select  = LITE_AWADDR[MMIO_BITS+1:2];
    assign aw_good = {LITE_ARADDR[31:(2+MMIO_BITS)], {MMIO_BITS{1'b0}}, LITE_AWADDR[1:0]} == MMIO_STARTADDR;

    assign LITE_AWREADY = (w_state == IDLE);
    assign LITE_WREADY = (w_state == RWAIT) && !w_wrotedata;
    assign LITE_BVALID = (w_state == RWAIT) && !w_wroteresp;

    always @(posedge fclk) begin
        if(rst_n == 0) begin
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
                data[0] <= 0;
                if (LITE_WREADY) begin
                    data[w_select_r] <= LITE_WDATA;
                end
                if((w_wrotedata || LITE_WVALID) && (w_wroteresp || LITE_BREADY)) begin
                    w_wrotedata <= 0;
                    w_wroteresp <= 0;
                    w_state <= IDLE;
                end 
                else if (LITE_WVALID) begin
                    w_wrotedata <= 1;
                end
                else if (LITE_BREADY) begin
                    w_wroteresp <= 1;
                end
            end
        endcase
    end

    reg v_state;
    always @(posedge fclk) begin
        if (rst_n == 0)
            v_state <= IDLE;
        else case(v_state)
            IDLE:
                if (LITE_WVALID && LITE_WREADY && w_select_r == 2'b00)
                    v_state <= RWAIT;
            RWAIT:
                if (MMIO_READY)
                    v_state <= IDLE;
        endcase
    end


    // interrupts
    assign MMIO_IRQ = 0;

endmodule // Conf


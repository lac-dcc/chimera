
module vexriscv_wrapper(
    input             clk,
    input             reset_,

    output reg        mem_cmd_valid,
    input             mem_cmd_ready,
    output reg        mem_cmd_instr,
    output reg        mem_cmd_wr,
    output reg [31:0] mem_cmd_addr,
    output reg [31:0] mem_cmd_wdata,
    output reg [ 3:0] mem_cmd_be,

    input             mem_rsp_ready,
    input      [31:0] mem_rsp_rdata, 

    input      [31:0] irq
    );

    wire        iBus_cmd_valid;
    reg         iBus_cmd_ready;
    wire [31:0] iBus_cmd_payload_pc;
    wire        iBus_rsp_ready;
    wire        iBus_rsp_error;
    wire [31:0] iBus_rsp_inst;
    wire        dBus_cmd_valid;
    reg         dBus_cmd_ready;
    wire        dBus_cmd_payload_wr;
    wire [31:0] dBus_cmd_payload_address;
    wire [31:0] dBus_cmd_payload_data;
    wire [1:0]  dBus_cmd_payload_size;
    wire        dBus_rsp_ready;
    wire        dBus_rsp_error;
    wire [31:0] dBus_rsp_data;

    VexRiscv u_vexriscv(
        .clk(clk),
        .reset(!reset_),

        .iBus_cmd_valid(iBus_cmd_valid),
        .iBus_cmd_ready(iBus_cmd_ready),
        .iBus_cmd_payload_pc(iBus_cmd_payload_pc),

        .iBus_rsp_ready(iBus_rsp_ready),
        .iBus_rsp_error(iBus_rsp_error),
        .iBus_rsp_inst(iBus_rsp_inst),

        .dBus_cmd_valid(dBus_cmd_valid),
        .dBus_cmd_ready(dBus_cmd_ready),
        .dBus_cmd_payload_wr(dBus_cmd_payload_wr),
        .dBus_cmd_payload_address(dBus_cmd_payload_address),
        .dBus_cmd_payload_data(dBus_cmd_payload_data),
        .dBus_cmd_payload_size(dBus_cmd_payload_size),

        .dBus_rsp_ready(dBus_rsp_ready),
        .dBus_rsp_error(dBus_rsp_error),
        .dBus_rsp_data(dBus_rsp_data)
    );

    reg mem_rsp_pending;
    reg mem_rsp_pending_instr;

    always @(posedge clk) begin
        if (mem_rsp_pending) begin
            if (mem_rsp_ready) begin
                mem_rsp_pending         <= 1'b0;

                if (mem_cmd_valid && !mem_cmd_wr) begin
                    mem_rsp_pending         <= 1'b1;
                    mem_rsp_pending_instr   <= mem_cmd_instr;
                end
            end
        end
        else if (mem_cmd_valid && !mem_cmd_wr) begin
            mem_rsp_pending         <= 1'b1;
            mem_rsp_pending_instr   <= mem_cmd_instr;
        end

        if (!reset_) begin
            mem_rsp_pending         <= 1'b0;
            mem_rsp_pending_instr   <= 1'b0;
        end
    end

    assign iBus_rsp_ready   = mem_rsp_ready &&  mem_rsp_pending_instr;
    assign dBus_rsp_ready   = mem_rsp_ready && !mem_rsp_pending_instr;

`ifndef SYNTHESIS
    assign iBus_rsp_inst    = iBus_rsp_ready ? mem_rsp_rdata : {32{1'bz}};
    assign dBus_rsp_data    = dBus_rsp_ready ? mem_rsp_rdata : {32{1'bz}};
`else
    assign iBus_rsp_inst    = mem_rsp_rdata;
    assign dBus_rsp_data    = mem_rsp_rdata;
`endif

    assign iBus_rsp_error   = 1'b0;
    assign dBus_rsp_error   = 1'b0;

    always @* begin
        dBus_cmd_ready  = 1'b0;
        iBus_cmd_ready  = 1'b0;

        if (dBus_cmd_valid) begin
            mem_cmd_valid   = dBus_cmd_valid && !mem_rsp_pending;
            mem_cmd_instr   = 1'b0;
            mem_cmd_wr      = dBus_cmd_payload_wr;

            mem_cmd_addr    = dBus_cmd_payload_address;
            mem_cmd_be      = dBus_cmd_payload_size == 2'd0 ? (4'b0001 << dBus_cmd_payload_address[1:0]) :
                              dBus_cmd_payload_size == 2'd1 ? (4'b0011 << dBus_cmd_payload_address[1:0]) :
                              dBus_cmd_payload_size == 2'd2 ?  4'b1111 :
                                                               4'b1111 ;
            mem_cmd_wdata   = dBus_cmd_payload_data;

            dBus_cmd_ready  = mem_cmd_ready && !mem_rsp_pending;
        end
        else begin
            mem_cmd_valid   = iBus_cmd_valid && !(mem_rsp_pending && !mem_rsp_ready);
            mem_cmd_instr   = 1'b1;
            mem_cmd_wr      = 1'b0;

            mem_cmd_addr    = iBus_cmd_payload_pc;
            mem_cmd_be      = 4'd0;
            mem_cmd_wdata   = 32'd0;

            iBus_cmd_ready  = mem_cmd_ready && !(mem_rsp_pending && !mem_rsp_ready);
        end
    end

endmodule


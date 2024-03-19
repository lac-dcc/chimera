
`timescale 1ns / 1ps
`default_nettype none


module tb_scatter();
    localparam RATE    = 10.0;
    
    initial begin
        $dumpfile("tb_scatter.vcd");
        $dumpvars(0, tb_scatter);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    
    // 4サイクルかかる処理を4並列で実行して、スループットを１にする
    
    parameter   PORT_NUM   = 4;
    parameter   DATA_WIDTH = 16;
    parameter   LINE_SIZE  = 256;
    parameter   UNIT_SIZE  = (LINE_SIZE + (PORT_NUM-1)) / PORT_NUM;
    
    reg     [DATA_WIDTH-1:0]            src_data;
    reg                                 src_valid;
    wire                                src_ready;
    
    wire    [PORT_NUM*DATA_WIDTH-1:0]   port_s_data;
    wire    [PORT_NUM-1:0]              port_s_valid;
    wire    [PORT_NUM-1:0]              port_s_ready;
    
    wire    [PORT_NUM*DATA_WIDTH-1:0]   port_m_data;
    wire    [PORT_NUM-1:0]              port_m_valid;
    wire    [PORT_NUM-1:0]              port_m_ready;
    
    wire    [DATA_WIDTH-1:0]            sink_data;
    wire                                sink_valid;
    reg                                 sink_ready = 1;
    
    always @(posedge clk) begin
        sink_ready <= 1; // {$random};
    end
    
    jelly_data_scatter
            #(
                .PORT_NUM       (PORT_NUM),
                .DATA_WIDTH     (DATA_WIDTH),
                .LINE_SIZE      (LINE_SIZE),
                .UNIT_SIZE      (UNIT_SIZE)
            )
        i_data_scatter
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_data         (src_data),
                .s_valid        (src_valid),
                .s_ready        (src_ready),
                
                .m_data         (port_s_data),
                .m_valid        (port_s_valid),
                .m_ready        (port_s_ready)
            );
    
    genvar  i;
    generate
    for ( i = 0; i < PORT_NUM; i= i + 1 ) begin : loop_dummy
        dummy_proc
                #(
                    .DATA_WIDTH     (DATA_WIDTH)
                )
            i_dummy_proc
                (
                    .reset          (reset),
                    .clk            (clk),
                    
                    .s_data         (port_s_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .s_valid        (port_s_valid[i]),
                    .s_ready        (port_s_ready[i]),
                    
                    .m_data         (port_m_data [i*DATA_WIDTH +: DATA_WIDTH]),
                    .m_valid        (port_m_valid[i]),
                    .m_ready        (port_m_ready[i])
                );
    end
    endgenerate
    
    jelly_data_gather
            #(
                .PORT_NUM       (PORT_NUM),
                .DATA_WIDTH     (DATA_WIDTH),
                .LINE_SIZE      (LINE_SIZE),
                .UNIT_SIZE      (UNIT_SIZE)
            )
        i_data_gather
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_data         (port_m_data),
                .s_valid        (port_m_valid),
                .s_ready        (port_m_ready),
                
                .m_data         (sink_data),
                .m_valid        (sink_valid),
                .m_ready        (sink_ready)
            );
    
    always @(posedge clk) begin
        if ( reset ) begin
            src_data  <= 0;
            src_valid <= 0;
        end
        else begin
            if ( src_valid && src_ready ) begin
                src_data <= src_data + 1;
            end
            
            if ( !src_valid || src_ready ) begin
                src_valid <= 1; // {$random};
            end
        end
    end
    
    
    reg     [DATA_WIDTH-1:0]    exp_data;
    always @(posedge clk) begin
        if ( reset ) begin
            exp_data <= 0;
        end
        else begin
            if ( sink_valid && sink_ready ) begin
                if ( sink_data != exp_data ) begin
                    $display("Error!");
                end
    //          $display("%h", sink_data);
                exp_data <= exp_data + 1;
            end
        end
    end
    
    
endmodule



module dummy_proc
        #(
            parameter   DATA_WIDTH = 16
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready
        );
    
    reg     [1:0]   reg_busy = 0;
    always @(posedge clk) begin
//      reg_busy <= {$random()};
        reg_busy <= reg_busy + 1;
    end
    wire            busy = (reg_busy != 0);
    
    assign m_data  = s_data;
    assign m_valid = s_valid && !busy;
    assign s_ready = m_ready && !busy;
    
endmodule



`default_nettype wire


// end of file

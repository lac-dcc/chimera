// This program was cloned from: https://github.com/Revenantx86/uart
// License: MIT License

module uart_rx_top 
    #(  
        parameter D_W = 8, 
        parameter B_TICK = 16, 
        parameter DEPTH = 64
     )
     (
        // Clock and reset
        input  wire            rst,
        input  wire            clk,

        // rx-module input & outputs
        input  wire            b_clk,
        input  wire            rx_data,
        output wire            b_en,
        // Status //
        output wire            busy,
        output wire            overrun_error,
        output wire            frame_error,

        // FIFO module input & outputs
        input  wire            ff_rd_en,
        input  wire            rd_en,
        output wire [D_W-1:0]  ff_data_out,
        output wire            ff_empty,
        output wire            ff_full,
        input  wire            ff_wr_en,
        input  wire [D_W-1:0]  ff_data_in,

        // AXI Interface 
        output wire [D_W-1:0]  m_axis_data,
        output wire            m_axis_tvalid,
        input  wire            m_axis_tready
     );

    // ** Instantiate the FIFO module ** //
    fifo #(.D_W(D_W), .DEPTH(DEPTH)) 
        fifo_rx_inst
                (
                    .clk(clk),
                    .rst(rst),
                    .wr_en(ff_wr_en),
                    .rd_en(ff_rd_en),
                    .data_in(ff_data_in),
                    .data_out(ff_data_out),
                    .full(ff_full),
                    .empty(ff_empty)
                );
    // ** //

    // ** Instantiate the rx module ** //
    uart_rx #(.D_W(D_W), .B_TICK(B_TICK)) 
        uart_rx_inst (
                    .clk(clk),
                    .rst(rst),
                    .baud_clk(b_clk),
                    .rx_data(rx_data),
                    .baud_en(b_en),
                    .out_data(),
                    .ff_full(ff_full),
                    .ff_wr_en()
        );
    // ** //

endmodule
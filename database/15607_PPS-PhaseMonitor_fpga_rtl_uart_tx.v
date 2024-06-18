// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

/*============================================================================*/
/*
 * @file    uart_tx.v
 * @brief   UART TX
 * @note    
 * @date    2018/11/19
 * @author  kingyo
 */
/*============================================================================*/
module uart_tx (
    input           i_clk,
    input           i_rst_n,
    input   [7:0]   i_data,
    input           i_txen,
    output          o_uart_miso,
    output          o_txempty
    );
    
    parameter   DIV_WID = 9;
    parameter   DIV_CNT = 9'd433;  // i_clk = 50MHz, miso_clk = 115200, 50MHz / 115200bps - 1
    
    reg     [9:0]       data;       // startbit + data + stopbit
    reg                 txempty;
    reg                 miso;
    reg     [DIV_WID-1:0]   div;
    wire                start;
    wire                fin;
    wire                dt_txpls;
    reg     [3:0]       bitCnt;

    assign start = (txempty & i_txen);
    assign fin  = (bitCnt == 4'd10 & div == 9'd0);
    assign dt_txpls = (~txempty & div == DIV_CNT);
    
    /* txempty control */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            txempty <= 1'b1;
        else if (start)
            txempty <= 1'b0;
        else if (fin)
            txempty <= 1'b1;
    end

    /* Tx data latch */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            data <= 10'b1_00000000_0;
        else if (start)
            data <= { 1'b1, i_data[7:0], 1'b0 };
        else if (dt_txpls)
            data <= { 1'd0, data[9:1] };
    end

    /* Tx bit counter */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            bitCnt <= 4'd0;
        else if (start)
            bitCnt <= 4'd0;
        else if (dt_txpls)
            bitCnt <= bitCnt + 4'd1;
    end

    /* div counter */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            div <= 0;
        else if (start)
            div <= DIV_CNT;
        else if (~txempty) begin
            if (div == 9'd0)
                div <= DIV_CNT;
            else
                div <= div - 9'd1;
        end else
            div <= 9'd0;
    end

    /* Data send */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            miso <= 1'b1;
        else if (dt_txpls) begin
            miso <= data[0];    // LSB First
        end
    end

    assign o_uart_miso = miso;
    assign o_txempty = txempty;

endmodule
    
// This program was cloned from: https://github.com/kingyoPiyo/PPS-PhaseMonitor
// License: MIT License

/*============================================================================*/
/*
 * @file    uart_rx.v
 * @brief   UART RX
 * @note    
 * @date    2018/11/19
 * @author  kingyo
 */
/*============================================================================*/
module uart_rx (
    input           i_clk,
    input           i_rst_n,
    input           i_uart_mosi,
    output  [7:0]   o_data,
    output          o_dataen
    );
    
    parameter   DIV_WID = 9;
    parameter   DIV_CNT = 9'd433;   // i_clk = 50MHz, miso_clk = 115200, 50MHz / 115200bps - 1
    
    reg     [2:0]   mosi_ff;        // edge detect FF
    wire            start;          // start
    wire            fin;            // end
    reg             busy;
    reg     [DIV_WID-1:0]   div;    // divider
    reg     [3:0]   bitCnt;         // bit counter
    wire            dt_latch;       // data latch trigger
    reg     [9:0]   sp;             // serial data
    reg     [7:0]   data;           // rx data
    reg             dataen;         // data enable pls
    reg             chk_trg;        // data check trigger


    /* Edge sampling */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            mosi_ff <= 3'b111;
        else
            mosi_ff <= { mosi_ff[1:0], i_uart_mosi };
    end
    
    /* start pls ( negedge and not busy ) */
    assign start = (mosi_ff[2:1] == 2'b10) & (busy == 1'b0) ? 1'b1 : 1'b0;
    
    /* finish pls ( 10bit sample timing ) */
    assign fin = (bitCnt == 4'd9) & (dt_latch) ? 1'b1 : 1'b0;
    
    /* busy flg */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            busy <= 1'b0;
        else if (start)
            busy <= 1'b1;
        else if (fin)
            busy <= 1'b0;
    end
    
    /* div counter */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            div <= 0;
        else if (start)
            div <= { 1'b0, DIV_CNT[DIV_WID-1:1] };  // 1/2
        else if (busy) begin
            if (div == 9'd0) begin
                div <= DIV_CNT;
            end else begin
                div <= div - 9'd1;
            end
        end else begin
            div <= 9'd0;
        end
    end
    
    /* bit counter */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            bitCnt <= 0;
        end else if (start) begin
            bitCnt <= 0;
        end else if (dt_latch) begin
            bitCnt <= bitCnt + 4'd1;
        end
    end
    
    /* data latch trig */
    assign dt_latch = (busy) & (div == 9'd0) ? 1'b1 : 1'b0;
    
    /* seri para FF */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            sp <= 10'h3FF;
        end else if (dt_latch) begin
            sp <= { mosi_ff[2], sp[9:1] }; // LSB First
        end
    end
    
    /* check trig */
     always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            chk_trg <= 1'b0;
        end else begin
            chk_trg <= fin;
        end
    end
    
    /* receive data check and enable */
    always @(posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n) begin
            data <= 8'h00;
            dataen <= 1'b0;
        end else if (chk_trg & ~sp[0] & sp[9]) begin
            data <= sp[8:1];
            dataen <= 1'b1;
        end else begin
            dataen <= 1'b0;
        end
    end
    
    assign o_data = data;
    assign o_dataen = dataen;
    
endmodule
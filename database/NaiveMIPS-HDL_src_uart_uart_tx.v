module uart_tx(/*autoport*/
//output
            idle,
            txd,
//input
            clk_bus,
            clk_uart,
            rst_n,
            tx_request,
            data);

parameter ignore_for_sim = 1'b0;

parameter BAUD = 115200;
parameter UART_CLK = 11059200;
parameter COUNTER_PERIOD = UART_CLK/BAUD-1;

`define START_BIT 1'b0
`define STOP_BIT  1'b1

input wire clk_bus;
input wire clk_uart;
input wire rst_n;

input wire tx_request;
input wire[7:0] data;
output reg idle;

output reg txd;

reg tx_request_reg;
reg[7:0] data_reg;
wire tx_done_sync;

reg tx_done;
wire tx_request_sync;
reg[7:0] data_sync[0:1];
reg[9:0] send_buf;
reg[3:0] state;
reg[3:0] remain_bit;
reg[14:0] baud_cnt;

wire clk_uart_rst_n;

clk_ctrl rst(
    .clk      (clk_uart),
    .rst_in_n (rst_n),
    .rst_out_n(clk_uart_rst_n)
);

flag_sync sync_tx_req(/*autoinst*/
         .FlagOut_clkB(tx_request_sync),
         .a_rst_n(rst_n),
         .clkA(clk_bus),
         .FlagIn_clkA(tx_request_reg),
         .b_rst_n(clk_uart_rst_n),
         .clkB(clk_uart));

flag_sync sync_tx_done(/*autoinst*/
         .FlagOut_clkB(tx_done_sync),
         .a_rst_n(rst_n),
         .clkA(clk_uart),
         .FlagIn_clkA(tx_done),
         .b_rst_n(clk_uart_rst_n),
         .clkB(clk_bus));

always @(posedge clk_bus or negedge rst_n) begin
    if (!rst_n) begin
        idle <= 1'b1;
        tx_request_reg <= 1'b0;
    end else begin
        tx_request_reg <= 1'b0;
        if(idle && tx_request && ignore_for_sim) begin
            $write("%c",data);
        end
        if(idle && tx_request && !ignore_for_sim) begin
            tx_request_reg <= 1'b1;
            data_reg <= data;
            idle <= 1'b0;
        end else if(tx_done_sync) begin
            idle <= 1'b1;
        end
    end
end

always @(posedge clk_uart or negedge clk_uart_rst_n) begin
    if (!clk_uart_rst_n) begin
        state <= 4'h0;
        txd <= 1'b1;
        tx_done <= 1'b0;
    end
    else begin
        data_sync[0] <= data_reg;
        data_sync[1] <= data_sync[0];
        tx_done <= 1'b0;
        case(state)
        4'h0: begin
            if(tx_request_sync) begin
                state <= 4'h1;
                remain_bit <= 4'd10;
                send_buf <= {`STOP_BIT,data_sync[1],`START_BIT};
            end
        end
        4'h1: begin
            if(remain_bit!=4'd0) begin
                baud_cnt <= COUNTER_PERIOD;
                txd <= send_buf[0];
                send_buf <= send_buf>>1;
                state <= 4'h2;
            end else begin
                tx_done <= 4'b1;
                txd <= 1'b1;
                state <= 4'h0;
            end
        end
        4'h2: begin
            if(baud_cnt == 0)begin
                state <= 4'h1;
                remain_bit <= remain_bit-1'b1;
            end else begin
                baud_cnt <= baud_cnt - 1'b1;
            end
        end
        endcase
    end
end
endmodule

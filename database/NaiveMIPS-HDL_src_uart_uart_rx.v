module uart_rx(/*autoport*/
//output
         data,
         data_available,
//input
         clk_bus,
         clk_uart,
         rst_n,
         clear,
         rxd_in);

parameter BAUD = 115200;
parameter UART_CLK = 11059200;
parameter COUNTER_PERIOD = UART_CLK/BAUD-2-1;
parameter SAMPLE_1 = (COUNTER_PERIOD+1)/4-1;
parameter SAMPLE_2 = (COUNTER_PERIOD+1)/2-1;
parameter SAMPLE_3 = (COUNTER_PERIOD+1)/4*3-1;

input wire clk_bus;
input wire clk_uart;
input wire rst_n;

input wire clear;
output reg[7:0] data;
output reg data_available;

reg rx_avai_for_sim;
reg[7:0] rx_data_for_sim;
wire rx_available_sync;
reg[7:0] rx_data_sync[0:1];

input wire rxd_in;

reg rx_available;
reg[8:0] rx_data;
reg[3:0] state, next_state;
reg[3:0] remain_bit;
reg[14:0] baud_cnt;
reg[2:0] samples;
wire sample_value;
reg rxd_buf, rxd;

wire clk_uart_rst_n;

clk_ctrl rst(
    .clk      (clk_uart),
    .rst_in_n (rst_n),
    .rst_out_n(clk_uart_rst_n)
);

flag_sync sync_rx_avai(/*autoinst*/
         .FlagOut_clkB(rx_available_sync),
         .a_rst_n(clk_uart_rst_n),
         .clkA(clk_uart),
         .FlagIn_clkA(rx_available),
         .b_rst_n(rst_n),
         .clkB(clk_bus));

assign sample_value = (samples[0] && samples[1] ||
    samples[2] && samples[1] ||
    samples[0] && samples[2] );

always @(posedge clk_bus or negedge rst_n) begin
    if (!rst_n) begin
        data_available <= 1'b0;
        rx_avai_for_sim <= 1'b0;
        rx_data_for_sim <= 8'b0;
    end
    else begin
        rx_data_sync[0] <= rx_data[7:0];
        rx_data_sync[1] <= rx_data_sync[0];
        if (data_available) begin
            if(clear)
                data_available <= 1'b0;
        end else if(rx_available_sync) begin
            data_available <= 1'b1;
            data <= rx_data_sync[1];
        end else if(rx_avai_for_sim) begin
            data_available <= 1'b1;
            data <= rx_data_for_sim;
        end
    end
end

always @(posedge clk_uart or negedge clk_uart_rst_n) begin
    if (!clk_uart_rst_n) begin
        state <= 4'h0;
        next_state <= 4'h0;
        rx_available <= 1'b0;
    end
    else begin
        rx_available <= 1'b0;
        case(state)
        4'h0: begin
            next_state <= 4'h3;
            if(!rxd) begin
                state <= 4'h2;
                baud_cnt <= COUNTER_PERIOD;
            end
        end
        4'h1: begin
            rx_data <= {sample_value, rx_data[8:1]};
            next_state <= 4'h1;
            remain_bit <= remain_bit-4'd1;
            if(remain_bit!=4'd0) begin
                baud_cnt <= COUNTER_PERIOD;
                state <= 4'h2;
            end else begin
                state <= 4'h4;
            end
        end
        4'h2: begin
            baud_cnt <= baud_cnt - 1'b1;
            case (baud_cnt)
            0: begin
                state <= next_state;
            end
            SAMPLE_1,
            SAMPLE_2,
            SAMPLE_3: begin
                samples <= {samples[1:0], rxd};
            end
            endcase
        end
        4'h3: begin //checking START bit
            if(!sample_value) begin
                //valid
                state <= 4'h1;
                remain_bit <= 4'd9; //including STOP bit
            end else begin
                state <= 4'h0;
            end
        end
        4'h4: begin
            if(rx_data[8]) begin //checking STOP bit
                state <= 4'h5;
                rx_available <= 1'b1;
            end else begin
                state <= 4'h0;
            end
        end
        4'h5: begin
            state <= 4'h0;
        end
        endcase
    end
end

always @(posedge clk_uart) begin
    rxd_buf <= rxd_in;
    rxd <= rxd_buf;
end

endmodule

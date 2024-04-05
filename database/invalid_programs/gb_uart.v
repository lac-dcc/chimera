//
// UART interface
//

module uarttx(
    clock115200hz, resetn, data, send, ready,
    UART_TX
);

input clock115200hz;
input resetn;
input [7:0] data;
input send;
output reg ready;
output UART_TX = tx;

reg tx;
reg [3:0] state;

always @(posedge clock115200hz or negedge resetn) begin
    if (!resetn) begin
        tx <= 1'b1;
        ready <= 0;
        state <= 0;
    end else begin
        if (state == 0) begin
            tx <= 1'b1;
            ready <= send ? 1'b0 : 1'b1;
            state <= send ? 4'h1 : 4'h0;
        end else begin
            tx <= state == 4'h1 ? 1'b0 : data[state-2];
            state <= state == 4'h9 ? 4'h0 : state + 1'b1;
        end
    end
end

endmodule


module cheapuartrx(
    clock115200hz, resetn, data, recv,
    UART_RX
);

input clock115200hz;
input resetn;
output reg [7:0] data;
output reg recv;
input UART_RX;

wire rx = UART_RX;
reg [3:0] state;
reg [7:0] buffer;

always @(posedge clock115200hz or negedge resetn) begin
    if (!resetn) begin
        data <= 0;
        recv <= 0;
        state <= 0;
    end else begin
        if (state == 0) begin
            recv <= 1'b0;
            state <= rx == 1'b0 ? 4'h1 : 4'h0;
        end else if (state != 9) begin
            buffer[state-1] <= rx;
            state <= state + 1'b1;
        end else begin
            data <= buffer;
            recv <= 1'b1;
            state <= 4'h0;
        end 
    end
end

endmodule


module uartrx(
    clock460800, resetn, data, recv,
    UART_RX
);

input clock460800;
input resetn;
output reg [7:0] data;
output reg recv;
input UART_RX;

wire rx = UART_RX;
reg [3:0] state;
reg [1:0] step;
reg [7:0] buffer;
reg [2:0] count;

always @(posedge clock460800 or negedge resetn) begin
    if (!resetn) begin
        data <= 0;
        recv <= 0;
        state <= 0;
    end else begin
        if (state == 0) begin
            recv <= 1'b0;
            state <= rx == 1'b0 ? 4'h1 : 4'h0;
            step <= 1'h1;
        end else if (state == 1) begin
            if (step != 2'h3) begin
                step <= step + 1'b1;
            end else begin
                state <= state + 1'b1;
                count <= 0;
                step <= 0;
            end
        end else if (state != 10) begin
            if (step != 2'h3) begin
                count <= count + rx;
                step <= step + 1'b1;
            end else begin
                buffer[state-2] <= (count+rx) > 2;
                state <= state + 1'b1;
                count <= 0;
                step <= 0;
            end
        end else begin
            data <= buffer;
            recv <= 1'b1;
            
            if (step != 2'h3) begin
                step <= step + 1'b1;
            end else begin
                state <= 4'h0;
            end
        end 
    end
end

endmodule

// This program was cloned from: https://github.com/mr-bammby/FPGA_comm
// License: MIT License

module top
(
    input clk,
    output [2:0] led,
    output uartTx,
    input btn
);

localparam STATE_INIT       = 0;
localparam STATE_SEND       = 1;
localparam STATE_WAIT       = 2;
localparam STATE_END_CHK    = 3;

localparam DELAY = 2;

localparam MEMORY_LENGTH = 12;
reg [7:0] testMemory [MEMORY_LENGTH-1:0];
initial begin
    testMemory[0] = "H";
    testMemory[1] = "e";
    testMemory[2] = "l";
    testMemory[3] = "l";
    testMemory[4] = "o";
    testMemory[5] = " ";
    testMemory[6] = "W";
    testMemory[7] = "o";
    testMemory[8] = "r";
    testMemory[9] = "l";
    testMemory[10] = "d";
    testMemory[11] = " ";
end

wire done;
reg new_data = 0;
reg [7:0] data = 0;
reg [5:0] data_cnt = 0;
reg [1:0] delay_cnt = 0;
reg [2:0] state = STATE_INIT;
reg new_transmition = 0; 
reg old_btn = 1;

uart_tx u(  .clk(clk),
.led(led),
.tx_pin(uartTx),
.data(data),
.data_ready(new_data),
.sampled(done));

always @(posedge clk) begin
    if (btn == 0 && old_btn == 1) begin
        new_transmition <= 1;
    end
    old_btn <= btn;
    case (state)
        STATE_INIT: begin
            if (new_transmition == 1) begin
                data_cnt <= 0;
                state <= STATE_SEND;
                new_transmition <= 0;
            end
        end
        STATE_SEND: begin
            if (delay_cnt == DELAY) begin
                data <= testMemory[data_cnt];
                data_cnt <= data_cnt + 1;
                state <= STATE_WAIT;
                new_data <= 1;
                delay_cnt <= 0;
            end 
            if (done == 0) begin
                delay_cnt <= delay_cnt + 1;
            end
        end
        STATE_WAIT : begin
            if (done == 1 ) begin
                state <= STATE_END_CHK;
                delay_cnt <= 0;
                new_data <= 0;
            end
        end
        STATE_END_CHK : begin
            if ((data_cnt) == MEMORY_LENGTH) begin
                state <= STATE_INIT;
            end else
                state <= STATE_SEND;
            
        end
    endcase
end


endmodule
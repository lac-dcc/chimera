// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

module test_write(
    input clk,
    input rst_n,

    output wr_burst_req,
    output [9:0]  wr_burst_len,
    output [23:0] wr_burst_addr,
    output [15:0] wr_burst_data,

    input wr_burst_data_req,
    input wr_burst_finish 
);

localparam STATE_IDLE = 2'b00;
localparam STATE_WRITE = 2'b01;
localparam STATE_FINISH = 2'b10;
localparam STATE_PAUSE = 2'b11;

reg write_req_r;
reg [23:0] write_addr_r;
reg [1:0] state_r;
reg [15:0] data_r;
reg [31:0] pause_counter_r;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        write_req_r <= 1'b0;
        write_addr_r <= 24'b0;
        state_r <= STATE_IDLE;
        data_r <= 16'b1111100000000000;
        pause_counter_r <= 32'd0;
    end else begin
        case (state_r)
            STATE_IDLE: begin
                if (wr_burst_data_req) begin
                    write_req_r <= 1'b0;
                    state_r <= STATE_WRITE;
                end else begin
                    write_req_r <= 1'b1;
                end
            end
            STATE_WRITE: begin
                if (wr_burst_finish) begin
                    state_r <= STATE_FINISH;
                end
            end
            STATE_FINISH: begin
                if (write_addr_r >= 24'd786432) begin
                    write_addr_r <= 24'd0;
                    state_r <= STATE_PAUSE;
                    data_r <= data_r + 16'd11111;
                end else begin
                    write_addr_r <= write_addr_r + 24'd128;
                    state_r <= STATE_IDLE;
                end
            end
            STATE_PAUSE: begin
                if (pause_counter_r == 32'd100000000) begin
                    state_r <= STATE_IDLE;
                    pause_counter_r <= 32'd0;
                end else begin
                    pause_counter_r <= pause_counter_r + 32'd1;
                end
            end
        endcase
    end
end 

assign wr_burst_req = write_req_r;
assign wr_burst_len = 10'd128;;
assign wr_burst_addr = write_addr_r;
assign wr_burst_data = data_r;

endmodule
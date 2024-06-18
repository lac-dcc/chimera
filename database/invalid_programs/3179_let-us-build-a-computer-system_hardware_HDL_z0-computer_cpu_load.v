// This program was cloned from: https://github.com/Manistein/let-us-build-a-computer-system
// License: MIT License

`ifndef _load_v_
`define _load_v_

// logic circuit for load
// opcode: 8'b00000010
// LOAD MDR, in_s
module load(
    input clk,
    input rst_n,

    input [15:0] instruction,
    input [15:0] MDR,
    input [15:0] in_mem_data,

    input read_mem_valid,
    input read_mem_finish,

    output [15:0] load_out,
    output read_mem_req,
    output is_loaded
);

localparam STATE_IDLE   = 2'b00;
localparam STATE_READY  = 2'b01;
localparam STATE_LOADED = 2'b10;

reg [1:0] state;
reg read_req;
reg [15:0] read_buffer;

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        state <= STATE_IDLE;
        read_req <= 1'b0;
        read_buffer <= 16'b0;
    end else begin
        case (state)
            STATE_IDLE: begin
                if (instruction[15:8] == OP_LOAD) begin
                    state <= STATE_READY;
                    read_req = 1'b1;
                end
            end
            STATE_READY: begin
                if (read_mem_valid) begin
                    read_req = 1'b0;
                    read_buffer <= in_mem_data;
                end else if (read_mem_finish) begin
                    state <= STATE_LOADED;
                end
            end
            STATE_LOADED: begin
                state <= STATE_IDLE;
            end
            default: begin
                state <= STATE_IDLE;
            end
        endcase
    end
end 

assign load_out = (state == STATE_LOADED) ? read_buffer : MDR;
assign is_loaded = (state == STATE_LOADED);
assign read_mem_req = read_req;

endmodule

`endif 
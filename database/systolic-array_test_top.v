// This program was cloned from: https://github.com/benhuangpf/systolic-array
// License: MIT License

module top
(
	input clock,
	input reset
);
reg [5:0] r,w;
reg [1:0] state;
localparam S_IDLE = 2'b00, S_RUN = 2'b01;
always @(*) begin
    w=r+1;
end
always @(posedge clock) begin
    if(reset)begin
        r<=0;
        state <= S_IDLE;
    end
    else begin
        r<=w;
        if(r<5) state <= S_IDLE;
        else state <= S_RUN;
    end
end

endmodule


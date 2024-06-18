// This program was cloned from: https://github.com/flyjancy/CortexM0_SoC_Task
// License: MIT License

module buzzer(
    input   wire    clk,
    input   wire    RSTn,
    input   wire    [7:0]   mode,
    output  wire    buzzer_o
);

reg clk0,clk1,clk2;
reg [25:0] cnt;
wire [25:0]cnt_nxt;
wire cnt_done;

assign cnt_done = cnt == 26'd50000000;
assign cnt_nxt = cnt_done ? 26'b0 : cnt + 1'b1; 

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) cnt <= 26'b0;
    else cnt <= cnt_nxt;
end

always@(posedge clk or negedge RSTn) begin
    if(~RSTn) clk0 <= 1'b0;
    else if(cnt_done) clk0 <= ~clk0;
end

always@(posedge clk0 or negedge RSTn) begin
    if(~RSTn) clk1 <= 1'b0;
    else clk1 <= ~clk1;
end

always@(posedge clk1 or negedge RSTn) begin
    if(~RSTn) clk2 <= 1'b0;
    else clk2 <= ~clk2;
end

assign buzzer_o =   (mode[1:0] == 2'b00) ? 1'b0 : (
                    (mode[1:0] == 2'b01) ? clk0 : (
                    (mode[1:0] == 2'b10) ? clk1 : clk2));

endmodule
module cfsr ();
reg clk, rst;
reg[7:0] x_q;
reg[7:0] x_d;
reg[4:0] q_cnt;

integer i;
integer out;
//clock
initial
begin
    clk = 0;
   forever #10 clk = ~clk;
end
//reset
initial begin
    rst = 0;
    # 50 rst = 1;
end
// Use positive edge of clock to shift the register value
// Implement cyclic shift right
always @(posedge clk or
    negedge rst)
begin
    if (!rst)
    begin
        x_q <= 'hed;
        q_cnt <= 0;
        out = $fopen("cfsr.vec","w");
    end
    else
    begin
        x_q <= x_d;
        q_cnt <= q_cnt + 1;
        $fdisplay(out, "Pass %d Shift value in hex %b", q_cnt, x_q);
    end
end
//shift logic
always @(*)
begin
    x_d = x_q;
    x_d[7] = x_q[0];
    for (i=0; i<7; i=i+1)
    begin
        x_d[i] = x_q[i+1];
    end
end
endmodule

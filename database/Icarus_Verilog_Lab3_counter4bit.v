`ifndef COUNTER_4BIT
    `define COUNTER_4BIT
    module jkFlipFlop(
        output q, 
        input J, 
        input K, 
        input clk,
        input reset);

        reg q;
        always @(posedge clk) begin
            if(reset)
                q <= 1'b0;
            else begin
                case({J,K})
                    2'b0_0:     q <= q;
                    2'b0_1:     q <= 0;
                    2'b1_0:     q <= 1;
                    2'b1_1:     q <= ~q;
                endcase
            end
        end
    endmodule

    module counter4bit( 
        output [3:0] q, 
        input clk,
        input reset);

        wire q0q1;
        assign q0q1 = q[0] & q[1];

        wire q0q1q2;
        assign q0q1q2 = q0q1 & q[2];

        jkFlipFlop f0(q[0], 1'b1, 1'b1, clk, reset);
        jkFlipFlop f1(q[1], q[0], q[0], clk, reset);
        jkFlipFlop f2(q[2], q0q1, q0q1, clk, reset);
        jkFlipFlop f3(q[3], q0q1q2, q0q1q2, clk, reset);

    endmodule
`endif
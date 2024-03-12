module trng_top(
    input CLK_i,
    output PMOD_1,
    output PMOD_2,
    output PMOD_3,
    output [4:0]LED_o
);

    wire q    /* synthesis syn_keep = 1 */;
    wire qbar    /* synthesis syn_keep = 1 */;
    reg r /* synthesis syn_keep = 1 */;

    assign PMOD_1 = CLK_i;
    assign PMOD_2 = q;
    assign PMOD_3 = qbar;
    assign LED_o[0] = q;
    assign LED_o[1] = CLK_i;
    assign LED_o[2] = r;
    assign LED_o[4:3] = 0;

    SR_latch sr(CLK_i, CLK_i, q, qbar) /* synthesis syn_keep = 1 */;

    always @(posedge CLK_i)
    begin
      if (q == 1'b1) begin
        r <= 1'b1;
      end
    end

endmodule

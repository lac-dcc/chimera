
module reset_gen(
    input  wire  clk,
    output wire  reset_
    );

    reg [2:0] reset_vec_;

    initial reset_vec_ = 0;

    always @(posedge clk) begin
        reset_vec_  <= { reset_vec_[1:0], 1'b1 };
    end

    assign reset_ = reset_vec_[2];

endmodule

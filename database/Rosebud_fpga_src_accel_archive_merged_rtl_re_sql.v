// This program was cloned from: https://github.com/ucsdsysnet/Rosebud
// License: MIT License

// UPDATE the state size for init_state, state_r and state_n
module re(input wire clk, input wire rst,
          input wire [7:0] in, input wire valid,
          input wire [31:0] init_state, input wire init_assert,
          output wire match);

reg [31:0] state_r, state_n;

always @ (posedge clk)
    if (rst)
        state_r <= 32'd0;
    else if (init_assert)
        state_r <= init_state;
    else if (valid)
        state_r <= state_n;

assign match = (state_r[10] | state_r[21] | state_r[31]);

/////////////////////////////////////////////
/// combinational logic for pattern match ///
/////////////////////////////////////////////

always @(*) begin
    state_n = 0;

    if (('d73 == in))
        state_n[0] = 'd1;
    else if (~(('d73 == in)))
        state_n[0] = 'd0;

    if ((state_r[0] & ('d78 == in)))
        state_n[1] = 'd1;
    else if (~((state_r[0] & ('d78 == in))))
        state_n[1] = 'd0;

    if ((state_r[1] & ('d83 == in)))
        state_n[2] = 'd1;
    else if (~((state_r[1] & ('d83 == in))))
        state_n[2] = 'd0;

    if ((state_r[2] & ('d69 == in)))
        state_n[3] = 'd1;
    else if (~((state_r[2] & ('d69 == in))))
        state_n[3] = 'd0;

    if ((state_r[3] & ('d82 == in)))
        state_n[4] = 'd1;
    else if (~((state_r[3] & ('d82 == in))))
        state_n[4] = 'd0;

    if ((state_r[4] & ('d84 == in)))
        state_n[5] = 'd1;
    else if (~((state_r[4] & ('d84 == in))))
        state_n[5] = 'd0;

    if ((state_r[6] | state_r[5]))
        state_n[6] = 'd1;
    else if (~((state_r[6] | state_r[5])))
        state_n[6] = 'd0;

    if ((state_r[6] & ('d73 == in)))
        state_n[7] = 'd1;
    else if (~((state_r[6] & ('d73 == in))))
        state_n[7] = 'd0;

    if ((state_r[7] & ('d78 == in)))
        state_n[8] = 'd1;
    else if (~((state_r[7] & ('d78 == in))))
        state_n[8] = 'd0;

    if ((state_r[8] & ('d84 == in)))
        state_n[9] = 'd1;
    else if (~((state_r[8] & ('d84 == in))))
        state_n[9] = 'd0;

    if ((state_r[9] & ('d79 == in)))
        state_n[10] = 'd1;
    else if (~((state_r[9] & ('d79 == in))))
        state_n[10] = 'd0;

    if (('d68 == in))
        state_n[11] = 'd1;
    else if (~(('d68 == in)))
        state_n[11] = 'd0;

    if ((state_r[11] & ('d69 == in)))
        state_n[12] = 'd1;
    else if (~((state_r[11] & ('d69 == in))))
        state_n[12] = 'd0;

    if ((state_r[12] & ('d76 == in)))
        state_n[13] = 'd1;
    else if (~((state_r[12] & ('d76 == in))))
        state_n[13] = 'd0;

    if ((state_r[13] & ('d69 == in)))
        state_n[14] = 'd1;
    else if (~((state_r[13] & ('d69 == in))))
        state_n[14] = 'd0;

    if ((state_r[14] & ('d84 == in)))
        state_n[15] = 'd1;
    else if (~((state_r[14] & ('d84 == in))))
        state_n[15] = 'd0;

    if ((state_r[15] & ('d69 == in)))
        state_n[16] = 'd1;
    else if (~((state_r[15] & ('d69 == in))))
        state_n[16] = 'd0;

    if ((state_r[17] | state_r[16]))
        state_n[17] = 'd1;
    else if (~((state_r[17] | state_r[16])))
        state_n[17] = 'd0;

    if ((state_r[17] & ('d70 == in)))
        state_n[18] = 'd1;
    else if (~((state_r[17] & ('d70 == in))))
        state_n[18] = 'd0;

    if ((state_r[18] & ('d82 == in)))
        state_n[19] = 'd1;
    else if (~((state_r[18] & ('d82 == in))))
        state_n[19] = 'd0;

    if ((state_r[19] & ('d79 == in)))
        state_n[20] = 'd1;
    else if (~((state_r[19] & ('d79 == in))))
        state_n[20] = 'd0;

    if ((state_r[20] & ('d77 == in)))
        state_n[21] = 'd1;
    else if (~((state_r[20] & ('d77 == in))))
        state_n[21] = 'd0;

    if (('d85 == in))
        state_n[22] = 'd1;
    else if (~(('d85 == in)))
        state_n[22] = 'd0;

    if ((state_r[22] & ('d80 == in)))
        state_n[23] = 'd1;
    else if (~((state_r[22] & ('d80 == in))))
        state_n[23] = 'd0;

    if ((state_r[23] & ('d68 == in)))
        state_n[24] = 'd1;
    else if (~((state_r[23] & ('d68 == in))))
        state_n[24] = 'd0;

    if ((state_r[24] & ('d65 == in)))
        state_n[25] = 'd1;
    else if (~((state_r[24] & ('d65 == in))))
        state_n[25] = 'd0;

    if ((state_r[25] & ('d84 == in)))
        state_n[26] = 'd1;
    else if (~((state_r[25] & ('d84 == in))))
        state_n[26] = 'd0;

    if ((state_r[26] & ('d69 == in)))
        state_n[27] = 'd1;
    else if (~((state_r[26] & ('d69 == in))))
        state_n[27] = 'd0;

    if ((state_r[28] | state_r[27]))
        state_n[28] = 'd1;
    else if (~((state_r[28] | state_r[27])))
        state_n[28] = 'd0;

    if ((state_r[28] & ('d83 == in)))
        state_n[29] = 'd1;
    else if (~((state_r[28] & ('d83 == in))))
        state_n[29] = 'd0;

    if ((state_r[29] & ('d69 == in)))
        state_n[30] = 'd1;
    else if (~((state_r[29] & ('d69 == in))))
        state_n[30] = 'd0;

    if ((state_r[30] & ('d84 == in)))
        state_n[31] = 'd1;
    else if (~((state_r[30] & ('d84 == in))))
        state_n[31] = 'd0;

end

endmodule

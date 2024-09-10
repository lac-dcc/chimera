// Seed: 3357562164
`timescale 1ps / 1ps
module module_0 #(
    parameter id_2 = 32'd13,
    parameter id_3 = 32'd72,
    parameter id_5 = 32'd21
) (
    input _id_2,
    input _id_3,
    input id_4,
    input _id_5,
    input id_6,
    output id_7,
    inout reg id_8,
    input id_9,
    input id_10,
    input id_11,
    output logic id_12,
    input logic id_13,
    input logic id_14,
    input id_15,
    output id_16,
    output logic id_17,
    input id_18,
    input id_19,
    output logic id_20,
    input reg id_21,
    output id_22,
    input id_23
);
  assign id_23 = id_7[!id_3];
  initial begin
    id_8 = (1) < id_9;
    id_8[1] <= 1;
    id_23[id_2] <= #1 1;
    id_4 = 1;
    if (id_5) begin
      id_22 <= 1;
    end
    #1 id_18[1 : 1'b0==0] <= {(id_4[1]), id_16};
    id_2   <= id_15[id_5];
    id_21  <= id_9;
    sample <= 1;
    id_19  <= 1;
    id_16  <= 1;
  end
endmodule

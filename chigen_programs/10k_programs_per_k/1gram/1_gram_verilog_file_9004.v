// Seed: 2080745362
module module_0 (
    id_1,
    id_2,
    id_3[-1 : 1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9[1 : 1'h0],
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  input wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  input wire id_2;
  inout wire id_1;
  parameter id_15 = 1;
endmodule
program module_1 #(
    parameter id_11 = 32'd60,
    parameter id_16 = 32'd1
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  module_0 modCall_1 (
      id_4,
      id_9,
      id_6,
      id_4,
      id_4,
      id_4,
      id_7,
      id_4,
      id_6,
      id_3,
      id_4,
      id_9,
      id_3,
      id_7
  );
  output wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  input wire id_5;
  inout wire id_4;
  inout tri id_3;
  output wire id_2;
  output wire id_1;
  logic   id_10;
  supply0 _id_11 = id_10, id_12 = id_3 ^ id_12;
  logic [7:0][1 : id_11] id_13 = id_12, id_14 = id_11, id_15 = id_5;
  tri _id_16 = id_4 ? "" ? id_6[id_11 :-1'b0] : !id_14 : id_7 <= -1 * -1;
  always id_15[id_11!=1'd0] = id_10[id_16];
  assign id_3 = 1;
endprogram

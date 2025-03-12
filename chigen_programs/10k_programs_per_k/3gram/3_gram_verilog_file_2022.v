// Seed: 3571188236
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output supply0 id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout reg id_3;
  inout wire id_2;
  assign module_1._id_4 = 0;
  output reg id_1;
  always_comb for (id_11 = id_8; id_12; id_1 = id_6) if (1) id_3 <= id_2;
endmodule
module module_1 #(
    parameter id_4 = 32'd32,
    parameter id_5 = 32'd7
) (
    output tri id_0,
    input supply1 id_1,
    output uwire id_2,
    output wire id_3,
    input tri _id_4,
    input wire _id_5,
    input wire id_6,
    output tri1 id_7,
    input uwire id_8
);
  logic [1 : 1] id_10;
  logic [id_4 : 1] id_11 = id_10 + id_10;
  parameter id_12 = 1;
  logic [7:0] id_13;
  assign id_7 = id_12;
  module_0 modCall_1 (
      id_11,
      id_12,
      id_11,
      id_10,
      id_12,
      id_12,
      id_10,
      id_10,
      id_12,
      id_10,
      id_10,
      id_10,
      id_10
  );
  if (id_12) begin : LABEL_0
    for (id_14 = 1; id_13; id_11 = 1) begin : LABEL_1
      assign id_10 = (1 - !1 + {id_4, 1});
    end
  end else assign id_13[id_5] = 1;
endmodule

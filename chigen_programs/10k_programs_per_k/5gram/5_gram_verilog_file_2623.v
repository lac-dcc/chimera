// Seed: 1572400933
module module_0;
  logic id_1;
endmodule
module module_1 #(
    parameter id_3 = 32'd67
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  inout logic [7:0] id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output supply1 id_5;
  inout wire id_4;
  input wire _id_3;
  input wire id_2;
  module_0 modCall_1 ();
  input wire id_1;
  tri id_16 = 1;
  parameter id_17 = 1;
  assign id_5 = 1 == id_8;
  generate
    if (1) assign id_4 = id_13;
    else begin : LABEL_0
      assign id_12 = 1 !=? id_13[id_3];
    end
  endgenerate
endmodule

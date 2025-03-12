// Seed: 2292044721
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_3 = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_4
  );
endmodule
module module_2 #(
    parameter id_12 = 32'd5
) (
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
    _id_12,
    id_13
);
  output wire id_13;
  xnor primCall (id_4, id_2, id_5, id_6, id_7, id_10);
  inout wire _id_12;
  module_0 modCall_1 (
      id_5,
      id_10,
      id_4
  );
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  logic ["" : 1] id_14;
  wire [id_12 : 1] id_15;
  logic [7:0] id_16;
  wire id_17;
  ;
  assign id_17 = id_5;
  wire id_18;
  assign id_16[1] = -1;
endmodule

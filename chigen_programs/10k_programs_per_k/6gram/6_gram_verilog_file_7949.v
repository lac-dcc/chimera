// Seed: 3357099494
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  logic id_7;
  ;
endmodule
module module_1 #(
    parameter id_7 = 32'd73
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    _id_7,
    id_8,
    id_9,
    id_10
);
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire _id_7;
  module_0 modCall_1 (
      id_3,
      id_9,
      id_8,
      id_9,
      id_3,
      id_3
  );
  inout logic [7:0] id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_11;
  assign id_9 = id_6;
  assign (strong1, pull0) id_6[id_7] = id_1;
endmodule

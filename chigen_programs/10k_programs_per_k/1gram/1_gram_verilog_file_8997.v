// Seed: 2237858363
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_8;
endmodule
module module_1 #(
    parameter id_9 = 32'd70
) (
    id_1,
    id_2,
    id_3[id_9 : 1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10[-1 : 1]
);
  inout logic [7:0] id_10;
  output wire _id_9;
  input wire id_8;
  input wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  inout logic [7:0] id_2;
  input wire id_1;
  logic id_11;
  ;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_4,
      id_4,
      id_4,
      id_5,
      id_11
  );
  integer id_12;
  ;
  wire id_13;
  id_14 :
  assert property (@(posedge -1) id_1) @(negedge !-1) #1;
  assign id_2[1] = -1;
endmodule

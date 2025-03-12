// Seed: 904778286
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
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire  id_8;
  logic id_9;
  assign id_7 = id_5 ? id_8 : id_8;
  logic id_10;
endmodule
module module_1 #(
    parameter id_8 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  module_0 modCall_1 (
      id_5,
      id_2,
      id_5,
      id_3,
      id_6,
      id_1,
      id_2
  );
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  _id_8 :
  assert property (@(negedge id_2) id_6)
  else $signed(5);
  ;
  wire [-1 : id_8] id_9;
  wire id_10;
  logic id_11;
endmodule

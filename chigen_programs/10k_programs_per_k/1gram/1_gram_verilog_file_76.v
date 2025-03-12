// Seed: 444555180
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4#(""),
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout logic [7:0] id_11;
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  input wire id_1;
  wire id_12;
  ;
  assign id_12 = id_11.id_3;
  assign id_3[-1'b0 :-1] = id_10;
endmodule
module module_1 #(
    parameter id_1 = 32'd45
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8[id_1 :-1],
    id_9,
    id_10,
    id_11
);
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout logic [7:0] id_8;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_8,
      id_5,
      id_5,
      id_3,
      id_11,
      id_11,
      id_2,
      id_3,
      id_8
  );
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire _id_1;
  assign id_11 = id_1;
  logic id_12;
endmodule

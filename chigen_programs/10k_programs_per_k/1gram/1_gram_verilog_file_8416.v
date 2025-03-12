// Seed: 1163642327
module module_0 (
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
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic [7:0] id_10;
  parameter id_11 = 1;
  logic id_12;
  ;
  assign id_8 = id_3;
  assign id_10[!-1] = id_7;
  parameter id_13 = id_11;
  parameter id_14 = "" & 1'b0;
  wire id_15;
  wire id_16;
  wire id_17;
endmodule
module module_1 #(
    parameter id_9 = 32'd57
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9,
    id_10[id_9 :-1]
);
  inout logic [7:0] id_10;
  inout wire _id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = id_2;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_8,
      id_5,
      id_3,
      id_6,
      id_6,
      id_3
  );
endmodule

// Seed: 3128671175
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  assign id_2[-1] = id_3;
  assign id_2[1]  = -1;
  logic [7:0] id_5 = id_5[1'h0];
endmodule
module module_1 #(
    parameter id_9 = 32'd90
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
    id_10,
    id_11
);
  input wire id_11;
  inout logic [7:0] id_10;
  inout wire _id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output logic [7:0] id_3;
  inout wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_11,
      id_10,
      id_7,
      id_4
  );
  logic [1 : ""] id_12;
  ;
  wire  id_13;
  uwire id_14;
  assign id_12 = id_10[-1 : id_9];
  assign id_14 = 1;
  assign id_10[-1'd0] = id_4;
  logic id_15;
endmodule

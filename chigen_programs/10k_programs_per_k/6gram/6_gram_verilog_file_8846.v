// Seed: 4198483625
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
    id_10
);
  output wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_11;
  reg id_12, id_13;
  wire id_14;
  struct packed {
    id_15 id_16;
    logic [1 : 1] id_17;
  } [1 : -1] id_18;
  ;
  logic id_19;
  ;
  always id_13 <= #id_8 id_14;
endmodule
module module_1 #(
    parameter id_3 = 32'd14,
    parameter id_5 = 32'd71
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    _id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire _id_5;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_7,
      id_7,
      id_7,
      id_4,
      id_4,
      id_7,
      id_6,
      id_7
  );
  inout wire id_4;
  inout wire _id_3;
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[1] = -1;
  logic [id_3 : id_5] id_8 = 1;
endmodule

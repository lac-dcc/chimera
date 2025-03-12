// Seed: 1124580992
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  logic id_7;
  always force id_4 = (-1'h0 + -1);
  assign module_1.id_12 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd4
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  input wire id_1;
  wire [-1 'b0 : 1  >  id_3] id_10;
  struct packed {
    id_11 id_12;
    struct packed {
      id_13 id_14;
      logic id_15;
    } id_16;
  } id_17 = 1;
  assign id_17.id_11 = (1'b0) ** ~id_17.id_15;
  module_0 modCall_1 (
      id_6,
      id_12,
      id_14,
      id_5,
      id_10,
      id_5
  );
  wire id_18;
  assign id_17.id_15[-1] = -1;
endmodule

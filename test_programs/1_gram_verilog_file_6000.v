// Seed: 1350334004
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18
);
  input wire id_18;
  output wire id_17;
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  output wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_12 = id_6;
  assign id_14 = id_8 & id_2;
  initial
    @(*)
      if (id_7) $display(id_1, -1'b0);
      else id_3 <= -1'b0;
  wire id_19 = id_7 % $realtime ? id_6 : -1;
  wire id_20;
endmodule
module module_1 (
    input tri0  id_0,
    input uwire id_1,
    input logic id_2#(.id_4(1 ^ 1))
);
  initial id_5 <= 1'b0;
  wire id_6;
  reg id_7, id_8, id_9;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  assign modCall_1.id_19 = 0;
  always id_8 <= (id_2);
  assign id_8 = ~1;
endmodule

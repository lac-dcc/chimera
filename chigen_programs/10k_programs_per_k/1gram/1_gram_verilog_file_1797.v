// Seed: 1994190410
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_6, id_7;
  logic [7:0][1] id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  supply0 id_9, id_10, id_11, id_12, id_13, id_14;
  always_latch #1 id_4 <= 1;
  tri id_15, id_16 = id_9;
  tri id_17;
  always @(id_15) $display({id_12, id_11, 1}, id_6, (id_7), id_17);
  assign id_17 = id_9;
  assign id_10 = 1;
  always id_9 = id_12;
  uwire id_18 = 1;
  assign id_4 = ~id_16;
  wire id_19;
  module_0 modCall_1 (
      id_2,
      id_11,
      id_6,
      id_9,
      id_10
  );
  assign id_14 = (1'h0);
  wire id_20;
endmodule

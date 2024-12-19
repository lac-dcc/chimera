// Seed: 4268821360
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_6;
  wire id_7;
  assign id_4 = id_7;
  wire id_8;
  tri  id_9, id_10 = 1;
  wire id_11;
  wand id_12, id_13, id_14;
  wire id_15;
  reg  id_16;
  supply1 id_17, id_18;
  assign id_17 = 1;
  assign id_15 = 1 - id_12;
  wire id_19;
  initial id_16 <= 1;
  assign id_8 = id_11;
  wire id_20, id_21;
  wire id_22, id_23;
  wire id_24 = id_6, id_25, id_26;
endmodule
module module_1 (
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
  inout wire id_1;
  reg id_6 = 1;
  assign id_3 = ~id_1;
  assign id_1 = id_6;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_4,
      id_4
  );
  wire id_7;
  always_comb #1 begin : LABEL_0
    #1 id_1 <= 1;
  end
  id_8(
      .id_0(id_7), .id_1(1)
  );
  integer id_9;
endmodule

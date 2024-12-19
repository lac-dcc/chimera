// Seed: 3572428871
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
    id_15
);
  input wire id_15;
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  uwire id_16, id_17;
  assign {id_16, 1, 1} = id_16;
  wire id_18;
  wire id_19 = id_7;
  wire id_20;
  always #1 begin : LABEL_0
    if (1) id_3 = 1;
  end
  assign id_18 = id_15;
  assign module_1.type_4 = 0;
  assign id_8 = id_20;
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    output logic id_2,
    input wire id_3,
    input wand id_4,
    input wand id_5
);
  assign id_2 = id_4 <-> 1;
  assign id_2 = 1;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7,
      id_7
  );
  always_latch begin : LABEL_0
    id_2 <= 1'h0;
  end
endmodule

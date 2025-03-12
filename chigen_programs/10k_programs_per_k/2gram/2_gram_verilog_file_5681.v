// Seed: 2120650190
module module_0 (
    output wor id_0,
    input tri id_1,
    output tri id_2,
    input tri id_3,
    input wand id_4,
    input supply0 id_5,
    output wor id_6,
    input uwire id_7,
    input uwire id_8,
    input wand id_9,
    output tri0 id_10,
    input wor id_11
);
  bit id_13;
  parameter id_14 = -1;
  wire id_15;
  always begin : LABEL_0
    $signed(28);
    ;
  end
  assign module_1.id_11 = 0;
  initial id_13 <= id_13;
  always @(id_4) disable id_16;
  wire id_17;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input wand id_2,
    inout uwire id_3,
    output uwire id_4,
    input tri0 id_5,
    output wire id_6,
    output tri1 id_7,
    input supply1 id_8,
    input tri1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input wand id_12,
    output supply0 id_13,
    output tri0 id_14,
    output uwire id_15,
    output tri0 id_16,
    output uwire id_17,
    output wand id_18,
    input supply1 id_19,
    output tri0 id_20
);
  assign id_16 = id_9;
  or primCall (id_15, id_10, id_2, id_9, id_19, id_0, id_1, id_5, id_8, id_3, id_11);
  module_0 modCall_1 (
      id_20,
      id_1,
      id_7,
      id_8,
      id_3,
      id_3,
      id_14,
      id_12,
      id_0,
      id_2,
      id_14,
      id_12
  );
  assign id_18 = id_2;
  assign id_13 = -1;
endmodule

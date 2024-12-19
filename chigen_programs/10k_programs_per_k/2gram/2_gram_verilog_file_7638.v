// Seed: 1126751026
module module_0 (
    output uwire id_0,
    input wand id_1,
    input uwire id_2,
    input wor id_3,
    input tri id_4,
    output wor id_5,
    input supply0 id_6,
    input tri id_7,
    output tri0 id_8,
    input wor id_9,
    output supply1 id_10,
    input tri0 id_11,
    input wand id_12,
    input uwire id_13,
    output wand id_14,
    output wand id_15,
    output wire id_16,
    output tri id_17,
    input tri id_18,
    input wand id_19,
    input wand id_20,
    input supply1 id_21
);
  wire id_23;
  assign module_1.type_2 = 0;
endmodule
module module_1 (
    output tri1  id_0,
    input  wire  id_1,
    input  wire  id_2,
    output wire  id_3,
    output uwire id_4,
    output tri0  id_5,
    inout  logic id_6
);
  always begin : LABEL_0
    id_6 <= id_6 * 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_3,
      id_5,
      id_3,
      id_3,
      id_2,
      id_2,
      id_1,
      id_2
  );
endmodule

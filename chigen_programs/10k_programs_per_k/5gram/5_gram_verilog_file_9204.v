// Seed: 2938880757
module module_0 (
    input tri0 id_0,
    input wire id_1,
    input wand id_2,
    input wand id_3,
    input tri0 module_0,
    input tri0 id_5,
    output supply1 id_6,
    output tri0 id_7,
    input supply0 id_8,
    output uwire id_9
);
  assign id_7 = id_0;
  uwire id_11 = id_3 - id_0;
  wire  id_12;
  wire id_13, id_14, id_15;
  wire id_16;
endmodule
module module_1 (
    input supply0 id_0,
    input tri0 id_1,
    output wire id_2,
    input tri1 id_3,
    input wand id_4,
    input uwire id_5,
    input wor id_6,
    output tri0 id_7,
    output supply1 id_8,
    output uwire id_9,
    output logic id_10,
    input tri1 id_11,
    inout logic id_12,
    output supply1 id_13
    , id_16,
    output tri1 id_14
);
  initial begin : LABEL_0
    id_10 <= id_12;
  end
  module_0 modCall_1 (
      id_6,
      id_5,
      id_0,
      id_5,
      id_1,
      id_3,
      id_8,
      id_9,
      id_0,
      id_14
  );
  assign modCall_1.type_11 = 0;
  supply0 id_17 = (1);
endmodule

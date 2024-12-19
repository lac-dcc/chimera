// Seed: 3699573915
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    output tri id_2,
    input wire id_3,
    output supply0 id_4,
    input uwire id_5,
    input wire id_6,
    input wor id_7,
    input wand id_8,
    input supply1 id_9,
    input tri0 id_10,
    input tri1 id_11,
    output wand id_12,
    input uwire id_13,
    output wand id_14,
    output uwire id_15,
    output tri id_16,
    output tri1 id_17,
    output supply0 id_18,
    output uwire id_19,
    output supply1 id_20
);
  wire id_22;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    output tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    output supply1 id_5,
    output supply0 id_6,
    input wor id_7,
    input tri1 id_8,
    input tri id_9
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5,
      id_9,
      id_5,
      id_8,
      id_7,
      id_2,
      id_2,
      id_9,
      id_8,
      id_4,
      id_3,
      id_9,
      id_5,
      id_3,
      id_6,
      id_3,
      id_6,
      id_3,
      id_6
  );
  assign id_1 = 1;
  initial begin : LABEL_0
    id_3 = id_2;
    id_5 = 1;
    id_0 = 1;
  end
  wire id_11;
endmodule

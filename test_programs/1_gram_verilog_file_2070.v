// Seed: 3545623982
program module_0 (
    output wire id_0,
    input wor id_1,
    output wand id_2,
    output tri id_3,
    output wor id_4,
    output uwire id_5,
    input tri id_6,
    output tri0 id_7,
    input supply0 id_8,
    input uwire id_9,
    input wire id_10,
    input uwire id_11,
    output wor id_12,
    input supply1 id_13,
    input tri0 id_14,
    output wire id_15,
    input uwire id_16,
    input uwire id_17,
    id_19
);
  assign id_7 = -1;
  wire id_20;
  assign module_1.type_4 = 0;
  id_21(
      .id_0(id_13), .id_1(id_9), .id_2(id_19)
  );
  wire id_22;
endmodule
module module_1 (
    output wand id_0,
    output uwire id_1,
    input wor id_2,
    output supply1 id_3,
    output wire id_4,
    input wire id_5,
    output wand id_6,
    output supply0 id_7,
    input uwire id_8,
    input wire id_9,
    input wand id_10
);
  assign id_7 = 1;
  and primCall (id_7, id_8, id_10, id_5, id_9, id_2);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_1,
      id_7,
      id_7,
      id_1,
      id_10,
      id_6,
      id_10,
      id_10,
      id_10,
      id_8,
      id_6,
      id_2,
      id_8,
      id_4,
      id_10,
      id_8
  );
endmodule

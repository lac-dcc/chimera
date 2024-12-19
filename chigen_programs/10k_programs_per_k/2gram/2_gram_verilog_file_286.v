// Seed: 1448111871
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output uwire id_2,
    inout tri id_3,
    input supply1 id_4,
    input wire id_5,
    input wire id_6,
    input tri1 id_7,
    output uwire id_8,
    output uwire id_9,
    input wor id_10,
    output wor id_11,
    input uwire id_12,
    input uwire id_13,
    output tri id_14
);
  wand id_16 = id_5;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    output tri1 id_2,
    inout supply0 id_3,
    input supply1 id_4,
    input supply1 id_5,
    input wand id_6,
    output supply1 id_7,
    output tri id_8,
    input wand id_9,
    input supply1 id_10,
    input wand id_11,
    input wire id_12
);
  wand id_14, id_15;
  assign id_14 = 1;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_7,
      id_3,
      id_9,
      id_4,
      id_0,
      id_4,
      id_3,
      id_2,
      id_9,
      id_7,
      id_10,
      id_12,
      id_8
  );
  assign modCall_1.id_11 = 0;
endmodule

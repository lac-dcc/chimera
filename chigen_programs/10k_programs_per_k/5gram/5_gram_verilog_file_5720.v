// Seed: 1289555934
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input tri id_2,
    input wire id_3,
    input tri0 id_4,
    output tri0 id_5,
    output supply1 id_6,
    input wand id_7,
    output uwire id_8,
    output tri1 id_9,
    output wire id_10,
    input wor id_11,
    input supply0 id_12,
    output supply0 id_13,
    output supply0 id_14
    , id_16
);
endmodule
module module_1 (
    input tri1 id_0,
    input wor id_1,
    output uwire id_2,
    output wor id_3,
    input wor id_4,
    input supply0 id_5,
    input wand id_6,
    input supply0 id_7,
    input wor id_8,
    input wire id_9,
    output wand id_10,
    input wand id_11,
    output tri0 id_12,
    output wand id_13,
    output tri1 id_14
);
  assign id_10 = {id_1, 1, 1} == id_0;
  assign id_3  = 1;
  module_0 modCall_1 (
      id_13,
      id_2,
      id_4,
      id_4,
      id_9,
      id_2,
      id_2,
      id_4,
      id_10,
      id_12,
      id_13,
      id_7,
      id_7,
      id_12,
      id_2
  );
  assign modCall_1.type_22 = 0;
  assign id_10 = id_12++;
  id_16(
      .id_0(id_5), .id_1(id_3), .id_2(1), .id_3(id_4), .id_4(), .id_5(id_11)
  );
  wire id_17;
endmodule

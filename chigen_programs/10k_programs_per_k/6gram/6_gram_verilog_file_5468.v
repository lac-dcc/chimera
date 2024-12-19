// Seed: 2526663485
module module_0 (
    output wor id_0
    , id_25,
    output uwire id_1,
    output wor id_2,
    input uwire id_3,
    input wor id_4,
    output supply0 id_5,
    input tri0 id_6,
    input wand id_7,
    output wand id_8,
    output tri1 id_9,
    input wor id_10,
    input supply0 id_11,
    input supply1 id_12,
    output wire id_13,
    output supply1 id_14,
    output wor id_15,
    input wor id_16,
    input wire id_17,
    input tri id_18,
    input wor id_19,
    input wor id_20,
    input tri1 id_21,
    input tri1 id_22,
    output wand id_23
);
  id_26(
      .id_0(id_2),
      .id_1(1'b0),
      .id_2(id_13),
      .id_3(1'b0),
      .id_4(1 % 1),
      .id_5(1),
      .id_6(id_25),
      .id_7(1),
      .id_8(id_1)
  );
endmodule
module module_0 (
    input wire id_0,
    input logic id_1,
    input supply0 id_2,
    output wor id_3,
    input supply0 id_4,
    input tri1 id_5,
    output logic id_6,
    output wand id_7,
    output wire id_8,
    input wire id_9,
    output logic module_1
);
  assign id_10 = id_1;
  assign id_3  = id_0;
  always @(id_4 or posedge 1)
    if (id_2) id_10 <= 1;
    else id_6 <= id_2 & id_0;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_7,
      id_9,
      id_9,
      id_3,
      id_4,
      id_0,
      id_3,
      id_8,
      id_9,
      id_9,
      id_9,
      id_3,
      id_8,
      id_3,
      id_9,
      id_0,
      id_4,
      id_2,
      id_0,
      id_9,
      id_9,
      id_3
  );
  assign modCall_1.id_21 = 0;
endmodule

// Seed: 703335983
program module_0 (
    output uwire id_0,
    output uwire id_1,
    output supply1 id_2,
    id_19,
    output logic id_3,
    output tri id_4,
    input wand id_5,
    input wand id_6,
    input tri id_7,
    input wor id_8,
    output wand id_9,
    input tri id_10,
    input supply1 id_11,
    input wor id_12,
    input tri id_13,
    output tri0 id_14#(.id_20(1)),
    output tri id_15,
    input wire id_16,
    input uwire id_17
);
  assign id_9 = 1'b0;
  tri0 id_21 = id_19, id_22;
  id_23 :
  assert property (@(posedge id_5) -1) id_3 <= -1;
  supply1 id_24 = 1;
endmodule
module module_1 (
    input wire id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply1 id_3,
    input wor id_4,
    input tri id_5,
    output tri0 id_6,
    input supply1 id_7,
    input logic id_8,
    output wor id_9,
    input wor id_10,
    output supply1 id_11,
    output logic id_12,
    output tri0 id_13
);
  id_15(
      -1, 1
  );
  module_0 modCall_1 (
      id_6,
      id_11,
      id_11,
      id_12,
      id_9,
      id_4,
      id_7,
      id_4,
      id_1,
      id_9,
      id_1,
      id_7,
      id_7,
      id_1,
      id_6,
      id_11,
      id_4,
      id_3
  );
  assign modCall_1.id_4 = 0;
  always if (id_1) id_12 <= id_8;
endmodule

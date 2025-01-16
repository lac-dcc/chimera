// Seed: 2795359569
module module_0 (
    output tri0 id_0,
    input tri id_1,
    output tri1 id_2,
    input supply1 id_3,
    id_19,
    output tri0 id_4,
    output supply0 id_5,
    input supply1 id_6,
    input wor id_7,
    output tri0 id_8,
    input uwire id_9,
    input tri1 id_10,
    input tri0 id_11,
    output wire id_12,
    input wire id_13,
    output wand id_14,
    input tri0 id_15,
    output supply0 id_16,
    id_20,
    output tri1 id_17
);
  wire id_21;
  wire id_22;
endmodule
module module_1 (
    output uwire id_0,
    output uwire id_1,
    output wor   id_2,
    input  wor   id_3,
    input  uwire id_4,
    output logic id_5,
    input  logic id_6,
    input  logic id_7,
    input  tri   id_8
);
  assign id_2 = 1;
  wand id_10 = id_3, id_11;
  or primCall (id_0, id_6, id_11, id_12, id_10, id_3, id_8);
  initial if (id_7) id_5 <= id_7;
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_3,
      id_2,
      id_4,
      id_1,
      id_11,
      id_4,
      id_8,
      id_11,
      id_11,
      id_8,
      id_10,
      id_1,
      id_11,
      id_10,
      id_4,
      id_11,
      id_0
  );
  assign modCall_1.id_12 = 0;
  int id_13 (
      1'b0 ? -1 : id_5,
      id_6,
      -1,
      1,
      1
  );
endmodule

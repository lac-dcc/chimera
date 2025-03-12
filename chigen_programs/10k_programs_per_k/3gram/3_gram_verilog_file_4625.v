// Seed: 4267080981
module module_0 (
    input supply0 id_0,
    input wor id_1,
    output tri0 id_2,
    input tri0 id_3,
    input wand id_4,
    input uwire id_5,
    input supply1 id_6,
    output tri id_7,
    input tri0 id_8,
    input tri id_9,
    input supply1 id_10,
    input tri0 id_11,
    input wor id_12
);
  logic id_14;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output supply1 id_2,
    output logic id_3,
    output tri1 id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10,
    input uwire id_11
);
  logic id_13;
  nor primCall (id_2, id_0, id_13, id_9, id_11, id_1, id_8, id_5, id_10);
  initial id_3 <= id_11;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_4,
      id_5,
      id_11,
      id_9,
      id_9,
      id_7,
      id_10,
      id_8,
      id_1,
      id_0,
      id_6
  );
  assign modCall_1.id_1 = 0;
endmodule

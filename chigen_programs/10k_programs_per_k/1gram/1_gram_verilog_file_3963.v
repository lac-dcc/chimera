// Seed: 3305971711
module module_0 (
    output supply0 id_0
);
  wire id_2, id_3 = id_2, id_4 = id_2;
endmodule
module module_1 (
    input uwire id_0,
    output tri id_1,
    input wand id_2,
    input wire id_3,
    input wor id_4,
    input supply0 id_5,
    input supply1 id_6,
    output uwire id_7,
    output wor id_8,
    input wor id_9,
    input uwire id_10,
    output uwire id_11,
    output uwire id_12,
    input supply0 id_13,
    output tri id_14,
    input tri id_15,
    output supply1 id_16,
    output wand id_17,
    input supply1 id_18,
    input supply0 id_19,
    input supply1 id_20,
    input tri id_21
);
  wire id_23, id_24;
  xnor (
      id_7,
      id_23,
      id_19,
      id_0,
      id_6,
      id_3,
      id_21,
      id_10,
      id_13,
      id_5,
      id_4,
      id_18,
      id_20,
      id_15,
      id_9,
      id_24
  );
  module_0(
      id_7
  );
  wor id_25;
  id_26(
      id_18, 1, {id_15, (1), id_7, id_20}, id_25 * id_25 - 1, 1, {id_6 ? 1 : id_3{1}}, 1, 1
  );
endmodule

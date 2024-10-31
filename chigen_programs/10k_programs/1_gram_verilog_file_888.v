// Seed: 1430987194
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    output tri1 id_2,
    output wor id_3,
    output tri id_4,
    input tri id_5,
    output wire id_6,
    input supply0 id_7,
    output supply1 id_8,
    output uwire id_9,
    input wand id_10,
    output supply1 id_11,
    output wire id_12,
    input wand id_13,
    input tri0 id_14,
    output tri0 id_15,
    output tri id_16
);
  wire id_18, id_19;
endmodule
module module_1 (
    input tri id_0,
    output tri1 id_1,
    input supply0 id_2,
    input supply0 id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri1 id_6,
    output tri1 id_7,
    output tri id_8,
    output uwire id_9,
    output supply0 id_10
);
  wire id_12, id_13;
  id_14(
      .id_0(id_6.min < 1), .id_1(1)
  );
  nor (id_8, id_14, id_5, id_4, id_13, id_3, id_2, id_0);
  module_0(
      id_3,
      id_4,
      id_1,
      id_9,
      id_9,
      id_2,
      id_10,
      id_5,
      id_9,
      id_10,
      id_5,
      id_9,
      id_9,
      id_3,
      id_0,
      id_9,
      id_8
  );
endmodule

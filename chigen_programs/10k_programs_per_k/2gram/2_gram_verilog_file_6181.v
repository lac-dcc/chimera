// Seed: 2351525024
module module_0 (
    output supply0 id_0,
    output supply1 id_1,
    output wor id_2,
    input tri1 id_3,
    input supply1 id_4,
    input wand id_5,
    output tri1 id_6,
    output tri0 id_7,
    input supply1 id_8,
    input tri0 id_9,
    output tri id_10,
    input tri1 id_11,
    input tri0 id_12,
    input uwire id_13,
    output tri1 id_14,
    input tri0 id_15,
    input wire id_16
);
  id_18(
      .id_0(1)
  );
  assign module_1.id_2 = 0;
  always assert (id_3);
endmodule
module module_1 (
    output supply1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply0 id_4
);
  assign id_0 = 1'b0;
  nor primCall (id_1, id_4, id_2);
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_4,
      id_1,
      id_4,
      id_3,
      id_3,
      id_0,
      id_4,
      id_3
  );
endmodule

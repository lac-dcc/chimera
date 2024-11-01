// Seed: 3561765118
module module_0 (
    input tri0 id_0,
    input supply1 id_1,
    input tri1 id_2,
    output uwire id_3,
    input supply1 id_4,
    output tri1 id_5,
    output supply0 id_6,
    output supply0 id_7,
    input wire id_8,
    input tri1 id_9
);
  id_11(
      .id_0(), .id_1(id_8), .id_2(id_9), .id_3(), .id_4(1), .id_5(id_3), .id_6(id_8)
  );
endmodule
module module_1 (
    input  uwire id_0,
    input  tri0  id_1,
    input  tri   id_2,
    input  wor   id_3,
    output tri1  id_4
);
  module_0(
      id_3, id_3, id_2, id_4, id_3, id_4, id_4, id_4, id_3, id_2
  );
  assign id_4 = 1;
  nor (id_4, id_2, id_0, id_1, id_3);
endmodule

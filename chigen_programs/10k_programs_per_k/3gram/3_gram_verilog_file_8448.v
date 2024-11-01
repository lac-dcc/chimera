// Seed: 3108738909
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input wor id_2,
    input uwire id_3,
    output supply0 id_4,
    output wire id_5,
    input wor id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri0 id_9
);
  assign id_4 = 1;
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    output supply0 id_1,
    input tri0 id_2,
    output wire id_3,
    input tri1 id_4,
    inout wand id_5,
    output tri id_6
);
  nor (id_5, id_4, id_2);
  module_0(
      id_3, id_5, id_5, id_2, id_5, id_0, id_5, id_4, id_2, id_5
  );
endmodule

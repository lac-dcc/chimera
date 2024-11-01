// Seed: 2859006289
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    input wand id_3,
    output tri id_4,
    input tri1 id_5,
    input supply1 id_6,
    input tri1 id_7
);
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    output tri id_2,
    output uwire id_3,
    output uwire id_4,
    input wor id_5,
    input uwire id_6,
    input wor id_7,
    input tri1 id_8
);
  assign id_1 = 1;
  nor (id_1, id_6, id_0, id_8, id_7, id_5);
  module_0(
      id_0, id_8, id_0, id_8, id_3, id_5, id_6, id_6
  );
endmodule

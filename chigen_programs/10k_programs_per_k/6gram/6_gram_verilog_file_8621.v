// Seed: 1554387506
module module_0 (
    input tri id_0,
    input uwire id_1,
    input wand id_2,
    input tri0 id_3,
    output uwire id_4,
    input tri1 id_5,
    input tri id_6,
    output uwire id_7,
    input wand id_8,
    input supply1 id_9,
    input supply0 id_10,
    input wor id_11,
    output wor id_12
);
  assign id_7 = 1;
endmodule
module module_1 (
    input supply1 id_0,
    input wand id_1,
    input tri id_2,
    input wire id_3,
    input wor id_4,
    output wire id_5,
    inout supply0 id_6
);
  assign id_6 = 1 == id_1 ? 1 : id_1 ? id_0 : id_3;
  module_0(
      id_3, id_1, id_6, id_2, id_5, id_0, id_1, id_5, id_2, id_4, id_3, id_2, id_6
  );
endmodule

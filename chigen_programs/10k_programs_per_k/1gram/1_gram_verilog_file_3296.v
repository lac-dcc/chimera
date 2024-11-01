// Seed: 2116405276
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input uwire id_4,
    input uwire id_5,
    input uwire id_6
);
  id_8(
      !id_0, id_5
  );
  wire id_9;
endmodule
module module_1 (
    input tri id_0,
    input wand id_1,
    output tri0 id_2,
    input supply1 id_3
);
  tri1 id_5;
  module_0(
      id_3, id_2, id_3, id_2, id_3, id_1, id_0
  );
  assign id_5 = 1 - id_5;
endmodule
module module_2 (
    input wand id_0,
    inout supply1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input supply0 id_4
);
  wire id_6;
  module_0(
      id_2, id_1, id_2, id_1, id_0, id_3, id_4
  );
endmodule

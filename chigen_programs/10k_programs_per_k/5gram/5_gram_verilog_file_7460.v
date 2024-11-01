// Seed: 4061901388
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input wor  id_2,
    input wand id_3
);
  wire id_5 = ~id_3;
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    output wor id_2,
    output tri1 id_3
);
  tri id_5;
  nor (id_3, id_6, id_5, id_0);
  wand id_6 = id_5 - 1;
  module_0(
      id_1, id_0, id_0, id_1
  );
  wire id_7;
  assign id_2 = 1'b0;
endmodule
module module_2 (
    input  tri  id_0,
    input  tri1 id_1,
    output tri1 id_2
);
  wire id_4;
  module_0(
      id_1, id_0, id_0, id_1
  );
  wire id_5;
  wire id_6;
  wire id_7;
  assign id_6 = id_7;
endmodule

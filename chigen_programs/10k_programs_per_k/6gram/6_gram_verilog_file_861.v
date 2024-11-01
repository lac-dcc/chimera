// Seed: 1523814055
module module_0 (
    output supply1 id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    output tri1 id_4
);
  initial id_1 = 1'b0;
  module_2();
endmodule
module module_1 (
    input  tri0 id_0,
    input  tri0 id_1,
    input  wor  id_2,
    output tri0 id_3,
    input  wand id_4,
    output tri1 id_5,
    output tri0 id_6,
    output wor  id_7
);
  uwire id_9 = {id_4};
  module_0(
      id_3, id_9, id_1, id_9, id_5
  );
endmodule
module module_2;
  assign id_1 = 1;
endmodule

// Seed: 4235819811
module module_0 (
    input supply1 id_0,
    output tri1 id_1,
    output wor id_2,
    output wand id_3,
    output tri1 id_4
);
  assign id_2 = id_0;
  assign id_1 = 1;
  id_6(
      .id_0(id_2), .id_1(id_4)
  );
  assign id_4 = 1;
endmodule
module module_1 (
    input uwire id_0,
    output uwire id_1,
    input wire id_2,
    input wand id_3,
    input supply1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    output wand id_7
);
  assign id_1 = id_4;
  buf (id_1, id_2);
  module_0(
      id_2, id_5, id_5, id_1, id_1
  );
  always @(posedge 1 or posedge 1'b0 / id_0);
endmodule

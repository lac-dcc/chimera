// Seed: 1742866627
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    input wire id_3
);
  assign id_2 = id_1;
  module_2 modCall_1 ();
endmodule
module module_1 #(
    parameter id_8 = 32'd59,
    parameter id_9 = 32'd51
) (
    output wire id_0,
    input tri1 id_1,
    input tri0 id_2,
    input wand id_3,
    output tri1 id_4,
    output supply1 id_5,
    input supply1 id_6
);
  defparam id_8.id_9 = 1;
  or primCall (id_0, id_3, id_1, id_2, id_8, id_6);
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 ();
  assign id_1 = 1;
  assign module_0.type_3 = 0;
endmodule

// Seed: 4268919873
module module_0 (
    input wand id_0
    , id_11,
    input uwire id_1,
    output wand id_2,
    input tri id_3,
    input wor id_4,
    output wand id_5,
    input tri id_6,
    output tri id_7,
    output uwire id_8,
    input supply1 id_9
);
  assign id_11 = id_0 ? !id_6 : id_6;
  assign id_2 = 1, id_8 = id_6 != id_0;
  assign module_1.id_4 = 0;
  wire id_12;
endmodule
module module_1 #(
    parameter id_4 = 32'd78,
    parameter id_5 = 32'd12
) (
    output tri  id_0,
    output tri0 id_1,
    input  wor  id_2
);
  defparam id_4.id_5 = 1 - 1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_2,
      id_2,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2
  );
endmodule

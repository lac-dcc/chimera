// Seed: 4180124733
module module_0 #(
    parameter id_5 = 32'd17,
    parameter id_6 = 32'd30
) (
    input tri0 id_0,
    output wor id_1,
    input wand id_2,
    output supply0 id_3
);
  defparam id_5.id_6 = 1;
  wire id_7, id_8, id_9, id_10;
  assign module_1.type_2 = 0;
  wire id_11;
  wire id_12;
  wire id_13;
  wire id_14;
endmodule
module module_1 (
    output tri id_0
    , id_7,
    output tri1 id_1,
    output supply1 id_2,
    input wand id_3
    , id_8,
    input wand id_4,
    input wire id_5
);
  wire id_9, id_10;
  assign id_0 = 1;
  xnor primCall (id_1, id_7, id_4, id_5, id_3, id_10, id_8);
  module_0 modCall_1 (
      id_5,
      id_0,
      id_4,
      id_1
  );
endmodule

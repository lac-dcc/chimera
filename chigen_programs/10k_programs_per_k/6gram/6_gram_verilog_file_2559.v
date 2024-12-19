// Seed: 1131173370
module module_0 (
    input tri id_0,
    output tri1 id_1,
    input wor id_2,
    input wand id_3,
    input supply1 id_4,
    output wand id_5,
    input wire id_6,
    output wand id_7
);
  initial begin : LABEL_0
    deassign id_5;
  end
endmodule
module module_1 #(
    parameter id_7 = 32'd58,
    parameter id_8 = 32'd70
) (
    output supply1 id_0,
    input wand id_1,
    input wand id_2,
    input wand id_3,
    input supply0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2,
      id_1,
      id_2,
      id_0,
      id_4,
      id_0
  );
  assign modCall_1.type_1 = 0;
  defparam id_7.id_8 = 1;
endmodule

// Seed: 2574858765
module module_0 (
    output wor id_0,
    input wor id_1,
    input wire id_2,
    input tri1 id_3,
    output tri0 id_4,
    output supply1 id_5,
    input wand id_6
);
  assign id_4 = id_6;
  wire id_8;
  assign module_2.id_3 = 0;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output wand id_0,
    output wire id_1,
    input  wand id_2
);
  assign id_1 = (1'b0);
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2
  );
endmodule
module module_2 #(
    parameter id_6 = 32'd18
) (
    output wire id_0,
    output wor  id_1,
    input  tri0 id_2,
    input  wire id_3,
    input  tri0 id_4,
    output tri1 id_5,
    input  wor  _id_6,
    output wire id_7,
    output tri1 id_8
);
  wire id_10;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_3,
      id_2,
      id_8,
      id_8,
      id_4
  );
  assign id_1 = 1;
  always deassign id_8[id_6];
  wire id_11;
endmodule

// Seed: 3582062957
module module_0 (
    input wand id_0,
    input tri id_1,
    input supply1 id_2,
    input wand id_3,
    output wire id_4,
    output wand id_5
);
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1,
    input supply1 id_2,
    output tri1 id_3,
    input wire id_4,
    input tri id_5,
    input wand id_6,
    input supply0 id_7,
    output supply1 id_8,
    output tri id_9,
    input tri id_10
);
  wire id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_4,
      id_5,
      id_9,
      id_9
  );
  assign modCall_1.id_0 = 0;
  supply0 id_13;
  always @(posedge 1'b0 or id_0) id_13 = id_0;
endmodule

// Seed: 3036374828
module module_0 (
    output supply1 id_0,
    input wor id_1,
    output tri id_2,
    input uwire id_3,
    input tri1 id_4,
    input wire id_5,
    input supply1 id_6,
    input wor id_7
);
endmodule
module module_1 (
    output tri1 id_0,
    input tri0 id_1,
    output wand id_2,
    input tri0 id_3,
    input supply0 id_4,
    output tri1 id_5
);
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_1,
      id_1,
      id_3,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
  wor  id_7;
  wand id_8 = ~id_7 ? id_3 : 1'b0;
  wire id_9;
  assign id_5 = 1 < 1 ? 1 : id_1 == 1 ? id_3 : 1;
  always @(posedge 1 or posedge id_8) id_7 = 1;
endmodule

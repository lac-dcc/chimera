// Seed: 1740145378
module module_0 (
    output tri1 id_0,
    input  wor  id_1,
    output tri0 id_2
);
  assign id_0 = -1;
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    input wand id_2,
    input wand id_3,
    output wire id_4,
    input tri id_5,
    output tri id_6,
    input supply1 id_7,
    output supply0 id_8,
    input supply0 id_9,
    output tri1 id_10
);
  initial @(posedge id_1 or posedge 1) id_0 <= -1;
  nand primCall (id_0, id_2, id_5, id_9, id_3);
  module_0 modCall_1 (
      id_4,
      id_7,
      id_10
  );
  assign modCall_1.id_2 = 0;
endmodule

// Seed: 2535893806
module module_0 (
    input uwire id_0,
    input uwire id_1,
    input tri1 id_2,
    input tri0 id_3,
    output wand id_4,
    input wor id_5,
    output supply1 id_6,
    input tri0 id_7,
    input supply1 id_8,
    output uwire id_9
);
  assign id_4 = -1;
endmodule
module module_0 (
    output logic module_1,
    output tri   id_1,
    input  wire  id_2,
    input  wire  id_3,
    input  uwire id_4,
    output wor   id_5
);
  assign id_0 = {id_3, id_4};
  module_0 modCall_1 (
      id_2,
      id_4,
      id_2,
      id_3,
      id_1,
      id_3,
      id_5,
      id_4,
      id_2,
      id_5
  );
  assign modCall_1.id_9 = 0;
  bit id_7;
  always @(posedge id_4)
    if (1) id_0 <= 1;
    else id_7 <= id_3;
endmodule

// Seed: 3122728744
module module_0 (
    output tri0 id_0,
    input wand id_1,
    input tri0 id_2,
    output supply0 id_3,
    input wor id_4
);
  wire id_6;
  initial assert (1);
endmodule
module module_1 (
    output wor   id_0,
    output wand  id_1,
    output logic id_2,
    output tri   id_3,
    input  uwire id_4
);
  always_ff @(posedge id_4 or id_4) if (id_4) id_2 <= 1;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_4,
      id_3,
      id_4
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input supply1 id_0,
    input wand id_1,
    output tri id_2,
    output wand id_3
);
  assign id_3 = id_0;
  or primCall (id_2, id_1, id_6, id_5);
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_3,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule

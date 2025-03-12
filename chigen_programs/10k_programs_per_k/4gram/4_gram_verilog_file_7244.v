// Seed: 2370309376
module module_0 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri1  id_2
);
  wire [-1 : ""] id_4;
  assign module_1.id_1 = 0;
  parameter id_5 = 1;
endmodule
module module_1 (
    output tri  id_0,
    output wor  id_1,
    input  wand id_2
);
  logic id_4 = id_2;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 (
    output supply1 id_0,
    output uwire id_1,
    input tri1 id_2,
    input supply0 id_3,
    output supply0 id_4,
    input supply0 id_5,
    output logic id_6,
    input supply1 id_7
);
  always_ff @(posedge 1) id_6 = 1;
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5
  );
  assign modCall_1.id_0 = 0;
endmodule

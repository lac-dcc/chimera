// Seed: 105959512
module module_0 (
    output wand id_0,
    output wand id_1,
    output supply1 id_2,
    output supply0 id_3
);
  wire id_5;
endmodule
module module_1 (
    input  uwire id_0,
    input  uwire id_1,
    input  wand  id_2,
    input  wor   id_3,
    output tri   id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input  logic id_0,
    output wire  id_1,
    output logic id_2,
    output logic id_3
);
  assign id_1 = 1;
  always @(posedge 1'b0 or 1) for (id_3 = 1'b0; 1'b0; id_2 = id_0) id_3 = #1 id_0;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule

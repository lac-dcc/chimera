// Seed: 1068575386
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output wand id_2,
    output wire id_3
);
  module_2 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input supply1 id_1,
    output wand id_2,
    input supply1 id_3
);
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input tri0  id_0,
    input uwire id_1,
    input tri   id_2,
    input wire  id_3
);
  logic [7:0] id_5;
  always @(id_5[1])
    if (1'b0) id_5 = (-id_0);
    else;
endmodule

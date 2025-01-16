// Seed: 722721450
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input wire id_2,
    input wire id_3,
    input tri0 id_4,
    input supply0 id_5,
    input wand id_6,
    output wand id_7,
    input wand id_8,
    input tri0 id_9#(.id_11(id_5 == id_9))
);
  localparam id_12 = id_12;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input wire id_2,
    output tri1 id_3,
    input supply0 id_4
);
  wire id_6;
  wire id_7;
  generate
    assign id_3 = id_1;
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_2,
      id_2,
      id_0,
      id_1,
      id_3,
      id_2,
      id_4
  );
  assign modCall_1.type_4 = 0;
  wire id_8;
endmodule

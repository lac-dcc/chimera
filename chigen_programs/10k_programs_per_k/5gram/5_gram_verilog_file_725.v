// Seed: 3082591005
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input wor id_2,
    output tri1 id_3,
    output tri id_4,
    input wand id_5
    , id_11,
    output wand id_6,
    input uwire id_7,
    output wire id_8,
    input uwire id_9
);
  assign id_6 = -1'b0;
  wire id_12;
endmodule
module module_1 (
    output supply0 id_0,
    input tri1 id_1,
    input wire id_2,
    output uwire id_3,
    output tri1 id_4,
    output wire id_5,
    input tri0 id_6,
    output uwire id_7,
    input wor id_8,
    input tri0 id_9,
    output wand id_10,
    input supply0 id_11,
    input uwire id_12,
    output wire id_13
);
  generate
    assign id_3 = -1'b0;
  endgenerate
  module_0 modCall_1 (
      id_8,
      id_12,
      id_6,
      id_7,
      id_5,
      id_9,
      id_13,
      id_8,
      id_4,
      id_2
  );
  assign modCall_1.id_0 = 0;
endmodule

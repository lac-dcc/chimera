// Seed: 3527486616
module module_0 (
    input wire id_0,
    input tri id_1,
    input tri0 id_2,
    input tri0 id_3,
    input tri1 id_4,
    output supply0 id_5,
    input supply0 id_6,
    input supply1 id_7 id_16,
    input wand id_8,
    output wand id_9,
    output supply1 id_10,
    input tri id_11,
    output wand id_12,
    output tri1 id_13,
    output uwire id_14
);
  wire id_17 = id_16;
  wire id_18;
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    input  tri0  id_2,
    input  wor   id_3,
    output wor   id_4
);
  wire id_6;
  ;
  generate
    assign id_4 = id_3 ? -1 : 1;
    for (id_7 = -1; id_7; id_1 = id_3) begin : LABEL_0
      wire id_8[1 : 1];
      ;
    end
  endgenerate
  module_0 modCall_1 (
      id_3,
      id_2,
      id_0,
      id_2,
      id_3,
      id_4,
      id_0,
      id_0,
      id_2,
      id_4,
      id_4,
      id_2,
      id_4,
      id_4,
      id_4
  );
  assign modCall_1.id_10 = 0;
endmodule

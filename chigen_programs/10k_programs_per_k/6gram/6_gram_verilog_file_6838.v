// Seed: 2992894496
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wand id_2,
    input uwire id_3,
    input tri id_4
    , id_14,
    input supply1 id_5,
    input tri0 id_6,
    input wire id_7,
    input supply0 id_8,
    input uwire id_9
    , id_15,
    output wire id_10,
    output wor id_11,
    output uwire id_12
);
  wire id_16;
  always @(posedge id_16) begin : LABEL_0
    force id_2 = id_4 == id_8 - id_3;
  end
endmodule
module module_1 (
    output supply1 id_0,
    input tri id_1,
    output supply0 id_2
);
  wire id_4;
  always if (1);
  module_0 modCall_1 (
      id_1,
      id_2,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_0,
      id_2
  );
  assign modCall_1.id_10 = 0;
endmodule

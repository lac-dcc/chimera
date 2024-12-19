// Seed: 1650573151
module module_0 (
    input wor id_0,
    input wor id_1,
    output tri1 id_2,
    input uwire id_3,
    output supply1 id_4,
    input wor id_5,
    input wor id_6,
    output tri1 id_7,
    input tri1 id_8,
    output supply1 id_9
);
  wire id_11 = 1;
  always @(id_5) begin : LABEL_0
    disable id_12;
  end
  assign id_11 = 1 ? 1 : id_8;
  assign module_1.id_12 = 0;
endmodule
module module_1 (
    input tri id_0,
    output supply1 id_1,
    input supply0 id_2,
    input tri0 id_3,
    input tri0 id_4,
    output wor id_5,
    input supply0 id_6,
    input supply0 id_7,
    input supply0 id_8,
    output wand id_9,
    inout uwire id_10,
    input supply0 id_11,
    output tri id_12
    , id_14
);
  generate
    for (id_15 = 1 == id_4; 1; id_15 = 1) begin : LABEL_0
      wire id_16;
    end
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_10,
      id_10,
      id_10,
      id_1,
      id_3,
      id_11,
      id_12,
      id_0,
      id_12
  );
  assign id_1 = 1;
endmodule

// Seed: 3952772969
module module_0 (
    input tri id_0,
    input wor id_1,
    input uwire id_2,
    input uwire id_3,
    input wand id_4,
    input tri0 id_5,
    output wor id_6,
    input wor id_7,
    input supply0 id_8,
    input tri id_9,
    input tri id_10,
    input wand id_11,
    output wand id_12,
    input supply1 id_13,
    output supply0 id_14
);
  id_16(
      .id_0(1), .id_1(id_13 - id_8), .id_2(1)
  );
  assign module_1.id_10 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input tri0 id_1,
    input supply0 id_2,
    input tri id_3,
    input uwire id_4,
    input supply0 id_5,
    input supply1 id_6,
    output wand id_7
);
  tri  id_9;
  tri1 id_10;
  always @(1 or negedge 1)
    for (id_0 = 1; id_4; id_7 = 1 + 1) begin : LABEL_0
      id_0 = id_10;
    end
  module_0 modCall_1 (
      id_10,
      id_5,
      id_4,
      id_9,
      id_4,
      id_5,
      id_10,
      id_1,
      id_10,
      id_1,
      id_1,
      id_2,
      id_10,
      id_1,
      id_9
  );
  assign id_10 = id_9;
  wire id_11;
endmodule

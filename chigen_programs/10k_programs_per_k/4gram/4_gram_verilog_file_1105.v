// Seed: 3366777725
module module_0 (
    input tri1 id_0,
    input tri id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    input wor id_5,
    input supply1 id_6,
    input tri0 id_7,
    output tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri1 id_11
);
  wand id_13 = 1;
endmodule
module module_1 (
    input supply0 id_0,
    output supply0 id_1,
    output supply1 id_2,
    input wor id_3,
    output wor id_4,
    output wire id_5,
    input supply0 id_6,
    output tri0 id_7
);
  reg id_9;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_6,
      id_6,
      id_7,
      id_2,
      id_6,
      id_5
  );
  assign modCall_1.id_1 = 0;
  supply1 id_10;
  ;
  generate
    initial begin : LABEL_0
      id_9 <= id_10++;
    end
  endgenerate
endmodule

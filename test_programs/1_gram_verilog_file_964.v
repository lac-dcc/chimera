// Seed: 3099207292
module module_0 (
    input supply1 id_0,
    input tri id_1,
    input wor id_2,
    output tri id_3,
    input uwire id_4,
    output tri0 id_5,
    input wand id_6,
    output supply1 id_7,
    input supply0 id_8,
    output wor id_9,
    input wire id_10,
    input supply0 id_11,
    input wor id_12,
    input tri0 id_13,
    input tri1 id_14
);
  assign id_5 = id_2;
  tri0 id_16, id_17, id_18;
  assign id_3 = id_10;
  assign id_7 = id_18;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input  tri1 id_1
);
  generate
    assign id_0 = (1);
    begin : LABEL_0
      assign id_0 = id_1;
    end
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule

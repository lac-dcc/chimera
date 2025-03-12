// Seed: 1922687368
module module_0 (
    input wand id_0,
    input wor id_1,
    output supply1 id_2,
    input tri0 id_3,
    output uwire id_4
);
endmodule
module module_1 (
    input tri id_0,
    input uwire id_1,
    output tri0 id_2,
    input wand id_3,
    input wand id_4,
    input supply1 id_5,
    input wor id_6,
    input supply0 id_7,
    input uwire id_8,
    input wor id_9,
    output uwire id_10
);
  module_0 modCall_1 (
      id_0,
      id_7,
      id_2,
      id_9,
      id_2
  );
  assign modCall_1.id_3 = 0;
  logic id_12;
  initial begin : LABEL_0
    cover ((1));
  end
endmodule

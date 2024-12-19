// Seed: 2204302143
module module_0 (
    output wire id_0,
    output supply1 id_1,
    output supply1 id_2,
    input wand id_3,
    output wire id_4,
    input uwire id_5,
    input wor id_6,
    input tri0 id_7
    , id_12,
    output supply1 id_8,
    input wand id_9,
    input wor id_10
);
  wire id_13;
  wire id_14;
  initial begin : LABEL_0
    id_4 = 1;
  end
endmodule
module module_1 (
    output supply0 id_0,
    output tri1 id_1,
    input supply0 id_2,
    output uwire id_3
);
  always @(*) id_0 = id_2;
  wire id_5;
  wire id_6;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_2,
      id_0,
      id_2,
      id_2,
      id_2,
      id_3,
      id_2,
      id_2
  );
  assign modCall_1.id_6 = 0;
endmodule

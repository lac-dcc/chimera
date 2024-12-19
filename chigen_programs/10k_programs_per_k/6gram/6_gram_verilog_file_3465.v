// Seed: 3178899237
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output tri1 id_2,
    input wor id_3,
    output tri1 id_4,
    output wor id_5
);
  initial begin : LABEL_0
    cover (1'b0);
  end
  wire id_7;
  wire id_8;
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    input tri id_2,
    input wand id_3,
    output tri0 id_4,
    input supply1 id_5,
    input supply0 id_6,
    output wire id_7
);
  wand id_9 = 1;
  module_0 modCall_1 (
      id_3,
      id_1,
      id_4,
      id_0,
      id_4,
      id_4
  );
  assign modCall_1.type_9 = 0;
  assign id_7 = id_1 | $display(1 == 1);
  wire id_10;
  always disable id_11;
endmodule

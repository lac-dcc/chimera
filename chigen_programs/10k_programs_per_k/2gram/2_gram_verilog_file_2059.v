// Seed: 1830626125
module module_0 (
    output tri0 id_0,
    output wire id_1,
    input uwire id_2,
    input tri0 id_3,
    input supply1 id_4,
    output wand id_5,
    output wor id_6,
    input wire id_7
);
  always @(id_3);
  assign id_5 = 1'b0;
  wire [-1 : 1] id_9;
endmodule
module module_1 (
    input tri1 id_0,
    input tri id_1,
    input supply0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input tri0 id_5,
    input tri0 id_6,
    output supply1 id_7
    , id_10,
    input tri id_8
);
  always_latch begin : LABEL_0
    id_10 <= -1;
  end
  wire id_11;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_1,
      id_8,
      id_6,
      id_7,
      id_7,
      id_5
  );
  assign modCall_1.id_4 = 0;
endmodule

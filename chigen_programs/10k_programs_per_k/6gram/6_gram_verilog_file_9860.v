// Seed: 3557200868
module module_0 (
    output uwire id_0,
    input supply1 id_1,
    output tri id_2,
    input tri0 id_3,
    input tri0 id_4
);
  assign id_2 = id_1;
endmodule
module module_1 (
    input tri0 id_0,
    output uwire id_1,
    input wand id_2,
    output tri0 id_3,
    input wire id_4,
    input uwire id_5,
    output tri0 id_6,
    input wand id_7,
    input supply1 id_8,
    input tri id_9,
    output wor id_10,
    input supply1 id_11,
    input tri0 id_12,
    output tri id_13
);
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6,
      id_9,
      id_5
  );
  assign modCall_1.id_2 = 0;
  assign id_13 = 1;
  wire  id_15;
  logic id_16;
  always @(*) begin : LABEL_0
    $signed(90);
    ;
  end
endmodule

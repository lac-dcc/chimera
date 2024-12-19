// Seed: 2726900224
module module_0 (
    input tri0 id_0,
    input uwire id_1,
    input wor id_2,
    output tri1 id_3,
    output supply1 id_4,
    output uwire id_5,
    output wor id_6,
    input tri id_7,
    input wor id_8,
    input wor id_9,
    input uwire id_10,
    input wire id_11,
    input tri id_12,
    output tri id_13,
    output wand id_14,
    input wire id_15
    , id_17
);
  assign id_17 = id_11;
  assign module_1.id_2 = 0;
  always @(posedge 1) begin : LABEL_0
    wait (1);
  end
endmodule
module module_1 (
    output wand id_0,
    input  wand id_1,
    output tri  id_2
);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_0,
      id_2,
      id_0,
      id_2,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1
  );
  assign id_0 = id_1;
endmodule

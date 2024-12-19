// Seed: 3986971937
module module_0 (
    input supply1 id_0,
    input tri id_1
    , id_5, id_6,
    input tri1 id_2,
    input wire id_3
);
  reg id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15;
  assign id_15 = 1;
  always @(id_10 or id_6 & 1) begin : LABEL_0
    if (id_10) id_5 = id_10;
    else id_8 = id_14;
  end
  wire id_16, id_17;
  assign module_1.type_12 = 0;
  always_latch assign id_9 = id_13;
  wire id_18;
  wire id_19;
endmodule
module module_1 (
    input uwire id_0
    , id_8, id_9,
    output wire id_1,
    input tri id_2,
    input supply1 id_3,
    input tri id_4,
    output supply1 id_5,
    output supply1 id_6
);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_0
  );
  assign {id_2, 1} = id_9 * id_4;
  wire id_10;
endmodule

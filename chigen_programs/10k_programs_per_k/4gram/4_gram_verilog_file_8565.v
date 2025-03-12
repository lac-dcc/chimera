// Seed: 373583066
module module_0 (
    input tri id_0,
    input supply1 id_1,
    input supply0 id_2,
    output uwire id_3,
    output uwire id_4,
    input tri id_5,
    input uwire id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    output tri1 id_10,
    output supply1 id_11,
    output tri1 id_12,
    output tri id_13
    , id_21,
    input wand id_14,
    input supply0 id_15,
    output wand id_16,
    input wor id_17,
    input uwire id_18,
    input uwire id_19
);
  wire id_22;
  wire id_23, id_24;
  wire id_25;
  localparam id_26 = -1;
  always @(1 or posedge id_21)
    if (1) begin : LABEL_0
      id_21 <= -1;
    end
endmodule
module module_1 (
    input wand id_0,
    input wire id_1,
    output tri0 id_2,
    output tri0 id_3,
    output supply0 id_4,
    input supply1 id_5,
    input tri1 id_6
);
  wire [-1 : 1] id_8;
  nand primCall (id_3, id_0, id_5, id_1);
  module_0 modCall_1 (
      id_1,
      id_5,
      id_5,
      id_2,
      id_3,
      id_6,
      id_5,
      id_6,
      id_6,
      id_0,
      id_3,
      id_4,
      id_3,
      id_3,
      id_1,
      id_5,
      id_3,
      id_1,
      id_5,
      id_6
  );
  assign modCall_1.id_3 = 0;
endmodule

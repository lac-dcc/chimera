// Seed: 2994164502
module module_0 (
    input tri1 id_0
    , id_24,
    output supply0 id_1,
    output tri0 id_2,
    input wor id_3,
    input tri0 id_4,
    output uwire id_5,
    output uwire id_6,
    output wire id_7,
    output wand id_8,
    input supply0 id_9,
    input supply1 id_10,
    input uwire id_11,
    output wand id_12,
    input wor id_13,
    output tri0 id_14,
    output wand id_15,
    input wire id_16,
    output tri0 id_17,
    input wand id_18,
    input tri id_19,
    input tri0 id_20,
    input wire id_21,
    input supply0 id_22
);
  wire id_25;
  assign id_14 = 1 & id_16;
  wire  id_26;
  uwire id_27 = 1'b0 ==? id_16;
  wire  id_28;
  wire  id_29;
endmodule
module module_1 (
    output supply0 id_0,
    input tri0 id_1,
    input tri id_2,
    input tri1 id_3
);
  reg id_5;
  module_0 modCall_1 (
      id_3,
      id_0,
      id_0,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_1,
      id_0,
      id_3,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_1,
      id_1,
      id_3,
      id_2
  );
  always @(posedge 1) begin : LABEL_0
    disable id_6;
    id_5 <= id_6;
    disable id_7;
  end
  supply1 id_8;
  assign id_8 = 1;
endmodule

// Seed: 3907621880
module module_0 (
    output uwire id_0,
    output wand id_1,
    input tri id_2,
    input tri id_3,
    input wor id_4,
    input supply1 id_5,
    input supply1 id_6,
    input wire id_7,
    input supply0 id_8
);
  assign id_1 = id_8;
  bit  id_10;
  wire id_11;
  ;
  parameter id_12 = 1;
  longint id_13;
  ;
  always @(*) begin : LABEL_0
    id_10 <= id_8;
  end
endmodule
module module_1 (
    input tri0 id_0,
    output wire id_1,
    input wor id_2,
    output tri id_3,
    output wand id_4,
    input wand id_5,
    input uwire id_6
    , id_14,
    input tri0 id_7,
    output wor id_8,
    input tri1 id_9,
    input tri0 id_10,
    output supply1 id_11,
    input wand id_12
);
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_11,
      id_12,
      id_6,
      id_9,
      id_2,
      id_7,
      id_5,
      id_10
  );
  assign modCall_1.id_7 = 0;
  wire id_16;
  assign id_4 = id_9;
  wire id_17;
endmodule

// Seed: 2567186948
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    input wire id_2,
    input supply1 id_3,
    input wor id_4,
    input tri1 id_5,
    input wire id_6,
    input wire id_7,
    output tri id_8,
    input wire id_9,
    output wand id_10
    , id_15,
    input tri0 id_11,
    input wor id_12,
    output supply1 id_13
);
  assign id_10 = 1;
  wire id_16;
  wire id_17;
  wire id_18;
  assign id_13 = 1 ? id_1 : 1;
  assign id_8  = (1) & 1;
  wire id_19, id_20;
endmodule
module module_1 (
    input  tri1 id_0,
    output tri1 id_1,
    input  tri1 id_2,
    input  tri  id_3,
    output tri0 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_2,
      id_3,
      id_0,
      id_3,
      id_3,
      id_3,
      id_1,
      id_3,
      id_4,
      id_0,
      id_2,
      id_1
  );
  assign modCall_1.id_7 = 0;
  always @(posedge 1 or id_0) begin : LABEL_0
    id_1 = id_3;
  end
endmodule

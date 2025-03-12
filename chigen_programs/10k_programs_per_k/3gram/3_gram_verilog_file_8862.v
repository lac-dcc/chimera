// Seed: 1341486141
module module_0 (
    input wire id_0,
    output wire id_1,
    input wire id_2,
    output wire id_3,
    input tri0 id_4,
    input supply0 id_5,
    input tri1 id_6,
    input wand id_7,
    input tri0 id_8,
    input wor id_9,
    input tri0 id_10,
    input supply1 id_11,
    input wor id_12,
    input supply1 id_13,
    input wand id_14,
    output wor id_15,
    input wor id_16,
    input uwire id_17,
    output uwire id_18,
    input tri0 id_19,
    input wor id_20
    , id_22, id_23
);
  supply1 id_24;
  ;
  logic [-1 'b0 : 1] id_25;
  ;
  logic id_26;
  ;
  wire  id_27;
  logic id_28;
  ;
  assign id_24 = 1;
endmodule
module module_1 (
    input wire id_0,
    input wire id_1,
    output uwire id_2,
    input supply0 id_3,
    input wand id_4
    , id_9,
    output tri0 id_5,
    output wor id_6,
    input supply0 id_7
);
  genvar id_10;
  always @(posedge id_7 && id_0 && id_7) assign id_2 = 1 - 1;
  supply1 id_11 = -1'h0;
  wire id_12;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_7,
      id_5,
      id_1,
      id_4,
      id_4,
      id_7,
      id_1,
      id_0,
      id_0,
      id_1,
      id_4,
      id_0,
      id_0,
      id_2,
      id_4,
      id_7,
      id_6,
      id_0,
      id_1
  );
  assign modCall_1.id_11 = 0;
endmodule

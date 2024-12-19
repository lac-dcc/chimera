// Seed: 993791430
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    input tri module_0,
    input wand id_3,
    output uwire id_4,
    input wand id_5,
    input uwire id_6,
    input tri1 id_7,
    input uwire id_8,
    input tri0 id_9,
    output supply0 id_10,
    output wand id_11,
    input wire id_12,
    output supply0 id_13
    , id_17,
    input uwire id_14,
    input wire id_15
);
  assign module_1.id_6 = 0;
endmodule
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input wire id_2,
    input wire id_3,
    input tri id_4,
    input wire id_5,
    output tri id_6
);
  always_latch begin : LABEL_0
    disable id_8;
  end
  wor module_1 = id_3;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_5,
      id_0,
      id_6,
      id_4,
      id_5,
      id_5,
      id_3,
      id_3,
      id_6,
      id_6,
      id_5,
      id_6,
      id_2,
      id_2
  );
  always @(posedge 1) id_6 = ~id_2;
  wor id_9;
  assign id_9 = id_9++;
  wire id_10, id_11;
endmodule

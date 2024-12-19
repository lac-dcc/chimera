// Seed: 1660778733
module module_0 (
    output supply1 id_0,
    input supply1 id_1,
    output supply0 id_2,
    input tri0 module_0,
    input supply1 id_4,
    input supply1 id_5,
    output uwire id_6,
    input wire id_7,
    input supply0 id_8,
    input uwire id_9,
    output tri id_10,
    output tri1 id_11,
    output tri id_12
    , id_20,
    input supply0 id_13
    , id_21,
    output wor id_14,
    output tri1 id_15,
    input supply0 id_16,
    output supply0 id_17,
    input wire id_18
);
  wire id_22;
  always_latch @(*) begin : LABEL_0
    if (1) begin : LABEL_0
      wait (id_4);
      #1;
    end else release id_0;
  end
endmodule
module module_1 (
    input tri id_0,
    input supply1 id_1,
    input wor id_2,
    output tri1 id_3,
    input tri id_4,
    input wand id_5,
    input supply1 id_6,
    input wand id_7,
    output supply0 id_8,
    output supply1 id_9,
    input wand id_10,
    output supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14
);
  wire id_16;
  wire id_17;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_3,
      id_5,
      id_1,
      id_5,
      id_8,
      id_12,
      id_2,
      id_7,
      id_9,
      id_9,
      id_3,
      id_0,
      id_8,
      id_8,
      id_2,
      id_9,
      id_5
  );
  assign modCall_1.type_0 = 0;
  wire id_18;
  wire id_19 = 1;
  wire id_20;
endmodule

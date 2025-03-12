// Seed: 1180650252
module module_0 (
    input wor id_0,
    input tri1 id_1,
    output wor id_2,
    input tri1 id_3
    , id_26,
    output tri1 id_4,
    input tri id_5,
    input wor id_6,
    input wor id_7,
    input supply0 id_8,
    input supply1 id_9,
    input supply0 id_10,
    input tri1 id_11,
    output wor id_12,
    input tri1 id_13,
    output tri0 id_14,
    output wor id_15,
    input uwire id_16,
    input tri id_17,
    input supply1 id_18,
    input wor id_19,
    output uwire id_20,
    input supply1 id_21,
    input wor id_22,
    output tri1 id_23,
    input uwire id_24
);
  wire id_27;
  ;
  assign id_2 = -1;
  logic id_28;
  ;
  always begin : LABEL_0
    $clog2(57);
    ;
  end
endmodule
module module_1 (
    output tri0 id_0,
    input wand id_1,
    output wire id_2,
    input uwire id_3,
    output supply0 id_4,
    output tri id_5,
    output supply1 id_6,
    input tri0 id_7,
    input wire id_8
    , id_21,
    input wand id_9,
    input wor id_10,
    input wire id_11,
    output wor id_12,
    output tri id_13,
    input tri0 id_14,
    input wire id_15,
    input wand id_16,
    output wor id_17,
    input supply1 id_18,
    output tri0 id_19
);
  wire id_22;
  assign id_4 = id_16;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_8,
      id_0,
      id_11,
      id_10,
      id_11,
      id_18,
      id_11,
      id_9,
      id_8,
      id_2,
      id_9,
      id_0,
      id_17,
      id_10,
      id_10,
      id_16,
      id_18,
      id_4,
      id_16,
      id_15,
      id_6,
      id_16
  );
  assign modCall_1.id_20 = 0;
endmodule

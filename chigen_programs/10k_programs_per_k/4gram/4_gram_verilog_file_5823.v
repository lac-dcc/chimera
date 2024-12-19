// Seed: 1563503197
module module_0 (
    input supply1 id_0,
    input wor id_1,
    input supply1 id_2,
    input wand id_3,
    input wor id_4,
    output wor id_5,
    input uwire id_6,
    input supply1 id_7,
    output tri0 id_8
    , id_14,
    input wor id_9,
    input tri0 id_10,
    input wire id_11,
    input wire id_12
);
  initial begin : LABEL_0
    id_14 <= ~id_2;
  end
endmodule
module module_1 (
    input supply1 id_0,
    output wor id_1,
    input tri0 id_2,
    input supply0 id_3,
    output uwire id_4,
    input tri id_5,
    inout wand id_6,
    output wire id_7,
    input supply0 id_8,
    input wand id_9,
    input wire id_10,
    input tri id_11
);
  wire id_13;
  module_0 modCall_1 (
      id_11,
      id_5,
      id_8,
      id_5,
      id_11,
      id_4,
      id_9,
      id_10,
      id_6,
      id_8,
      id_5,
      id_0,
      id_6
  );
  assign modCall_1.type_1 = 0;
endmodule

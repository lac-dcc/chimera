// Seed: 2508385833
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri0 id_2,
    input wor id_3,
    input wand id_4,
    input tri0 id_5
);
  logic id_7 = id_4;
  wire  id_8;
endmodule
module module_1 (
    output wor id_0,
    input uwire id_1,
    input wor id_2,
    output wire id_3,
    output uwire id_4
    , id_21,
    input tri id_5,
    input wire id_6,
    inout uwire id_7,
    input wor id_8,
    input uwire id_9,
    input tri0 id_10,
    input wor id_11,
    input wire id_12,
    input uwire id_13,
    inout tri0 id_14,
    input supply1 id_15,
    output wand id_16,
    input uwire id_17,
    input supply0 id_18,
    output uwire id_19
);
  wire id_22;
  nand primCall (
      id_19,
      id_11,
      id_21,
      id_5,
      id_7,
      id_13,
      id_1,
      id_8,
      id_2,
      id_10,
      id_22,
      id_17,
      id_6,
      id_15,
      id_12,
      id_18,
      id_9,
      id_14
  );
  assign id_3 = ~id_11;
  module_0 modCall_1 (
      id_2,
      id_16,
      id_19,
      id_8,
      id_9,
      id_11
  );
  assign modCall_1.id_5 = 0;
endmodule

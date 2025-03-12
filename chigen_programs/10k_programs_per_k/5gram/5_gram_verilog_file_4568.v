// Seed: 4283795117
module module_0 (
    input tri id_0,
    input wand id_1,
    input supply0 id_2,
    input tri1 id_3,
    input supply1 id_4,
    output tri1 id_5
    , id_25,
    input wire id_6,
    input wire id_7,
    input wand id_8,
    input wor id_9,
    input wire id_10,
    output wire id_11,
    output tri0 id_12,
    input supply1 id_13,
    output supply0 id_14,
    output supply1 id_15,
    input supply1 id_16,
    input tri id_17,
    input tri id_18,
    input supply0 id_19,
    output uwire id_20,
    input uwire id_21,
    output uwire id_22,
    input wor id_23
    , id_26
);
  logic id_27;
  assign id_5 = id_3;
  assign module_1.id_4 = 0;
  assign id_5 = id_4;
  generate
    assign id_14 = |id_9;
  endgenerate
endmodule
module module_1 (
    input wire id_0,
    output uwire id_1,
    output uwire id_2,
    input supply1 id_3,
    output supply1 id_4,
    input supply0 id_5,
    input supply0 id_6,
    input wor id_7,
    output tri id_8,
    output tri id_9
);
  assign id_9 = id_0;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_7,
      id_5,
      id_8,
      id_7,
      id_5,
      id_0,
      id_3,
      id_0,
      id_4,
      id_2,
      id_3,
      id_9,
      id_4,
      id_6,
      id_3,
      id_6,
      id_7,
      id_4,
      id_0,
      id_1,
      id_0
  );
  wire id_11;
  wire id_12;
  assign id_11 = id_3;
endmodule

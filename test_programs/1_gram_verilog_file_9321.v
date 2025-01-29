// Seed: 2981602537
module module_0 (
    output supply0 id_0,
    output supply0 id_1,
    output tri0 id_2,
    input supply0 id_3,
    input supply1 id_4,
    input supply0 id_5,
    input wor id_6,
    id_25,
    input tri0 id_7,
    input wire id_8,
    output tri id_9,
    output wor id_10,
    id_26,
    output tri1 id_11,
    input uwire id_12,
    input tri0 id_13,
    output wor id_14,
    input wor id_15,
    input tri0 id_16,
    input supply1 id_17,
    output tri id_18,
    input wand id_19,
    input wire id_20,
    input wand id_21,
    output wire id_22,
    output tri0 id_23
);
  assign id_18 = id_25;
  wire id_27;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input wire id_0,
    output wire id_1,
    input logic id_2,
    input logic id_3,
    output tri0 id_4,
    input wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    input logic id_8
);
  logic id_10 = id_8, id_11, id_12;
  always_latch #1 id_10 <= {id_2{id_3}};
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_7,
      id_5,
      id_6,
      id_7,
      id_6,
      id_5,
      id_1,
      id_1,
      id_1,
      id_5,
      id_6,
      id_4,
      id_0,
      id_5,
      id_7,
      id_4,
      id_0,
      id_5,
      id_0,
      id_4,
      id_1
  );
  wire id_13, id_14, id_15;
endmodule

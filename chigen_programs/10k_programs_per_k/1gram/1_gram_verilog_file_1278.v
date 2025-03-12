// Seed: 997978867
module module_0 (
    input tri1 id_0,
    input wand id_1,
    output wand id_2,
    output uwire id_3,
    output wand id_4,
    input supply0 id_5,
    output tri0 id_6,
    output tri id_7,
    input supply1 id_8,
    input wire id_9,
    output tri1 id_10,
    input supply0 id_11,
    input tri id_12,
    output wand id_13,
    output wire id_14,
    output wire id_15,
    output supply0 id_16,
    input tri0 id_17
);
  parameter id_19 = 1;
  localparam id_20 = -1'b0;
  assign id_13 = id_9;
  logic [1 : -1] id_21, id_22 = -1;
endmodule
module module_1 (
    output wand id_0,
    input wand id_1,
    input wor id_2,
    output tri1 id_3,
    output wor id_4,
    input supply0 id_5,
    output supply1 id_6,
    output wire id_7,
    output supply0 id_8,
    output tri0 id_9
);
  wire id_11, id_12;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_8,
      id_8,
      id_6,
      id_5,
      id_4,
      id_7,
      id_1,
      id_1,
      id_0,
      id_1,
      id_5,
      id_7,
      id_3,
      id_0,
      id_6,
      id_5
  );
  assign modCall_1.id_7 = 0;
endmodule

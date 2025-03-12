// Seed: 4211757693
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    output tri id_3,
    input tri1 id_4,
    output supply1 id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    input supply0 id_9,
    input wire id_10,
    output wand id_11,
    output tri1 id_12,
    input supply1 id_13,
    output tri0 id_14
);
  assign id_5 = id_9;
  wire [-1 'h0 : 1] id_16;
  generate
    assign id_14 = ~id_4 == -1;
    assign id_1  = 1'b0;
  endgenerate
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    output uwire id_2,
    input wand id_3,
    output supply0 id_4,
    input wire id_5,
    output wand id_6,
    input supply0 id_7,
    input tri0 id_8,
    input tri1 id_9,
    output tri id_10
);
  localparam id_12 = 1;
  wire ["" : 1] id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_4,
      id_5,
      id_2,
      id_7,
      id_4,
      id_9,
      id_3,
      id_5,
      id_2,
      id_4,
      id_3,
      id_2
  );
  assign modCall_1.id_4 = 0;
  struct packed {id_15 id_16;} id_17;
endmodule

// Seed: 780665744
module module_0 (
    input wor id_0,
    input tri id_1,
    output tri id_2,
    input wand id_3,
    output supply1 id_4,
    input tri1 id_5,
    output supply1 id_6
    , id_19,
    output tri id_7,
    input supply0 id_8,
    input wand id_9,
    input supply0 id_10,
    output wire id_11,
    input supply0 id_12,
    output wor id_13,
    output supply1 id_14,
    input supply0 id_15,
    input supply1 id_16,
    output uwire id_17
);
  always @(id_15 or posedge id_8);
  assign id_19 = ~id_12 == -1;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd30
) (
    input wand id_0,
    output tri0 id_1,
    output supply0 id_2,
    output tri0 id_3,
    input tri1 id_4,
    input wand _id_5,
    output tri id_6,
    output wire id_7,
    output wor id_8,
    output tri1 id_9
);
  logic id_11 = id_4;
  wire [id_5 : 1 'b0] id_12;
  module_0 modCall_1 (
      id_0,
      id_4,
      id_1,
      id_0,
      id_7,
      id_0,
      id_8,
      id_8,
      id_0,
      id_0,
      id_0,
      id_8,
      id_0,
      id_2,
      id_3,
      id_0,
      id_4,
      id_7
  );
endmodule

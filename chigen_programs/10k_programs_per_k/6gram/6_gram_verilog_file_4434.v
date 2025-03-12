// Seed: 26683187
module module_0 (
    output wand id_0,
    input supply0 id_1,
    input uwire id_2,
    input wor id_3,
    output wor id_4,
    input supply1 id_5,
    input wand id_6,
    input supply1 id_7,
    input wor id_8,
    input tri id_9,
    output wire id_10,
    input wire id_11,
    output supply0 id_12,
    input supply0 id_13,
    output tri1 id_14,
    output tri id_15,
    input wor id_16,
    output wand id_17,
    output wor id_18
);
  wire id_20;
  localparam id_21 = 1'b0;
  wire id_22;
  assign id_15 = -1 && 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd80,
    parameter id_9 = 32'd56
) (
    input supply1 id_0,
    output supply0 id_1,
    input wor id_2
    , _id_9,
    input wire id_3,
    output supply0 _id_4,
    output supply1 id_5,
    input supply1 id_6,
    input wire id_7
);
  wire id_10 = id_2;
  logic [id_4 : 1 'h0 +  id_9] id_11 = -1;
  and primCall (id_1, id_2, id_3, id_0, id_6, id_11, id_10);
  module_0 modCall_1 (
      id_1,
      id_7,
      id_2,
      id_7,
      id_5,
      id_3,
      id_3,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_6,
      id_5,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule

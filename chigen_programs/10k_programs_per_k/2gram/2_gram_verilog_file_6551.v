// Seed: 703716141
module module_0 (
    input tri1 id_0,
    input wor id_1,
    input supply1 id_2,
    input tri1 id_3,
    input supply0 id_4,
    input wire id_5,
    input tri0 id_6,
    output tri1 id_7,
    input wand id_8,
    output supply0 id_9,
    output tri0 id_10,
    input supply1 id_11,
    input tri0 id_12,
    output tri id_13,
    input tri1 id_14,
    output tri0 id_15,
    input uwire id_16,
    input tri1 id_17,
    output supply1 id_18,
    input tri0 id_19,
    output wor id_20,
    output supply0 id_21
);
  wire id_23;
  localparam id_24 = 1;
  logic [-1 : 1  <=  1 'b0] id_25, id_26;
  wire id_27;
endmodule
module module_1 #(
    parameter id_3 = 32'd90,
    parameter id_4 = 32'd82
) (
    input tri0 id_0,
    input wor id_1,
    output wor id_2,
    input supply1 _id_3,
    input tri0 _id_4,
    output uwire id_5
);
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_5,
      id_1,
      id_2,
      id_5,
      id_1,
      id_1,
      id_5,
      id_0,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_5,
      id_5
  );
  assign modCall_1.id_10 = 0;
  wire id_7;
  ;
  wire [id_3 : -1 'b0 *  id_4] id_8;
  or primCall (id_5, id_1, id_0);
  logic [id_3 : 1] id_9;
endmodule

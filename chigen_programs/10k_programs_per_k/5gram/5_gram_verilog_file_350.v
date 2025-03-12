// Seed: 1828506261
module module_0 (
    input wire id_0,
    input uwire id_1,
    input tri0 id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input wor id_7,
    output tri0 id_8,
    input supply1 id_9,
    output wand id_10,
    output uwire id_11,
    output tri1 id_12,
    input wire id_13,
    input tri0 id_14,
    input uwire id_15,
    output uwire id_16,
    output supply0 id_17,
    input wor id_18
);
  wire id_20;
  ;
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_3 = 32'd25,
    parameter id_4 = 32'd56
) (
    output wor id_0,
    output wire id_1,
    input supply1 id_2,
    output tri0 _id_3,
    input wire _id_4
    , id_8,
    input uwire id_5,
    input tri0 id_6
);
  logic [id_3 : id_4] id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16;
  logic [7:0] id_17;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_2,
      id_2,
      id_6,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_5,
      id_6,
      id_6,
      id_0,
      id_0,
      id_5
  );
  always @(posedge -1 or posedge id_15 - 1) id_13 = id_17[1];
endmodule

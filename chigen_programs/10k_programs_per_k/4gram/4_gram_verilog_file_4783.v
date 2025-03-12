// Seed: 2249123239
module module_0 (
    input wor id_0,
    input tri0 id_1,
    input tri id_2,
    input supply1 id_3,
    input supply0 id_4,
    input supply0 id_5,
    output supply0 id_6,
    input tri0 id_7,
    output supply0 id_8,
    input wand id_9,
    input wire id_10,
    input wand id_11,
    output wire id_12,
    input tri0 id_13,
    input wor id_14,
    input supply0 id_15,
    input supply0 id_16,
    input supply0 id_17
);
endmodule
module module_1 #(
    parameter id_0 = 32'd95
) (
    input tri0 _id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input supply1 id_4,
    input tri id_5,
    output supply0 id_6
);
  logic id_8[1 'b0 ||  1 : id_0];
  ;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_5,
      id_3,
      id_4,
      id_1,
      id_6,
      id_2,
      id_6,
      id_5,
      id_4,
      id_3,
      id_6,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4
  );
  assign modCall_1.id_8 = 0;
  always_comb @(posedge 1 or posedge id_5) begin : LABEL_0
    if (-1 - 1) id_8 = id_1;
  end
endmodule

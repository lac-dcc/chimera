// Seed: 9358156
module module_0 (
    input supply1 id_0,
    output wand id_1,
    input wor id_2,
    output tri1 id_3,
    input uwire id_4,
    output wand id_5,
    input tri1 id_6,
    input wor id_7,
    input supply0 id_8[1 'b0 : -1]
);
  assign id_1 = {(1) {id_2}};
endmodule
module module_1 #(
    parameter id_6 = 32'd28,
    parameter id_9 = 32'd43
) (
    input uwire id_0,
    output wand id_1,
    output wand id_2,
    output supply1 id_3,
    output tri0 id_4,
    input wand id_5#(.id_19(-1 - 1)),
    input supply0 _id_6,
    input tri1 id_7,
    input wire id_8,
    input wor _id_9,
    output wand id_10,
    output wire id_11,
    input tri0 id_12,
    output wire id_13,
    output tri id_14,
    input tri0 id_15,
    input wire id_16,
    output wor id_17
);
  always @(posedge id_7) $unsigned(0);
  ;
  logic id_20;
  ;
  wire id_21;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_12,
      id_3,
      id_0,
      id_4,
      id_5,
      id_8,
      id_15
  );
  assign modCall_1.id_3 = 0;
  always id_20 = "" ^ 1;
  assign id_19[-1*id_6][-1&1 : id_9] = 1'b0 + id_20;
  logic id_22;
  bit [-1  ^  1 : 1] id_23, id_24;
  logic id_25;
  ;
  final begin : LABEL_0
    #(id_6) id_24 <= (id_7);
  end
endmodule

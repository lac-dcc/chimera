// Seed: 3677233074
module module_0 (
    output wor id_0,
    input supply0 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input wand id_4,
    input supply0 id_5,
    input wire id_6,
    output wand id_7,
    input wand id_8,
    input uwire id_9,
    input uwire id_10,
    output wor id_11,
    output wire id_12,
    input wire id_13,
    input supply1 id_14,
    input wor id_15,
    input tri0 id_16,
    input wire id_17,
    input wire id_18,
    output wor id_19,
    input wire id_20,
    output wor id_21
);
  assign id_21 = id_6 && 1;
  assign id_19 = 1;
  wire [1 : 1] id_23;
  supply1 id_24 = 1;
endmodule
module module_1 #(
    parameter id_0 = 32'd47
) (
    input supply0 _id_0,
    input tri0 id_1,
    output logic id_2,
    input supply1 id_3,
    input wor id_4,
    output wand id_5
);
  logic [7:0][id_0 : 1] id_7;
  module_0 modCall_1 (
      id_5,
      id_1,
      id_3,
      id_4,
      id_1,
      id_4,
      id_4,
      id_5,
      id_3,
      id_4,
      id_4,
      id_5,
      id_5,
      id_4,
      id_4,
      id_1,
      id_1,
      id_4,
      id_3,
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.id_2 = 0;
  wire id_8;
  ;
  always @(negedge 1) begin : LABEL_0
    id_2 <= 1;
  end
  assign id_7[-1<-1'b0] = 1'b0;
endmodule

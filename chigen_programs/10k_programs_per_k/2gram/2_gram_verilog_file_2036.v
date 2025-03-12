// Seed: 1340553772
module module_0 (
    input tri id_0,
    output wor id_1,
    input tri id_2,
    input wand id_3,
    input uwire id_4,
    output supply1 id_5,
    output uwire id_6,
    input wand id_7,
    output wand id_8,
    input wor id_9,
    input supply0 id_10,
    input uwire id_11,
    output wor id_12,
    output supply1 id_13,
    input supply1 id_14
);
endmodule
module module_1 #(
    parameter id_5 = 32'd74
) (
    output tri id_0,
    input wire id_1,
    output wand id_2,
    input wire id_3,
    input tri0 id_4,
    input wor _id_5,
    input supply0 id_6,
    input tri0 id_7,
    input wor id_8
    , id_16,
    input supply0 id_9,
    input supply1 id_10,
    input supply0 id_11,
    output logic id_12,
    input supply0 id_13,
    input wand id_14
);
  assign id_16 = id_9;
  logic [1 'b0 : (  id_5  )] id_17;
  wire id_18;
  xnor primCall (
      id_0, id_10, id_8, id_16, id_19, id_7, id_9, id_20, id_17, id_14, id_18, id_1, id_13
  );
  wire [1 : 1 'b0] id_19;
  logic id_20;
  assign id_16 = 1;
  initial begin : LABEL_0
    id_20 <= 1;
    id_12 = id_11;
  end
  module_0 modCall_1 (
      id_3,
      id_2,
      id_6,
      id_4,
      id_1,
      id_2,
      id_0,
      id_9,
      id_2,
      id_8,
      id_14,
      id_13,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_10 = 0;
endmodule

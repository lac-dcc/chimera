// Seed: 1437744266
module module_0 (
    input tri0 id_0,
    output tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output supply1 id_4,
    output logic id_5
    , id_21, id_22,
    input supply1 id_6,
    output wand id_7,
    input tri1 id_8,
    input uwire id_9,
    input tri0 id_10,
    input tri0 id_11,
    input tri1 id_12,
    input uwire id_13,
    input uwire id_14,
    output wire id_15,
    input tri0 id_16,
    output wand id_17,
    input wor id_18,
    output tri0 id_19
);
  always_ff @(id_12) begin : LABEL_0
    id_5 <= -1 & id_9;
  end
  wire id_23;
  assign module_1.id_7 = 0;
endmodule
module module_1 #(
    parameter id_14 = 32'd0,
    parameter id_4  = 32'd32
) (
    input tri0 id_0,
    output supply0 id_1,
    output supply0 id_2,
    output logic id_3,
    input wor _id_4,
    input wor id_5,
    input tri1 id_6,
    input wire id_7,
    output tri0 id_8,
    input tri1 id_9,
    input supply0 id_10,
    input uwire id_11,
    input tri id_12,
    input wor id_13,
    input supply0 _id_14
);
  parameter id_16 = (-1'd0 ? 1 : 1);
  module_0 modCall_1 (
      id_6,
      id_8,
      id_6,
      id_9,
      id_8,
      id_3,
      id_6,
      id_8,
      id_11,
      id_6,
      id_10,
      id_9,
      id_9,
      id_13,
      id_11,
      id_2,
      id_6,
      id_2,
      id_13,
      id_2
  );
  wire id_17;
  logic [id_4 : id_14  -  -1] id_18;
  initial begin : LABEL_0
    id_3 <= id_16;
  end
  wire id_19;
  ;
  supply0 [-1 : 1] id_20;
  logic id_21;
  ;
  assign id_20 = id_5 & (1);
  wire id_22;
endmodule

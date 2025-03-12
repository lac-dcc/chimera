// Seed: 2620205087
module module_0 (
    input wand id_0
    , id_22,
    output wand id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri0 id_4,
    output uwire id_5,
    input wand id_6,
    output wand id_7,
    output tri1 id_8,
    output wire id_9,
    input wor id_10,
    input wire id_11,
    input tri0 id_12,
    input wire id_13,
    input tri0 id_14,
    input tri1 id_15,
    input wor id_16,
    input tri0 id_17,
    output tri id_18,
    input tri0 id_19,
    input wire id_20
);
  wire id_23;
endmodule
module module_1 #(
    parameter id_10 = 32'd39
) (
    output tri1 id_0,
    output wand id_1,
    output uwire id_2,
    input wor id_3,
    input tri0 id_4,
    input tri0 id_5,
    output logic id_6,
    input supply1 id_7,
    input uwire id_8,
    input tri1 id_9,
    input supply1 _id_10,
    output tri1 id_11,
    input wire id_12,
    input supply0 id_13,
    output supply0 id_14,
    input tri1 id_15,
    input wand id_16,
    input tri0 id_17
);
  wire id_19;
  logic [7:0] id_20;
  ;
  always @(posedge id_20) begin : LABEL_0
    id_6 <= -1;
    disable id_21;
  end
  assign id_2 = id_19;
  wire id_22, id_23, id_24, \id_25 , id_26, id_27, id_28, id_29, id_30, id_31;
  if (1 != 1) begin : LABEL_1
    assign id_20[1] = 1;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_5,
      id_3,
      id_9,
      id_14,
      id_5,
      id_14,
      id_2,
      id_2,
      id_5,
      id_13,
      id_5,
      id_5,
      id_5,
      id_4,
      id_17,
      id_12,
      id_2,
      id_15,
      id_4
  );
  assign modCall_1.id_11 = 0;
  wire  [ 1 'b0 : 1] id_32;
  logic [id_10 : -1] id_33 = ((-1));
endmodule

// Seed: 493280724
module module_0 (
    input tri1 id_0,
    input tri1 id_1,
    input tri0 id_2,
    output supply1 id_3,
    input supply0 id_4,
    input wor id_5,
    output tri id_6,
    input tri id_7,
    input tri1 id_8,
    input tri0 id_9,
    input supply0 id_10,
    input wire id_11
    , id_19,
    output wor id_12,
    input tri0 id_13,
    output tri id_14,
    input tri id_15,
    input supply0 id_16,
    output uwire id_17
);
  wire id_20;
  ;
  logic [-1 : 1] id_21;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd52
) (
    input uwire id_0,
    output logic id_1,
    input wand _id_2,
    input supply0 id_3,
    output wor id_4,
    output tri1 id_5
);
  always_ff begin : LABEL_0
    id_1 <= id_2;
  end
  module_0 modCall_1 (
      id_0,
      id_3,
      id_3,
      id_4,
      id_0,
      id_3,
      id_4,
      id_0,
      id_0,
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_4,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_6 = 0;
  wire [id_2 : id_2] id_7;
endmodule

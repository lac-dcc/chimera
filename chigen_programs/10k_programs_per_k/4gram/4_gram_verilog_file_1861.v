// Seed: 1300403772
module module_0 (
    input wand id_0,
    output uwire id_1,
    input wor id_2,
    input tri id_3,
    output wor id_4,
    input supply0 id_5,
    input tri0 id_6,
    input wor id_7,
    input supply1 id_8,
    output uwire id_9,
    input tri0 id_10,
    input wand id_11,
    output logic id_12,
    output uwire id_13,
    input wand id_14,
    input tri id_15
    , id_18,
    input tri id_16
);
  wand id_19;
  assign id_13 = 1 ? (1) : ~id_14;
  parameter id_20 = 1;
  always @(posedge 1) begin : LABEL_0
    if (1) id_12 <= 1;
  end
  pulldown (id_6, id_16);
  assign id_19 = 1 ? (id_15) : -1;
  logic id_21;
endmodule
module module_1 #(
    parameter id_0 = 32'd12
) (
    input supply1 _id_0,
    input tri1 id_1,
    input wire id_2,
    output tri1 id_3,
    output logic id_4
    , id_10,
    output uwire id_5,
    output tri id_6,
    input wor id_7,
    output tri1 id_8
);
  wire id_11;
  ;
  logic [-1 : 1 'd0] id_12;
  ;
  module_0 modCall_1 (
      id_1,
      id_6,
      id_1,
      id_7,
      id_6,
      id_2,
      id_7,
      id_7,
      id_2,
      id_5,
      id_2,
      id_7,
      id_4,
      id_3,
      id_7,
      id_2,
      id_2
  );
  assign modCall_1.id_0 = 0;
  final begin : LABEL_0
    if (1) id_4 <= 1'b0 && -1'b0;
    else id_10[-1] = id_2 - id_11;
  end
  wire [id_0 : -1 'd0] id_13;
endmodule

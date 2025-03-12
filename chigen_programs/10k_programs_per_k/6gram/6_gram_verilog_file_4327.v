// Seed: 1983126328
module module_0 (
    input wire id_0,
    input tri0 id_1,
    output wire id_2,
    input wor id_3,
    input wire id_4,
    output tri1 id_5,
    input supply0 id_6,
    input wand id_7,
    input tri0 id_8,
    input wor id_9,
    output tri1 id_10
    , id_30,
    input tri0 id_11,
    input uwire id_12,
    input supply1 id_13,
    input tri id_14,
    output tri0 id_15,
    input tri id_16,
    output wand id_17,
    input supply1 id_18,
    input tri0 id_19,
    output uwire id_20,
    output wand id_21,
    input wand id_22,
    input tri id_23,
    input tri0 id_24,
    input wire id_25,
    input wor id_26,
    input wor id_27,
    output tri1 id_28
);
  assign id_17 = id_8 + id_9;
endmodule
module module_1 #(
    parameter id_5 = 32'd22,
    parameter id_6 = 32'd11
) (
    output supply1 id_0,
    output logic id_1,
    input tri1 id_2,
    input wand id_3,
    input uwire id_4,
    input tri1 _id_5,
    input wand _id_6,
    input wor id_7,
    output supply0 id_8,
    input wand id_9,
    input wor id_10
);
  reg [id_6 : id_5] id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_8,
      id_9,
      id_3,
      id_0,
      id_7,
      id_10,
      id_10,
      id_9,
      id_8,
      id_3,
      id_4,
      id_9,
      id_9,
      id_8,
      id_4,
      id_8,
      id_2,
      id_7,
      id_0,
      id_0,
      id_10,
      id_2,
      id_9,
      id_9,
      id_3,
      id_2,
      id_0
  );
  assign modCall_1.id_6 = 0;
  logic id_13;
  ;
  always @(posedge -1) begin : LABEL_0
    id_1 <= 1;
  end
  initial id_12 = -1;
  initial id_1 = id_13;
endmodule

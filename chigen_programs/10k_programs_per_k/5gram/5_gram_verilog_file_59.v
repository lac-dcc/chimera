// Seed: 4106890631
module module_0 (
    output tri0 id_0,
    output wor id_1,
    output tri1 id_2,
    output wand id_3,
    input tri0 id_4,
    input tri0 id_5,
    input tri0 id_6,
    input wor id_7,
    output uwire id_8,
    input wand id_9,
    output tri1 id_10,
    output wire id_11,
    input supply0 id_12,
    input tri0 id_13,
    output supply1 id_14,
    output uwire id_15,
    input tri1 id_16,
    input supply1 id_17,
    input tri id_18,
    input tri0 id_19,
    output tri id_20,
    input supply1 id_21,
    input uwire id_22,
    output tri0 id_23,
    input wor id_24
);
  assign id_11 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd60
) (
    output logic id_0,
    output tri0 id_1,
    input supply1 id_2,
    output logic id_3,
    input wire _id_4
);
  always @(posedge id_2 or posedge id_4) begin : LABEL_0
    id_3 = -1;
  end
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_1,
      id_1,
      id_2,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_17 = 0;
  wire [1  <  id_4 : id_4] id_6;
  always_ff @(posedge id_6) begin : LABEL_1
    id_0 = 1;
  end
  assign id_0 = 1;
endmodule

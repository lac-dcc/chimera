// Seed: 3264673313
module module_0 (
    output wor id_0,
    output tri1 id_1,
    input tri id_2,
    input uwire id_3 id_18,
    input tri0 id_4,
    input tri id_5,
    input wand id_6,
    input supply1 id_7,
    output uwire id_8,
    input supply0 id_9,
    output wire id_10,
    output wor id_11,
    input supply1 id_12,
    output tri1 id_13,
    input wor id_14,
    input wire id_15,
    input tri id_16
);
  logic id_19[1 'b0 : -1  ==  -1 'h0] = id_14;
endmodule
module module_1 #(
    parameter id_9 = 32'd27
) (
    input tri id_0,
    output wor id_1,
    output wor id_2,
    input uwire id_3,
    output uwire id_4,
    inout uwire id_5,
    output wand id_6,
    output wire id_7,
    output logic id_8,
    input wor _id_9,
    input supply0 id_10,
    input supply1 id_11,
    input wand id_12,
    output supply1 id_13
);
  uwire [1 : id_9] id_15 = 1;
  always @(posedge !id_12 or negedge id_9 - id_11) begin : LABEL_0
    id_8 <= id_12;
  end
  module_0 modCall_1 (
      id_7,
      id_7,
      id_5,
      id_12,
      id_0,
      id_11,
      id_5,
      id_12,
      id_5,
      id_5,
      id_4,
      id_2,
      id_3,
      id_13,
      id_11,
      id_3,
      id_5
  );
  assign modCall_1.id_5 = 0;
endmodule

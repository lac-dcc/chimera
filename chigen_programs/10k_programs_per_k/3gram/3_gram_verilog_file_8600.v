// Seed: 3239964969
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    input uwire id_2,
    input supply0 id_3,
    input wor id_4,
    input wire id_5,
    output tri id_6,
    output tri0 id_7,
    output uwire id_8,
    input wand id_9,
    output wire id_10,
    output tri0 id_11,
    input tri id_12,
    output tri0 id_13,
    input wor id_14
    , id_21,
    input tri0 id_15,
    output tri0 id_16,
    output wand id_17,
    output wor id_18,
    input uwire id_19
);
  parameter id_22 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd9
) (
    output tri1 id_0,
    output supply0 id_1,
    input tri id_2,
    input tri id_3
    , id_11,
    input wire _id_4,
    input wire id_5,
    output logic id_6,
    output wand id_7,
    input wor id_8,
    input tri0 id_9
);
  always_comb @(id_2 or posedge id_5) begin : LABEL_0
    id_6 <= 1'b0;
  end
  assign id_1 = -1'b0;
  logic [7:0][{ "" ,  1 'b0 } : id_4] id_12;
  id_13 :
  assert property (@(posedge -1) -1)
  else if ("" !=? -1) id_6 = 1;
  logic id_14;
  logic [-1 : 1] id_15;
  assign id_7 = id_12[-1];
  module_0 modCall_1 (
      id_8,
      id_3,
      id_5,
      id_9,
      id_5,
      id_9,
      id_7,
      id_1,
      id_1,
      id_2,
      id_0,
      id_0,
      id_3,
      id_1,
      id_9,
      id_3,
      id_1,
      id_1,
      id_0,
      id_2
  );
  wire id_16;
endmodule

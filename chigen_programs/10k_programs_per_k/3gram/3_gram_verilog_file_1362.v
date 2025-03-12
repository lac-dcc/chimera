// Seed: 3281021636
macromodule module_0 (
    input wire id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    input wire id_4,
    output tri id_5,
    input supply1 id_6,
    input wand id_7,
    input supply1 id_8,
    output supply0 id_9,
    input supply1 id_10,
    input wire id_11,
    output tri id_12,
    output tri1 id_13,
    output supply1 id_14,
    input wire id_15
);
  wire id_17;
  bit  id_18 ["" : -1];
  id_19 :
  assert property (@(posedge 1'h0) id_17)
  else begin : LABEL_0
    if (1) begin : LABEL_1
      id_18 <= (id_4);
    end
  end
  assign id_18 = id_2;
  localparam id_20 = 1;
  assign id_19 = -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd55,
    parameter id_8 = 32'd72
) (
    output uwire id_0,
    input wand id_1,
    input tri0 id_2,
    input wor id_3,
    output logic id_4,
    input wand _id_5,
    input supply0 id_6,
    input tri id_7,
    output wor _id_8,
    inout supply1 id_9,
    output supply1 id_10,
    output wand id_11,
    output supply0 id_12,
    input supply0 id_13,
    output supply1 id_14
);
  module_0 modCall_1 (
      id_7,
      id_3,
      id_7,
      id_14,
      id_13,
      id_12,
      id_6,
      id_9,
      id_2,
      id_9,
      id_1,
      id_1,
      id_0,
      id_9,
      id_0,
      id_6
  );
  assign modCall_1.id_12 = 0;
  wire [id_5 : -1] id_16;
  logic [1 : id_5  ==  -1] id_17["" : id_8];
  initial begin : LABEL_0
    id_4 = -1'b0;
  end
endmodule

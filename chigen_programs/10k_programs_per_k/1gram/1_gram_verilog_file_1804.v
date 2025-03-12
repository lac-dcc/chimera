// Seed: 1484996324
module module_0 (
    output wor   id_0,
    output tri1  id_1,
    output tri0  id_2,
    input  uwire id_3
    , id_6,
    output uwire id_4
);
  parameter id_7 = -1;
  logic id_8;
  assign id_0 = 1;
  assign id_0 = 'b0;
  reg [-1 : -1 'b0] id_9, id_10;
  initial begin : LABEL_0
    id_9 <= -1;
    @(posedge id_9) begin : LABEL_1
      id_6 <= id_3;
    end
  end
endmodule
module module_1 #(
    parameter id_18 = 32'd4,
    parameter id_19 = 32'd65,
    parameter id_20 = 32'd86,
    parameter id_22 = 32'd2
) (
    output supply1 id_0,
    output wand id_1,
    output logic id_2,
    output supply0 id_3,
    output wand id_4,
    input supply1 id_5,
    input tri1 id_6,
    output tri1 id_7,
    input tri1 id_8,
    input tri0 id_9,
    input supply1 id_10,
    input tri id_11,
    output supply0 id_12,
    output uwire id_13,
    output supply0 id_14,
    output uwire id_15
);
  always_comb id_2 <= -1;
  logic id_17;
  ;
  module_0 modCall_1 (
      id_0,
      id_14,
      id_3,
      id_5,
      id_1
  );
  assign modCall_1.id_9 = 0;
  tri1 _id_18 = id_18, _id_19 = id_5, _id_20 = -1'h0, id_21 = (id_10);
  wire [id_19 : 1] _id_22 = -1'b0, id_23 = -1 - 1;
  tri0 [id_18 : id_22] id_24 = id_21 == 1, id_25 = 1'b0;
  wire [(  id_19  ) : id_20] id_26 = id_23;
endmodule

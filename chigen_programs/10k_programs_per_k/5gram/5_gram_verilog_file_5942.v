// Seed: 346591668
module module_0 (
    output wire id_0,
    output supply1 id_1,
    input tri1 id_2,
    output supply1 id_3,
    input tri1 id_4,
    input wire id_5,
    input tri module_0,
    output wand id_7,
    input tri id_8,
    input tri id_9,
    input supply0 id_10
);
  assign #1 id_3 = 1;
endmodule
module module_1 #(
    parameter id_1 = 32'd13
) (
    input supply0 id_0,
    input supply0 _id_1,
    input supply1 id_2,
    input supply1 id_3,
    output wire id_4,
    output uwire id_5,
    output wor id_6,
    input wire id_7,
    input supply1 id_8,
    input wor id_9,
    input tri0 id_10,
    input uwire id_11,
    output wand id_12,
    input tri1 id_13,
    input supply0 id_14,
    input tri0 id_15
);
  logic [7:0] id_17;
  reg [id_1  ==?  -1 'b0 : -1] id_18;
  bit id_19;
  always_comb @(1) begin : LABEL_0
    id_17[-1 : 1] <= 1;
    id_18 <= #id_11 -1;
  end
  parameter id_20 = 1;
  module_0 modCall_1 (
      id_4,
      id_6,
      id_13,
      id_5,
      id_10,
      id_3,
      id_7,
      id_12,
      id_9,
      id_3,
      id_15
  );
  assign modCall_1.id_1 = 0;
  assign id_5 = !id_13;
  parameter id_21 = -1;
  reg id_22;
  initial begin : LABEL_1
    id_22 <= 'd0;
    id_19 <= id_1 + id_20;
  end
  wire id_23;
  ;
  assign id_19 = id_2;
endmodule

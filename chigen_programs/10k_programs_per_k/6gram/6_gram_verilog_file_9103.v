// Seed: 563329704
module module_0 (
    input supply0 id_0,
    input tri1 id_1,
    input supply0 id_2,
    input supply1 id_3,
    output supply1 id_4,
    input tri id_5
    , id_16,
    input wand id_6,
    input wire id_7,
    output wire id_8,
    input tri0 id_9,
    input wire id_10,
    input wire id_11,
    output wand id_12,
    input tri0 id_13,
    output tri id_14
);
  wire id_17;
  assign id_12 = id_5;
  wire id_18;
  initial begin : LABEL_0
    id_14 += -1'h0;
  end
  parameter id_19 = 1 ? -1 : 1 == 1;
  logic [1 'b0 : {  -1  ,  1  }] id_20;
  ;
  assign id_14 = 1;
  logic id_21;
  ;
  wire id_22;
endmodule
module module_1 #(
    parameter id_0 = 32'd98
) (
    input  tri1 _id_0,
    input  tri1 id_1,
    output tri  id_2
);
  tri0 id_4 = id_4#(.id_0(-1)) == 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_1,
      id_1,
      id_2,
      id_1,
      id_2
  );
  assign modCall_1.id_14 = 0;
  logic [7:0] id_5;
  always @(posedge id_5) begin : LABEL_0
    id_5[id_0] = -1'b0;
  end
endmodule

// Seed: 1585422779
module module_0 #(
    parameter id_3 = 32'd81,
    parameter id_6 = 32'd75
) (
    input tri1 id_0,
    output supply0 id_1,
    input wand id_2,
    input supply1 _id_3,
    input tri1 id_4,
    output wor id_5,
    input wire _id_6
);
  assign id_5 = id_2;
  assign module_1.id_5 = 0;
  wire [id_3 : id_3] id_8;
  wire [  id_6 : -1] id_9;
endmodule
module module_1 #(
    parameter id_2 = 32'd29,
    parameter id_4 = 32'd73
) (
    output tri0 id_0,
    output tri1 id_1,
    input tri0 _id_2,
    output logic id_3,
    input tri0 _id_4,
    input tri id_5,
    input uwire id_6,
    input uwire id_7
    , id_17,
    output wire id_8,
    input supply1 id_9,
    input supply1 id_10,
    input supply0 id_11,
    input tri id_12,
    input supply1 id_13,
    output supply0 id_14
    , id_18,
    input supply1 id_15
    , id_19
);
  logic [7:0] id_20;
  wire id_21;
  ;
  logic [id_4 : -1] id_22;
  assign id_17[1] = id_17 == 1'h0 | -1;
  assign #id_23 id_21 = id_12;
  assign id_21 = id_6;
  tri0 id_24;
  ;
  wire id_25;
  assign id_24 = 1;
  parameter id_26 = 1;
  assign id_20[-1] = id_21 ? 1 : id_26;
  always @(*) begin : LABEL_0
    id_3 = 1;
  end
  parameter id_27 = {id_26{-1}};
  assign id_22[-1'b0] = id_18;
  wire id_28;
  always_comb @(posedge id_15) begin : LABEL_1
    disable id_29;
  end
  assign id_25 = -1;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_5,
      id_23,
      id_5,
      id_14,
      id_23
  );
  logic [-1 'b0 : id_2] id_30;
  parameter [-1 : 1] id_31 = id_27;
endmodule

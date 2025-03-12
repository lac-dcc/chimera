// Seed: 3801098293
module module_0 (
    output tri id_0,
    input wand id_1,
    input uwire id_2,
    input tri id_3,
    input uwire id_4,
    input wand id_5,
    input supply1 id_6,
    output wor id_7,
    input wand id_8,
    output tri id_9,
    input supply1 id_10,
    input wor id_11,
    input tri id_12,
    input tri0 id_13,
    input tri id_14
    , id_17,
    output tri id_15
);
  assign id_17 = id_12;
  parameter id_18 = -1'h0;
  assign id_9 = id_8;
  assign id_9 = -1;
  localparam id_19 = 1 && id_18;
  logic id_20;
  wire  id_21;
  wire  id_22;
  always id_17 <= ~-1;
  logic id_23 = -1;
endmodule
module module_1 #(
    parameter id_10 = 32'd21,
    parameter id_16 = 32'd37,
    parameter id_26 = 32'd40,
    parameter id_3  = 32'd54
) (
    input uwire id_0,
    input tri id_1,
    output supply0 id_2,
    input wire _id_3,
    input wand id_4,
    input tri0 id_5,
    output supply0 id_6[-1 'b0 : 1],
    output tri1 id_7,
    input tri1 id_8,
    input wire id_9[-1 'd0 +  1 'b0 : -1],
    output wand _id_10,
    output logic id_11,
    input supply0 id_12,
    output uwire id_13,
    input uwire id_14
);
  wire _id_16;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_8,
      id_5,
      id_12,
      id_9,
      id_9,
      id_13,
      id_12,
      id_2,
      id_1,
      id_0,
      id_14,
      id_8,
      id_8,
      id_13
  );
  assign modCall_1.id_12 = 0;
  parameter id_17 = 1;
  logic [7:0]["" : (  1  )] id_18, id_19, id_20;
  for (id_21 = id_0; id_8; id_21 = 1) logic [-1 : -1] id_22;
  uwire id_23;
  logic id_24;
  always begin : LABEL_0
    id_11 <= 1 & id_18[1 : id_16];
  end
  logic id_25;
  ;
  assign id_23 = 1;
  wire _id_26;
  assign id_2 = id_1 - id_4;
  initial id_25 <= 1 != id_1;
  wire id_27;
  logic id_28;
  wire id_29;
  integer [id_3 : -1] id_30;
  ;
  logic id_31[id_10 : id_26];
endmodule

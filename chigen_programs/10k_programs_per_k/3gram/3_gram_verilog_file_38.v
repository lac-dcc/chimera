// Seed: 1502985443
module module_0 (
    input uwire id_0,
    output logic id_1,
    input uwire id_2,
    input uwire id_3
    , id_7,
    input supply1 id_4,
    input tri1 id_5
);
  initial begin : LABEL_0
    id_1 = id_2;
    id_1 <= id_0;
    `define pp_8 0
  end
endmodule
module module_1 #(
    parameter id_13 = 32'd73,
    parameter id_14 = 32'd1
) (
    output logic id_0,
    output wand id_1,
    input supply1 id_2,
    output wor id_3,
    output logic id_4,
    output supply1 id_5,
    input supply1 id_6,
    input uwire id_7,
    output tri0 id_8,
    output tri0 id_9,
    input tri0 id_10,
    input wand id_11,
    input tri0 id_12,
    input tri0 _id_13,
    input uwire _id_14,
    input wand id_15,
    input supply0 id_16,
    input tri1 id_17
    , id_20,
    input wor id_18
);
  assign id_20 = -1;
  tri1 [id_13 : -1] id_21 = 1;
  parameter id_22 = -1'd0 - 1 & -1;
  id_23 :
  assert property (@(-1'b0) -1)
  else id_0 = id_13;
  always_latch @(negedge id_20 or posedge 1'd0 + id_10) id_4 <= 1'b0;
  parameter integer id_24 = 1;
  wire id_25 = id_11;
  wire id_26;
  ;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_15,
      id_15,
      id_18,
      id_18
  );
  assign modCall_1.id_2 = 0;
  wire [-1 : id_14] id_27 = -1;
endmodule

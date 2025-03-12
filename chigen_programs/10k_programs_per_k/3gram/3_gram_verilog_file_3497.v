// Seed: 407961329
module module_0 (
    input  tri   id_0,
    input  uwire id_1,
    input  wor   id_2
    , id_8,
    input  wand  id_3,
    input  wor   id_4,
    input  wire  id_5,
    output tri0  id_6
);
endmodule
module module_1 #(
    parameter id_10 = 32'd69,
    parameter id_12 = 32'd73,
    parameter id_15 = 32'd76,
    parameter id_16 = 32'd50,
    parameter id_3  = 32'd55,
    parameter id_4  = 32'd60,
    parameter id_6  = 32'd42,
    parameter id_9  = 32'd79
) (
    input tri0 id_0,
    input wor id_1,
    output supply0 id_2,
    input wor _id_3,
    input tri _id_4,
    input supply0 id_5,
    input wand _id_6
    , id_18,
    output wand id_7,
    output tri0 id_8,
    input tri0 _id_9,
    output tri0 _id_10,
    output logic id_11,
    output supply0 _id_12,
    input supply1 id_13,
    input supply0 id_14,
    input supply0 _id_15,
    input wand _id_16
);
  wire id_19;
  always @(posedge -1 or negedge 1) id_11 <= 1;
  integer [-1 : id_6  |  (  1  -  -1  )] id_20;
  assign id_18 = -1;
  id_21 :
  assert property (@(id_9) id_3)
  else begin : LABEL_0
    $signed(82);
    ;
  end
  module_0 modCall_1 (
      id_13,
      id_13,
      id_1,
      id_5,
      id_13,
      id_14,
      id_8
  );
  wire [id_9 : id_16] id_22;
  struct packed {
    logic [id_10 : id_10] id_23;
    logic [id_15 : id_12] id_24;
  } [id_3 : id_12] id_25;
  wire [id_16 : id_4] id_26;
endmodule

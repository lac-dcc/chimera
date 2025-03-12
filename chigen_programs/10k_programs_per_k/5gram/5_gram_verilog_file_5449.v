// Seed: 3301714368
module module_0 (
    output tri0 id_0,
    input wor id_1,
    input wand id_2,
    output uwire id_3,
    input uwire id_4,
    output wor id_5,
    input tri id_6
    , id_20,
    input supply1 id_7,
    output tri0 id_8,
    output wand id_9,
    input uwire id_10,
    input wand id_11,
    output wand id_12,
    output wire id_13,
    input tri id_14,
    output uwire id_15
    , id_21,
    input wor id_16,
    input supply0 id_17,
    output tri id_18
);
  logic [-1 'b0 : 1] id_22 = -1'b0;
  tri id_23 = -1'b0;
  assign id_21 = id_17;
  assign id_20 = id_20;
  assign id_9  = -1'b0;
endmodule
module module_0 #(
    parameter id_11 = 32'd48
) (
    output wire id_0,
    input uwire id_1,
    output supply1 id_2,
    input supply1 id_3,
    output tri0 id_4,
    output wor id_5,
    output logic id_6
);
  localparam id_8 = -1 ^ 1;
  always_latch @(-1) id_6 <= -1;
  logic id_9;
  ;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_5,
      id_3,
      id_1,
      id_0,
      id_2,
      id_1,
      id_3,
      id_5,
      id_4,
      id_3,
      id_0,
      id_1,
      id_1,
      id_4
  );
  assign modCall_1.id_18 = 0;
  always @(posedge (1)) begin : LABEL_0
    assume #1  ((id_3)) $clog2(18);
    ;
  end
  logic id_10;
  logic _id_11;
  wire id_12;
  logic [1 : 1  ==  id_11] id_13;
  localparam id_14 = id_8;
  assign id_0 = module_1;
endmodule

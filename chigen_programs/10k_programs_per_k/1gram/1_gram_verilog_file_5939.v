// Seed: 4225300245
module module_0 (
    input supply0 id_0,
    output wand id_1,
    input uwire id_2,
    input tri id_3,
    input tri id_4,
    input wor id_5,
    input uwire id_6,
    input wor id_7,
    input supply0 id_8,
    output supply0 id_9,
    input supply1 id_10,
    output supply0 id_11,
    input tri0 id_12,
    output tri id_13,
    input supply0 id_14,
    input tri0 id_15,
    output wor id_16,
    input uwire id_17
);
  assign id_11 = id_2;
  assign id_16 = id_0;
endmodule
module module_1 #(
    parameter id_15 = 32'd99,
    parameter id_4  = 32'd34
) (
    input supply1 id_0
    , id_12,
    output logic id_1,
    input wand id_2,
    output logic id_3,
    input uwire _id_4,
    input wand id_5,
    output wand id_6
    , id_13,
    output logic id_7,
    input uwire id_8,
    input wire id_9,
    input wor id_10
);
  logic id_14;
  logic _id_15;
  assign id_12 = id_4;
  initial id_1#(1) <= -1 == {!1, -1, 1};
  always id_3 = id_4;
  always id_7 <= id_2;
  union packed {
    logic [1 : 1] id_16;
    logic id_17;
  } id_18;
  ;
  logic id_19;
  module_0 modCall_1 (
      id_0,
      id_6,
      id_2,
      id_5,
      id_9,
      id_5,
      id_8,
      id_9,
      id_8,
      id_6,
      id_9,
      id_6,
      id_10,
      id_6,
      id_8,
      id_8,
      id_6,
      id_9
  );
  assign modCall_1.id_5 = 0;
  wire [id_15 : ~  -1  ^  id_4] id_20[-1 'b0 : 1 'd0];
  wire id_21;
endmodule

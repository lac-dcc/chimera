// Seed: 564413163
module module_0 (
    input  tri0  id_0,
    input  tri   id_1,
    output wand  id_2,
    input  tri0  id_3,
    output tri1  id_4,
    input  wand  id_5,
    output tri0  id_6,
    input  wire  id_7,
    input  wire  id_8,
    input  tri   id_9,
    input  tri0  id_10,
    input  uwire id_11,
    input  tri0  id_12,
    input  wire  id_13,
    input  uwire id_14
);
  assign id_2 = 1;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_5 = 32'd50
) (
    input supply1 id_0,
    output tri1 id_1,
    input tri0 id_2,
    output tri1 id_3,
    input wor id_4,
    input tri0 _id_5,
    input wand id_6,
    input wor id_7,
    output tri0 id_8
    , id_18,
    input wire id_9,
    output logic id_10,
    input supply0 id_11,
    input tri id_12,
    output tri0 id_13,
    input wire id_14,
    input wand id_15,
    input tri0 id_16
);
  always @(negedge !id_12 or posedge id_0) id_10 <= #id_15 -1;
  assign id_18 = id_7;
  assign {-1, id_4 < id_15, id_0} = -1'd0;
  parameter id_19 = -1 == 1;
  module_0 modCall_1 (
      id_15,
      id_16,
      id_3,
      id_2,
      id_13,
      id_2,
      id_3,
      id_7,
      id_11,
      id_4,
      id_4,
      id_15,
      id_15,
      id_12,
      id_0
  );
  wire [1 : id_5] id_20 = id_12;
  assign id_13 = -1'h0 < id_7;
  assign id_18[-1] = -1;
endmodule

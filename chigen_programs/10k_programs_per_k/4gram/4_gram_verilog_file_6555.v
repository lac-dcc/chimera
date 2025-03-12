// Seed: 892152687
module module_0 (
    input tri1 id_0,
    input uwire id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wor id_4
);
  parameter id_6 = "";
  reg id_7[-1 : 1  ==  1];
  assign id_7 = id_1;
  always_latch @(posedge id_1) id_7 <= 1;
  wire id_8;
  wand id_9;
  assign id_9 = id_4;
  assign #1 id_9 = -1;
  always @(*)
    if (-1) begin : LABEL_0
      id_7 <= 1;
    end
endmodule
module module_1 #(
    parameter id_10 = 32'd24,
    parameter id_11 = 32'd19
) (
    input tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    input uwire id_3,
    input wand id_4,
    input wire id_5,
    input supply1 id_6,
    output supply0 id_7,
    input tri id_8,
    input uwire id_9,
    input supply0 _id_10,
    output supply1 _id_11
);
  parameter id_13 = -1;
  logic [7:0][-1 'b0 : 1  ^  (  -1  )] id_14;
  logic [id_10 : ""] id_15 = id_14;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_5,
      id_2
  );
  assign modCall_1.id_2 = 0;
  logic [id_11 : -1 'b0] id_16;
  ;
  assign id_7 = id_14;
  assign id_14[1] = 1;
endmodule

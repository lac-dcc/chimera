// Seed: 1849001372
module module_0 (
    output tri0 id_0,
    input wor id_1,
    output wor id_2,
    input supply0 id_3,
    input wand id_4,
    input supply0 id_5,
    input uwire id_6,
    output tri1 id_7,
    input wire id_8,
    input wor id_9,
    output supply0 id_10,
    output supply1 id_11,
    input uwire id_12,
    input supply0 id_13,
    input wand id_14,
    output tri0 id_15
);
  initial $clog2(66);
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 #(
    parameter id_11 = 32'd35,
    parameter id_12 = 32'd29,
    parameter id_5  = 32'd2
) (
    input tri1 id_0,
    output tri1 id_1,
    input tri id_2,
    output wand id_3,
    input supply1 id_4,
    input supply0 _id_5
);
  wire id_7;
  reg [id_5 : 1] id_8, id_9, id_10;
  parameter id_11 = 1 - 1 * 1;
  wire _id_12, id_13, id_14;
  wire [1 : id_12] id_15;
  wire id_16, id_17;
  defparam id_11 = -1'b0 & !(-1), id_11 = $realtime;
  module_0 modCall_1 (
      id_3,
      id_4,
      id_1,
      id_2,
      id_2,
      id_2,
      id_0,
      id_3,
      id_2,
      id_4,
      id_1,
      id_1,
      id_4,
      id_4,
      id_2,
      id_1
  );
  always_ff id_9 <= id_10;
endmodule

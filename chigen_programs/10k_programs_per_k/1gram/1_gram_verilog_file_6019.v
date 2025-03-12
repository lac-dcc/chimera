// Seed: 3439259636
module module_0 #(
    parameter id_6 = 32'd29,
    parameter id_7 = 32'd23
) (
    input tri id_0,
    output supply1 id_1
    , id_5, _id_6,
    output uwire id_2,
    output supply1 id_3
);
  wire _id_7;
  parameter id_8 = 1 ? -1 : 1;
  initial $unsigned(39);
  ;
  localparam id_9 = -1 - id_8;
  logic [$realtime : 1] id_10, id_11;
  genvar id_12;
  wire id_13;
  wire id_14, id_15;
  assign id_7 = id_15;
  wire [1 : {  id_6  {  id_7  }  }] id_16, id_17;
  final $clog2(id_7);
  ;
  reg [1 : -1  |  1] id_18;
  always if (id_9) id_18 <= id_10 + 1'b0 / 1;
  wire id_19 = id_17;
  always_latch id_18 <= -1;
  assign id_15 = id_6;
endmodule
module module_1 (
    input supply1 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wor id_4,
    input wor id_5,
    input uwire id_6[1  &  1 'b0 : -1],
    output wor id_7,
    input wor id_8
);
  assign id_7 = id_3;
  module_0 modCall_1 (
      id_3,
      id_7,
      id_4,
      id_7
  );
  assign modCall_1.id_7 = 0;
  assign id_7 = 1;
endmodule

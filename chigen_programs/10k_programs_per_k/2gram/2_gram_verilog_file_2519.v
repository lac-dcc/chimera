// Seed: 1888075193
module module_0 (
    input  uwire id_0,
    output uwire id_1,
    input  wire  id_2,
    input  tri   id_3
);
endmodule
module module_1 #(
    parameter id_11 = 32'd33,
    parameter id_3  = 32'd63
) (
    input supply0 id_0,
    input wand id_1,
    input tri0 id_2,
    input wor _id_3,
    input uwire id_4,
    output wire id_5,
    input wire id_6,
    input supply0 id_7,
    input supply1 id_8,
    input tri0 id_9
);
  parameter [-1 : id_3] id_11 = "" || -1'd0;
  logic [-1 : -1  -  1] id_12 = -1'b0;
  genvar id_13;
  assign id_13 = id_2;
  always_latch begin : LABEL_0
    $unsigned(id_11);
    ;
  end
  logic [id_11 : 1] id_14;
  ;
  module_0 modCall_1 (
      id_0,
      id_5,
      id_8,
      id_2
  );
  assign modCall_1.id_2 = 0;
endmodule

// Seed: 3031248870
module module_0 #(
    parameter id_1 = 32'd74,
    parameter id_8 = 32'd7
) (
    output tri0 id_0,
    output supply1 _id_1,
    input wor id_2,
    output tri id_3[id_1 : id_8],
    input tri id_4,
    output tri id_5,
    output supply0 id_6,
    input uwire id_7,
    input tri _id_8
    , id_10
);
  assign id_3 = id_2;
  assign id_6 = $unsigned(26);
  ;
  logic id_11;
  ;
  wire id_12["" : 1 'b0 ==  -1];
  assign id_6 = 1 == -1'b0;
  localparam id_13 = 1'h0;
  logic id_14;
  always_ff @({id_8 ? id_12 : id_7, id_14 ? id_12 : 1}, negedge 1) if (id_13) id_11 <= 1 - -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd95
) (
    input  wire id_0,
    output wire id_1
    , _id_4,
    input  tri0 id_2
);
  assign id_4 = id_4#(.id_0(1));
  module_0 modCall_1 (
      id_1,
      id_4,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_0,
      id_4
  );
  wire [id_4 : -1] id_5;
  parameter id_6 = 1;
  wire  id_7;
  logic id_8;
endmodule

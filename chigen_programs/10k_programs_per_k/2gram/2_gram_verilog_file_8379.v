// Seed: 3777120791
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output supply1 id_3;
  output wire id_2;
  output wire id_1;
  wire id_9;
  parameter id_10 = 1;
  assign id_3 = 1'b0;
endmodule
module module_1 #(
    parameter id_5 = 32'd8
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    id_6
);
  inout wire id_6;
  input wire _id_5;
  inout reg id_4;
  inout logic [7:0] id_3;
  input wire id_2;
  output wire id_1;
  wire id_7;
  assign id_3[id_5-1] = -1;
  parameter id_8 = 1;
  assign id_7 = id_5;
  always_ff id_4 <= (1'b0);
  supply0 id_9 = 1'h0;
  module_0 modCall_1 (
      id_9,
      id_7,
      id_7,
      id_2,
      id_8,
      id_6,
      id_7,
      id_8
  );
  final begin : LABEL_0
    $clog2(13);
    ;
  end
  assign id_4 = -1;
endmodule

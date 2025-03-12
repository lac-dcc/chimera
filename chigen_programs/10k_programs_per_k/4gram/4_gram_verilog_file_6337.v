// Seed: 3184755897
module module_0 (
    id_1,
    id_2
);
  inout logic [7:0] id_2;
  output wire id_1;
  assign id_2[1] = 1;
  id_3 :
  assert property (@(posedge 1) id_3)
  else $clog2(47);
  ;
  assign id_3 = 1;
  always_latch id_3 <= -1;
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_12,
      id_1
  );
  output wire id_9;
  output wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire _id_4;
  output wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  generate
    assign id_11 = id_12;
    wire id_13 = id_1[id_4 : 1];
  endgenerate
endmodule

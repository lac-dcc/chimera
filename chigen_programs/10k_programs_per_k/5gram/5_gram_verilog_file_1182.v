// Seed: 2087427910
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
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_9;
  assign module_1.id_5 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd88,
    parameter id_5 = 32'd84,
    parameter id_7 = 32'd3
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    _id_5
);
  inout wire _id_5;
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  output reg id_1;
  wire id_6;
  wire _id_7, id_8;
  logic [-1  ==  id_5  /  1 : id_4  .  id_7] id_9;
  ;
  logic id_10;
  ;
  wire id_11;
  tri0 id_12;
  assign id_10 = id_6;
  nor primCall (id_1, id_9, id_12, id_11, id_8);
  assign id_10 = id_7;
  always_ff @(posedge id_6 or posedge id_7) id_1 <= id_6;
  module_0 modCall_1 (
      id_12,
      id_10,
      id_10,
      id_9,
      id_12,
      id_12,
      id_6,
      id_10
  );
  assign id_12 = -1 == 1'b0 && id_5;
endmodule

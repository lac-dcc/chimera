// Seed: 3318577699
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  output wire id_8;
  input wire id_7;
  assign module_1.id_3 = 0;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_1 = id_7;
endmodule
module module_1 #(
    parameter id_3 = 32'd85,
    parameter id_6 = 32'd86
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  inout wire id_5;
  output wire id_4;
  input wire _id_3;
  output wire id_2;
  output tri1 id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_5,
      id_5,
      id_7,
      id_5,
      id_7,
      id_7,
      id_5
  );
  wand [1 : id_3  ==  id_6] id_9 = 1'h0;
  wire id_10;
  tri0 id_11 = -1;
  assign id_1 = 1'b0;
  initial begin : LABEL_0
    assert (1);
  end
endmodule

// Seed: 2975155811
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_12;
  ;
endmodule
module module_1 #(
    parameter id_0 = 32'd34,
    parameter id_1 = 32'd19,
    parameter id_5 = 32'd15,
    parameter id_8 = 32'd35
) (
    output wor  _id_0
    , id_3,
    input  wand _id_1
);
  logic id_4  [id_0  ==  id_0 : -1 'b0];
  wire  _id_5;
  ;
  bit [1 : id_5] id_6, id_7, _id_8;
  wire [(  id_1  ) : id_8] id_9;
  wire id_10;
  assign id_7 = id_3;
  assign id_3 = id_1;
  id_11 :
  assert property (@(posedge id_9) id_1)
  else $clog2(78);
  ;
  wire id_12;
  initial begin : LABEL_0
    id_7 = 1 | (id_8);
    id_3[1] <= 1;
  end
  wire id_13;
  ;
  module_0 modCall_1 (
      id_13,
      id_11,
      id_11,
      id_9,
      id_4,
      id_13,
      id_4,
      id_11,
      id_13,
      id_12,
      id_9
  );
endmodule

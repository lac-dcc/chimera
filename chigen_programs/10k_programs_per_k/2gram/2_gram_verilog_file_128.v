// Seed: 4233399155
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output uwire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output uwire id_2;
  inout wire id_1;
  assign id_6 = 1;
  wire [-1 : (  1  -  1 'b0 )] id_8;
  assign id_2 = 1;
  wire  id_9;
  logic id_10;
  ;
endmodule
module module_1 #(
    parameter id_2 = 32'd5,
    parameter id_3 = 32'd25
) (
    id_1,
    _id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire _id_3;
  input wire _id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_4,
      id_7,
      id_1,
      id_9,
      id_1,
      id_4
  );
  always begin : LABEL_0
    id_5[id_3] = id_5#(-1'b0);
  end
  wire [1 : id_2  ==  -1] id_10;
endmodule

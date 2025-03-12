// Seed: 3051784614
module module_0 #(
    parameter id_1 = 32'd97,
    parameter id_6 = 32'd86
) (
    _id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7
);
  input wire id_7;
  output wire _id_6;
  input wire id_5;
  inout wire id_4;
  output logic [7:0] id_3;
  assign module_1._id_0 = 0;
  inout wire id_2;
  inout wire _id_1;
  wire  id_8;
  logic id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd91,
    parameter id_1 = 32'd47,
    parameter id_3 = 32'd51,
    parameter id_5 = 32'd31
) (
    input tri   _id_0,
    input uwire _id_1,
    input uwire id_2,
    input wire  _id_3
);
  wire [1 : {  id_0  ,  id_3  }] _id_5;
  logic [7:0][id_1  #  (  .  id_5  (  1  )  ) : 1] id_6;
  wire id_7;
  assign id_5 = id_0;
  wire id_8, id_9, id_10;
  module_0 modCall_1 (
      id_5,
      id_8,
      id_6,
      id_10,
      id_8,
      id_5,
      id_8
  );
  assign id_6[-1+!-1] = -1;
endmodule

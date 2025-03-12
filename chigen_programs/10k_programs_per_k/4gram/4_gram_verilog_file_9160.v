// Seed: 3508957894
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_4 :
  assert property (@(posedge id_4) id_1)
  else $clog2(46);
  ;
endmodule
module module_1 #(
    parameter id_6 = 32'd38
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  module_0 modCall_1 (
      id_7,
      id_5,
      id_4
  );
  input wire _id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output logic [7:0] id_2;
  input wire id_1;
  nand primCall (id_4, id_10, id_5, id_3, id_11, id_7, id_1);
  wire id_12;
  assign id_2[id_6] = id_7;
endmodule

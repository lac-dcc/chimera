// Seed: 698572990
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
    id_11,
    id_12
);
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output tri id_2;
  output wire id_1;
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_4 = 32'd17
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5[id_4 : id_4];
  ;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_5,
      id_5,
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_5,
      id_5
  );
  integer id_6;
  id_7 :
  assert property (@(posedge id_7) id_6)
  else $signed(57);
  ;
endmodule

// Seed: 878124222
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
    id_10
);
  inout wire id_10;
  output wire id_9;
  output wire id_8;
  inout wire id_7;
  output wire id_6;
  inout wire id_5;
  output tri id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  id_11 :
  assert property (@(posedge id_7) id_10)
  else $signed(30);
  ;
  wire id_12;
  assign id_4 = 1;
endmodule
module module_1 #(
    parameter id_2 = 32'd4,
    parameter id_4 = 32'd13,
    parameter id_5 = 32'd61
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5
);
  input wire _id_5;
  output wire _id_4;
  inout wire id_3;
  input wire _id_2;
  output logic [7:0] id_1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  integer [(  -1  ==  id_5  ) : id_4] id_6[1 : -1];
  ;
  assign id_1[id_2] = id_5 ? (-1'h0 == 1) ==? 1 : 1 == -1;
  wire id_7;
endmodule

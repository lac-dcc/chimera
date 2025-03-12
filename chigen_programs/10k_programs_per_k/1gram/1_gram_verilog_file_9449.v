// Seed: 138968938
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
endmodule
module module_1 #(
    parameter id_2 = 32'd93,
    parameter id_4 = 32'd33,
    parameter id_5 = 32'd39,
    parameter id_6 = 32'd80,
    parameter id_9 = 32'd94
) (
    id_1,
    _id_2,
    id_3,
    _id_4,
    _id_5,
    _id_6[id_2 : 1],
    id_7,
    id_8,
    _id_9,
    id_10,
    id_11
);
  output logic [7:0] id_11;
  output wire id_10;
  input wire _id_9;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_1,
      id_3,
      id_1
  );
  inout wire id_8;
  inout wire id_7;
  inout logic [7:0] _id_6;
  inout wire _id_5;
  inout wire _id_4;
  input wire id_3;
  inout wire _id_2;
  output wire id_1;
  assign id_11[id_5==id_9+id_4-id_6] = -1;
  id_12 :
  assert property (@(posedge id_7 or posedge -1) -1) id_12 <= 1;
endmodule

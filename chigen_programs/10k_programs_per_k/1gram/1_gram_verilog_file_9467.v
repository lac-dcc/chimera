// Seed: 411355723
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5[1 : (-1)],
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout logic [7:0] id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7 = 1;
endmodule
module module_1 #(
    parameter id_11 = 32'd24,
    parameter id_2  = 32'd15,
    parameter id_8  = 32'd70
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5,
    id_6[(-1) : 1*'{1}],
    id_7,
    _id_8,
    id_9
);
  input wire id_9;
  inout wire _id_8;
  inout logic [7:0] id_7;
  inout logic [7:0] id_6;
  output logic [7:0] id_5;
  inout wire id_4;
  inout logic [7:0] id_3;
  input wire _id_2;
  output wire id_1;
  wire id_10, _id_11;
  wire id_12;
  ;
  assign id_6 = id_2;
  xor primCall (id_6, id_7, id_3, id_12, id_9, id_4, id_10);
  assign id_7[({id_2{id_11}}!==1) :-1'd0] = id_9;
  module_0 modCall_1 (
      id_1,
      id_10,
      id_10,
      id_10,
      id_3,
      id_10,
      id_1
  );
  initial id_3[id_8] <= id_7;
  parameter id_13 = 1;
endmodule

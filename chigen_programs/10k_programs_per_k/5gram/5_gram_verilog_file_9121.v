// Seed: 836793011
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
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
program module_1 #(
    parameter id_5 = 32'd27,
    parameter id_6 = 32'd66
) (
    id_1,
    id_2,
    id_3,
    id_4,
    _id_5,
    _id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12
);
  input wire id_12;
  output logic [7:0] id_11;
  output wire id_10;
  module_0 modCall_1 (
      id_7,
      id_4,
      id_3,
      id_9,
      id_3,
      id_4,
      id_7,
      id_3,
      id_4,
      id_10,
      id_10,
      id_12
  );
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire _id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire [id_6 : 1  ==  -1] id_13;
  id_14 :
  assert property (@(posedge id_12) id_13)
  else $clog2(35);
  ;
endprogram

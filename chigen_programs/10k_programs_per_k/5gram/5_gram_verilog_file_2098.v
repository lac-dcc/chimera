// Seed: 644378098
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_5;
endmodule
module module_1 #(
    parameter id_14 = 32'd60
) (
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
    id_12,
    id_13,
    _id_14,
    id_15
);
  output wire id_15;
  input wire _id_14;
  output wire id_13;
  input wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  input wire id_8;
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  inout tri0 id_4;
  output wire id_3;
  output supply0 id_2;
  inout wire id_1;
  wire [id_14  ==?  {  1  {  -1  }  } : 1] id_16;
  module_0 modCall_1 (
      id_8,
      id_16,
      id_4,
      id_4
  );
  assign id_4 = -1;
  id_17 :
  assert property (@(posedge -1) id_4)
  else $signed(87);
  ;
endmodule

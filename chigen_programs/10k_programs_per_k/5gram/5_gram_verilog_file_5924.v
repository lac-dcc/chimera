// Seed: 1855556176
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
  inout wire id_9;
  input wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = id_10;
endmodule
module module_0 #(
    parameter id_2 = 32'd72
) (
    id_1,
    _id_2,
    id_3,
    module_1,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout supply1 id_7;
  output wire id_6;
  output logic [7:0] id_5;
  output wire id_4;
  inout wire id_3;
  inout wire _id_2;
  output wire id_1;
  id_10 :
  assert property (@(posedge id_3) id_7)
  else $signed(1);
  ;
  wire id_11;
  id_12 :
  assert property (@(posedge -1) 1)
  else $signed(60);
  ;
  logic id_13;
  ;
  module_0 modCall_1 (
      id_5,
      id_7,
      id_10,
      id_9,
      id_7,
      id_10,
      id_11,
      id_8,
      id_13,
      id_11
  );
  assign id_7 = -1;
endmodule

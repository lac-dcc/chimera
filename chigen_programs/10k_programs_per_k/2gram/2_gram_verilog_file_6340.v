// Seed: 2310605709
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
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  assign module_1.id_1 = 0;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_14;
  id_15 :
  assert property (@(id_4 or posedge -1 or -1) -1 !== 'b0)
  else;
  assign id_15 = id_3;
  assign id_5  = id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  output wire id_9;
  inout wire id_8;
  nor primCall (id_8, id_1, id_4, id_7, id_5);
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_4,
      id_8,
      id_9,
      id_4,
      id_5,
      id_9,
      id_9,
      id_8
  );
  output reg id_2;
  inout reg id_1;
  always begin : LABEL_0
    id_2 = 1;
  end
  assign id_3 = id_4;
  assign id_9 = id_8;
  initial id_1 = id_1;
  parameter id_10 = -1;
endmodule

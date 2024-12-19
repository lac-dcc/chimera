// Seed: 4140249681
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  assign id_6 = (1);
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
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  id_12 :
  assert property (@(posedge 1 != !1'b0 or posedge id_4 or negedge 1) id_2)
  else;
  always begin : LABEL_0
    id_3  = #1 id_6;
    id_1  = id_6 ^ 1;
    id_12 = 1 == 1;
  end
  wire id_13;
  always begin : LABEL_0
    id_4 = 1;
  end
  assign id_1 = id_9;
  module_0 modCall_1 (
      id_12,
      id_5,
      id_4,
      id_4,
      id_12,
      id_13,
      id_7,
      id_13
  );
endmodule

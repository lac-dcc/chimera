// Seed: 1323576609
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
  output wire id_12;
  output wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_13 :
  assert property (@(posedge 1) id_2#(.id_10(1)))
  else;
  wire id_14;
  assign id_12 = id_7;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always_latch begin : LABEL_0
    id_1 <= 1;
  end
  assign id_2 = id_3;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_2,
      id_3,
      id_3,
      id_2,
      id_2
  );
  id_5 :
  assert property (@(posedge 1 or posedge id_5) id_5)
  else;
  wire id_6 = id_6;
endmodule

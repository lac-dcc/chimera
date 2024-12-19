// Seed: 913498047
module module_0;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  reg id_3;
  assign id_3 = id_2;
  assign id_2 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  reg id_4;
  supply0 id_5;
  id_6 :
  assert property (@(posedge id_4 or posedge id_2) 1)
  else;
  assign id_5 = 1'b0;
  assign id_4 = 1;
  always @(posedge id_4) id_4 <= 1;
  wire id_7;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7#(.id_8(id_9(1, {1'b0{1 / id_10 + 1}}))),
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19
);
  inout wire id_16;
  inout wire id_15;
  output wire id_14;
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_20;
  xnor primCall (
      id_1,
      id_11,
      id_12,
      id_13,
      id_15,
      id_16,
      id_17,
      id_18,
      id_19,
      id_20,
      id_3,
      id_4,
      id_6,
      id_7,
      id_8
  );
  always id_6 <= 1 == id_17;
  initial begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule

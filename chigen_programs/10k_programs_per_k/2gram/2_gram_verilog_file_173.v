// Seed: 4143722521
module module_0 ();
  reg id_2, id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  assign id_6 = 1 ? id_3 : 1'b0;
  reg  id_10 = id_9 + 1;
  wire id_11;
  id_12 :
  assert property (@(posedge 1 or id_10) id_5)
  else;
  reg id_13 = 1, id_14, id_15, id_16, id_17, id_18, id_19 = id_18 - 1, id_20, id_21, id_22, id_23;
  initial begin : LABEL_0
    id_6 <= id_14;
  end
  always id_6 <= #1  ~1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
  nand primCall (id_1, id_2, id_3, id_5);
  module_0 modCall_1 ();
  assign modCall_1.id_20 = 0;
  wire id_6;
endmodule

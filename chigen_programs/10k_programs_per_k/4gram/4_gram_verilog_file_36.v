// Seed: 1027840435
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
    id_13,
    id_14,
    id_15
);
  output wire id_15;
  output wire id_14;
  output wire id_13;
  inout wire id_12;
  output wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri0 id_16;
  assign id_1 = id_5 - 1'b0;
  wire id_17;
  wire id_18;
  wire id_19;
  id_20 :
  assert property (@(posedge 1) id_16)
  else $display(1, 1'b0, 1, id_9, 1'b0);
  assign id_8 = 1;
endmodule
module module_1 (
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
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  id_9 :
  assert property (@(posedge 1) id_2[""])
  else $display(id_9);
  module_0 modCall_1 (
      id_4,
      id_9,
      id_6,
      id_9,
      id_6,
      id_6,
      id_6,
      id_7,
      id_8,
      id_3,
      id_9,
      id_6,
      id_6,
      id_7,
      id_4
  );
  assign modCall_1.id_1 = 0;
endmodule

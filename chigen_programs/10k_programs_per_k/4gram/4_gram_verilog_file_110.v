// Seed: 1702505697
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
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  id_9 :
  assert property (@(posedge 1) 1)
  else $display(id_8, 1);
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
    id_11,
    id_12,
    id_13,
    id_14,
    id_15
);
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  id_16(
      .id_0(id_1), .id_1(id_7), .id_2(1 - id_11)
  );
  nor primCall (id_4, id_13, id_5, id_6, id_16, id_14, id_7, id_15);
  module_0 modCall_1 (
      id_6,
      id_11,
      id_15,
      id_5,
      id_5,
      id_7,
      id_15,
      id_4
  );
  longint id_17;
  wire id_18;
  wire id_19;
endmodule

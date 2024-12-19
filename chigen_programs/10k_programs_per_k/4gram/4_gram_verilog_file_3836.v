// Seed: 1041641674
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_4 = 1;
  assign module_1.id_6 = 0;
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
    id_12
);
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_7 = id_8;
  module_0 modCall_1 (
      id_11,
      id_10,
      id_8,
      id_8
  );
  supply1 id_13 = id_2;
  id_14 :
  assert property (@(negedge id_13) id_6 == id_10)
  else $display(!id_5);
  uwire id_15 = 1;
  assign id_1[1'b0] = "";
  assign id_8 = 1;
endmodule

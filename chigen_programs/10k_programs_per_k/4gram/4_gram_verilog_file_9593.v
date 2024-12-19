// Seed: 2538654153
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  tri1 id_5 = id_3 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_1,
      id_1
  );
endmodule
module module_2 (
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_4,
      id_1
  );
  id_12 :
  assert property (@(negedge 1) 1)
  else $display((id_6), 1, id_2);
  wire id_13;
  assign id_4 = id_5 ? id_4 : 1 ? 1 : id_10;
endmodule

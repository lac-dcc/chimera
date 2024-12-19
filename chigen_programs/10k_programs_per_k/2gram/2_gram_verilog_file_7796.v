// Seed: 1954336581
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
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  wire id_10;
  wire id_11;
  wire id_12;
  assign module_1.id_3 = 0;
  id_13(
      .id_0(1), .id_1(""), .id_2(id_12), .id_3(1), .id_4(id_3), .id_5('b0), .id_6(1)
  );
endmodule
module module_1 (
    input tri0 id_0,
    input tri  id_1
);
  wand id_3 = 1;
  id_4 :
  assert property (@('b0 or 1 - 1 - 1) 1'd0)
  else;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_4
  );
endmodule

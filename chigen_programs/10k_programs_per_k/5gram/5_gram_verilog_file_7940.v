// Seed: 4081398334
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
    id_11
);
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  module_2 modCall_1 (
      id_2,
      id_3,
      id_10,
      id_2,
      id_4,
      id_10,
      id_6,
      id_6,
      id_3,
      id_11
  );
  assign modCall_1.id_12 = 0;
  assign module_1.id_1   = 0;
  wire id_12;
endmodule
module module_1;
  assign id_1 = id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
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
    id_10
);
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_8 = 1;
  id_11 :
  assert property (@(posedge 1) 1 * id_9)
  else $display(id_1);
  assign id_2 = id_1;
  wor id_12 = id_11 ? id_4++ & id_9 == id_11 : id_9;
endmodule

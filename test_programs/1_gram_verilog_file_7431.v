// Seed: 3685301772
module module_0 (
    output tri0 id_0,
    input  tri0 id_1
);
  assign id_0 = -1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    output wor id_0,
    output uwire id_1,
    id_11,
    output supply1 id_2,
    input tri id_3,
    output wor id_4,
    output tri id_5,
    input tri1 id_6,
    input supply1 id_7,
    input wor id_8,
    input tri1 id_9
);
  assign id_4 = 1;
  uwire id_12 = id_6;
  module_0 modCall_1 (
      id_5,
      id_3
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
    id_11,
    id_12,
    id_13,
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  output wire id_11;
  input wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  id_15(
      id_13
  );
endmodule
module module_3 (
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
  inout wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wor id_13, id_14, id_15, id_16;
  module_2 modCall_1 (
      id_6,
      id_13,
      id_15,
      id_3,
      id_10,
      id_3,
      id_12,
      id_13,
      id_15,
      id_16,
      id_13,
      id_8,
      id_6,
      id_12
  );
  id_17 :
  assert property (@(1) id_13)
  else id_11 <= 1'b0;
endmodule

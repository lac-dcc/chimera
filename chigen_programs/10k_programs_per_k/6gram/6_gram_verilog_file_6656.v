// Seed: 2479186976
module module_0 (
    input  tri0 id_0,
    output wor  id_1
);
  assign id_1 = id_0;
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    output wand  id_1,
    input  wire  id_2,
    output logic id_3,
    input  tri   id_4
);
  reg id_6;
  always repeat (0) id_3 <= id_6;
  module_0 modCall_1 (
      id_2,
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
    id_11,
    id_12,
    id_13
);
  inout wire id_13;
  inout wire id_12;
  inout wire id_11;
  input wire id_10;
  inout wire id_9;
  inout wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_14(
      .id_0(1 - id_6 & 1), .id_1(id_4 == 1), .id_2(1)
  );
  assign id_11 = id_2 == id_12;
  wire id_15, id_16;
  wor id_17 = 1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  initial begin : LABEL_0
    `define pp_9 0
    if (1) if (id_4) for (id_6 = 1; id_1; id_7 = 1) `pp_9 <= id_2;
    id_8 = id_4;
    id_4 = `pp_9;
  end
  xor primCall (id_6, id_4, id_2, id_3, id_1);
  assign id_5 = id_3;
  module_2 modCall_1 (
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_1,
      id_6,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign id_1 = 1;
endmodule

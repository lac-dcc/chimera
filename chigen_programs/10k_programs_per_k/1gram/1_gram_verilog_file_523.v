// Seed: 1052199453
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
    id_13
);
  output wire id_13;
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_14, id_15;
  assign module_1.id_1 = 0;
  assign id_5 = id_14;
  if (-1) wire id_16;
  else begin : LABEL_0
    logic id_17 = id_12;
  end
endmodule
module module_1 (
    input  wand id_0,
    input  wire id_1,
    output tri1 id_2,
    input  tri  id_3,
    output tri  id_4
);
  wire id_6, id_7;
  module_0 modCall_1 (
      id_7,
      id_6,
      id_7,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_7,
      id_7,
      id_7
  );
  assign id_7 = id_1;
  xor primCall (id_4, id_0, id_1, id_3, id_6);
endmodule

// Seed: 546901623
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  assign module_2.id_2 = 0;
endmodule
module module_1 (
    input  tri0 id_0,
    input  wand id_1,
    output tri0 id_2,
    input  wand id_3,
    input  tri1 id_4,
    input  tri1 id_5,
    input  wor  id_6
);
  assign id_2 = 1;
  wire id_8;
  or primCall (id_2, id_5, id_3, id_13, id_8, id_1);
  wire id_9;
  wire id_10, id_11, id_12, id_13;
  module_0 modCall_1 (
      id_11,
      id_11
  );
  wand id_14 = 1;
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
  output wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  always
    if (id_8) id_10 = 1;
    else begin : LABEL_0
      id_2 <= 1'h0;
    end
  module_0 modCall_1 (
      id_9,
      id_7
  );
endmodule

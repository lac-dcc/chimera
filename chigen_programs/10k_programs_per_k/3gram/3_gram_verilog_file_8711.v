// Seed: 2916989718
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  tri0 id_11;
  supply1 id_12;
  initial begin : LABEL_0
    id_12 = 1;
  end
  assign id_12 = "" & id_11;
  assign module_1.type_1 = 0;
  wire id_13;
  id_14(
      .id_0(id_12), .id_1(), .id_2(1), .id_3(1 - id_5++)
  );
  wire id_15;
  integer id_16 = 1;
endmodule
module module_1 (
    output tri0 id_0
    , id_9,
    input wire id_1,
    input supply0 id_2,
    input tri1 id_3,
    input wand id_4
    , id_10,
    input supply1 id_5,
    output tri1 id_6
    , id_11,
    output tri1 id_7
);
  module_0 modCall_1 (
      id_11,
      id_11,
      id_11,
      id_9,
      id_9,
      id_11,
      id_10,
      id_9,
      id_10
  );
  wire id_12;
  wire id_13;
  xor primCall (id_0, id_10, id_9, id_3, id_4, id_1, id_5, id_11);
  tri0 id_14 = 1;
endmodule

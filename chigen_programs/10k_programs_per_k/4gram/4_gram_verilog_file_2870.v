// Seed: 2526952434
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign module_1.type_4 = 0;
  wire id_3;
  wire id_4;
  wire id_5;
endmodule
module module_1 (
    output tri1 id_0
    , id_15,
    input tri0 id_1,
    input wor id_2,
    output supply0 id_3,
    input tri0 id_4,
    input logic id_5,
    input logic id_6,
    input wire id_7,
    input supply0 id_8,
    output tri1 id_9,
    input wand id_10,
    input supply1 id_11,
    input tri1 id_12,
    output wor id_13
);
  wire  id_16;
  logic id_17 = id_5;
  assign id_17 = id_6 ? 1 : id_6;
  initial begin : LABEL_0
    id_17 <= id_5;
  end
  xor primCall (
      id_13, id_6, id_2, id_7, id_11, id_8, id_17, id_16, id_5, id_1, id_4, id_15, id_18, id_12
  );
  wire id_18, id_19;
  module_0 modCall_1 (
      id_19,
      id_19
  );
  assign id_17 = 1;
  id_20(
      .id_0(1 << id_19), .id_1(id_15 <= id_8), .id_2(id_16)
  );
endmodule

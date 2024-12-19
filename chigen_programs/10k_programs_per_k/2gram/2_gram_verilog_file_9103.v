// Seed: 2341797057
module module_0 (
    input tri0 id_0,
    input tri0 id_1,
    output wire id_2,
    input wand id_3,
    input wire id_4,
    output tri0 id_5,
    input wand id_6,
    input supply0 id_7,
    output uwire id_8,
    input wire id_9,
    input wor id_10,
    input supply1 id_11,
    input wor id_12,
    input tri1 id_13
    , id_15, id_16
);
  id_17(
      id_6, id_6
  );
  always begin : LABEL_0
    id_2 = id_16 && 1 && 1 + id_4 - id_16;
  end
  genvar id_18;
  wire id_19;
  wire id_20;
  assign module_1.type_0 = 0;
endmodule
module module_1 (
    input  tri   id_0,
    input  uwire id_1,
    output wor   id_2
);
  xor primCall (id_2, id_5, id_1, id_4, id_6);
  if (1'b0)
    if (id_0) begin : LABEL_0
      wire id_4;
    end else begin : LABEL_0
      wire id_5;
      wire id_6;
    end
  else wire id_7;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_2,
      id_0,
      id_1,
      id_2,
      id_1,
      id_1,
      id_2,
      id_1,
      id_0,
      id_1,
      id_0,
      id_0
  );
endmodule

// Seed: 3205372133
module module_0 (
    output wand id_0,
    input tri id_1,
    output wand id_2,
    input tri1 id_3,
    output uwire id_4,
    output supply0 id_5
    , id_13,
    output wand id_6,
    output tri0 id_7,
    input wire id_8,
    input tri id_9,
    input tri0 id_10,
    input tri1 id_11
);
  assign id_4 = id_9;
  assign module_1.id_3 = 0;
  assign id_13 = id_3;
  generate
    begin : LABEL_0
      wire id_14;
    end
    begin : LABEL_0
      assign id_0 = id_3;
    end
    always id_4 = 1;
  endgenerate
  assign id_0 = 1'b0;
  assign id_7.id_11 = 1;
  supply1 id_15, id_16;
  assign id_7 = id_8;
  tri0 id_17, id_18, id_19 = 1 + 1, id_20;
  wire id_21;
  wire id_22;
  assign id_0 = id_15;
  wire id_23;
  wire id_24;
  assign id_7 = !id_9;
endmodule
module module_1 (
    output wand  id_0,
    output uwire id_1,
    input  wand  id_2,
    input  wand  id_3,
    output tri   id_4
);
  assign id_0.id_2 = id_3;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_4,
      id_3,
      id_0,
      id_1,
      id_0,
      id_4,
      id_3,
      id_2,
      id_2,
      id_2
  );
endmodule

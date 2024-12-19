// Seed: 3348458223
module module_0 (
    input wand id_0,
    input tri id_1,
    input tri0 id_2,
    input supply1 id_3
);
endmodule
module module_1 (
    input  tri0 id_0,
    output tri0 id_1,
    input  tri  id_2,
    output wire id_3,
    input  wand id_4,
    output tri  id_5,
    output tri1 id_6,
    output wand id_7,
    input  tri0 id_8
    , id_12,
    input  wire id_9,
    input  wand id_10
);
  assign id_5 = 1;
  assign id_7 = id_0;
  always @(id_2 or id_2)
    forever begin : LABEL_0
      if (id_4) begin : LABEL_0
        id_7 = 1'b0;
      end
    end
  wire id_13;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_0,
      id_9
  );
  assign modCall_1.id_1 = 0;
  wire id_15 = id_2 ? {1{1 - id_9}} : id_10;
  assign id_7 = id_0 < id_8;
  wire id_16;
  nor primCall (id_7, id_13, id_12, id_4, id_0, id_2, id_8, id_14, id_10);
endmodule

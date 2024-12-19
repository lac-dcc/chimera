// Seed: 2940548669
module module_0 (
    input tri1 id_0,
    input tri0 id_1,
    input supply1 id_2,
    input tri0 id_3,
    output supply1 id_4
);
  logic [7:0] id_6;
  tri0 id_7 = id_2;
  assign id_4 = id_0;
  always id_7 = id_1 - id_0;
  assign id_4 = id_7 < 1;
  assign id_7 = id_7;
  wire id_8;
  assign id_6[1'b0] = id_7;
  assign id_7 = 1;
  supply0 id_9 = id_1;
endmodule
module module_1 (
    input tri1 id_0
    , id_15,
    input wand id_1,
    input uwire id_2,
    input tri0 id_3,
    output supply0 id_4,
    output wand id_5,
    output tri id_6,
    input uwire id_7,
    input wand id_8,
    output logic id_9,
    input uwire id_10,
    input tri id_11,
    output logic id_12,
    input tri1 id_13
);
  supply1 id_16;
  assign id_16 = id_1;
  nand primCall (id_5, id_13, id_0, id_7, id_11, id_15, id_16, id_10, id_3, id_8, id_2);
  module_0 modCall_1 (
      id_16,
      id_10,
      id_2,
      id_10,
      id_5
  );
  assign modCall_1.id_3 = 0;
  assign id_5 = (1'b0);
  tri0 id_17;
  initial begin : LABEL_0
    id_9  <= id_17 & id_1 - 1 - 1;
    id_12 <= 1;
    @(posedge 1'd0) @(id_3 + !1 or posedge id_11 or posedge id_11 or posedge (1 << id_0));
  end
  wire id_18;
endmodule

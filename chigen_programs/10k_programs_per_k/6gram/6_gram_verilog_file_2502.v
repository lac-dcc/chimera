// Seed: 4224475689
module module_0 (
    output wand id_0,
    input tri id_1,
    input supply1 id_2,
    output wand id_3
);
  assign id_3 = (1);
  always begin : LABEL_0
    id_0 = ~id_2 <= 1;
  end
  assign module_1.type_3 = 0;
endmodule
module module_1 (
    input supply1 id_0,
    output supply1 id_1,
    input tri1 id_2,
    input tri1 id_3,
    input tri1 id_4,
    output wor id_5,
    output supply0 id_6,
    input tri0 id_7,
    input tri id_8
);
  assign id_1 = id_0;
  reg  id_10;
  wire id_11;
  assign id_6 = 1;
  always @(id_7 or posedge (id_4)) begin : LABEL_0
    id_10 <= 1'b0;
    id_5 = id_0;
  end
  wire id_12;
  tri1 id_13 = 1 ? id_8 : 1;
  wire id_14;
  supply0 id_15 = 1;
  always @(posedge id_0 or id_3 < 1) begin : LABEL_0
    cover (1);
  end
  module_0 modCall_1 (
      id_5,
      id_2,
      id_3,
      id_13
  );
endmodule

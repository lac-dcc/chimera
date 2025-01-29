// Seed: 1590249520
module module_0 (
    output supply1 id_0,
    input supply0 id_1,
    output tri1 id_2,
    output tri1 id_3
);
  wire id_5, id_6;
  assign id_5 = id_6;
  reg id_7, id_8;
  wire id_9;
  generate
    wor id_10;
    initial id_8 <= id_10 || id_1;
  endgenerate
endmodule
module module_1 (
    input uwire id_0,
    input wor id_1,
    input tri id_2,
    input uwire id_3,
    input wand id_4,
    output wire id_5,
    input supply0 id_6,
    inout wire id_7,
    output tri0 id_8,
    input supply0 id_9,
    input wand id_10,
    output wire id_11,
    input tri1 id_12,
    input wor id_13
);
  assign id_8 = -1;
  module_0 modCall_1 (
      id_8,
      id_10,
      id_5,
      id_7
  );
  assign modCall_1.id_3 = 0;
  for (id_15 = -1; id_1; id_11 += -1) begin : LABEL_0
    assign id_7 = id_6;
  end
endmodule

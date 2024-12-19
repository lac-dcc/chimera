// Seed: 2233791241
module module_0 (
    output tri id_0,
    input tri0 id_1,
    output tri1 id_2,
    input tri id_3,
    output uwire id_4,
    input uwire id_5,
    output wire id_6,
    input supply1 id_7
);
  wire id_9;
  assign module_1.type_8 = 0;
  initial begin : LABEL_0
    disable id_10;
  end
endmodule
module module_1 (
    input supply1 id_0,
    input tri id_1,
    input supply0 id_2,
    output supply1 id_3,
    input wand id_4,
    input supply1 id_5,
    input supply0 id_6,
    input wor id_7,
    output wire id_8,
    output wand id_9,
    output tri id_10,
    input uwire id_11,
    input uwire id_12,
    input wor id_13,
    input wor id_14,
    input wor id_15,
    output tri1 id_16,
    input tri id_17,
    input wand id_18,
    input supply1 id_19
);
  id_21(
      .id_0(1), .id_1(id_10 && 1), .id_2((1)), .id_3(1), .id_4(1)
  );
  assign id_9 = 1;
  module_0 modCall_1 (
      id_16,
      id_15,
      id_16,
      id_5,
      id_3,
      id_18,
      id_16,
      id_18
  );
  always @(posedge |id_19) $display(1);
endmodule

// Seed: 2075994071
module module_0 (
    output uwire id_0,
    input  wire  id_1,
    input  uwire id_2,
    output tri1  id_3,
    output tri0  id_4
);
  tri id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13, id_14, id_15, id_16, id_17, id_18;
  wire id_19;
  always @(1 or posedge id_7) begin : LABEL_0
    disable id_20;
  end
  id_21(
      1, 1
  );
endmodule
module module_1 (
    input uwire id_0,
    input wire id_1,
    output wand id_2,
    input supply0 id_3,
    input wire id_4,
    output tri0 id_5,
    input wor id_6,
    output supply0 id_7,
    input supply1 id_8
);
  tri0 id_10;
  module_0 modCall_1 (
      id_10,
      id_10,
      id_4,
      id_5,
      id_5
  );
  assign modCall_1.id_4 = 0;
  assign id_2 = 1;
  wire id_11;
  always @(id_8 or posedge 1'b0) begin : LABEL_0
    if (1) $display(id_10, id_1);
  end
endmodule

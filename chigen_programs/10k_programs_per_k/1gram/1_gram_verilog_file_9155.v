// Seed: 542778474
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    output tri id_2,
    input uwire id_3,
    input wand id_4,
    input wand id_5,
    output tri id_6,
    input wor id_7,
    output tri id_8
);
  assign id_8 = id_7 + 1'b0;
  assign id_2 = 1'b0;
  wire id_10;
endmodule
module module_1 (
    output supply0 id_0,
    output uwire void id_1,
    output supply0 id_2,
    input tri id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wor id_6,
    input uwire id_7,
    input tri0 id_8,
    output tri id_9,
    input logic id_10,
    output uwire id_11,
    input tri1 id_12
);
  wire id_14;
  wire id_15, id_16;
  assign id_2 = id_12;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_2,
      id_5,
      id_5,
      id_3,
      id_11,
      id_4,
      id_0
  );
  assign modCall_1.id_1 = 0;
  logic id_17, id_18 = id_10;
  xnor primCall (id_0, id_12, id_5, id_10, id_3, id_14, id_8, id_16, id_7, id_4);
  reg id_19, id_20;
  supply0 id_21;
  assign id_21 = 1;
  always @* id_17 <= 1;
  if (1) assign id_18 = 1;
  always begin : LABEL_0
    @(posedge 1'b0) id_20 <= 1'b0 - 1;
  end
  id_22(
      1, 1, 1'd0
  );
endmodule

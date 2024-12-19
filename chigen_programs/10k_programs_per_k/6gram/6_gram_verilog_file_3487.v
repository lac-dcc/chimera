// Seed: 176698008
module module_0;
  uwire id_1;
  assign id_1 = 1;
  tri0 id_2, id_3, id_4, id_5, id_6, id_7, id_8;
  wor  id_9;
  wire id_10;
  assign id_8 = id_5;
  assign id_9 = 1;
  wand id_11 = id_6;
  tri1 id_12;
  assign id_1 = id_5;
  assign id_4 = 1 - 1;
  wire id_13;
  wire id_14;
  id_15(
      (1), id_12 & 1
  );
  assign id_3 = id_6;
endmodule
module module_1 (
    output supply1 id_0,
    output supply1 id_1,
    input supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    output wire id_5,
    input uwire id_6,
    output tri id_7,
    input tri id_8,
    input uwire id_9,
    output wire id_10
);
  assign id_5 = ~id_8;
  module_0 modCall_1 ();
  assign modCall_1.id_6 = 0;
  always @(posedge 1) begin : LABEL_0
    id_5 = id_4;
  end
  wire id_12;
  wire id_13;
endmodule

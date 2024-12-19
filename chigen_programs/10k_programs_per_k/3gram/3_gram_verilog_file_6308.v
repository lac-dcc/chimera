// Seed: 2738420928
module module_0;
  always @(id_1 or posedge 1'd0 - 1)
    if (id_1) id_1 <= 1;
    else begin : LABEL_0
      #1 disable id_2;
    end
  id_3(
      .id_0(), .id_1(1), .id_2(1), .id_3(1)
  );
  wire id_4;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    input  wor   id_0,
    input  tri   id_1,
    input  wor   id_2,
    input  uwire id_3,
    input  uwire id_4,
    output wand  id_5,
    input  tri0  id_6,
    input  wor   id_7
);
  wire id_9;
  nand primCall (id_5, id_6, id_7, id_9);
  module_0 modCall_1 ();
endmodule

// Seed: 1413420891
module module_0 ();
  wand id_1;
  assign id_1 = 'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  inout wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_3 = {id_5{1}};
  supply0 id_10;
  tri0 id_11 = id_10, id_12;
  wire id_13;
  wire id_14, id_15;
  nand primCall (id_2, id_5, id_6, id_7, id_8, id_9);
  assign id_12 = id_8;
  initial begin : LABEL_0
    if (id_9) @(1) @(posedge id_8) @(id_5) id_8 = ((id_11));
  end
  id_16(
      .id_0(id_11), .id_1(1 - 1)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_17;
  wire id_18;
endmodule

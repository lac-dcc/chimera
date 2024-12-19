// Seed: 3787894599
module module_0 (
    output uwire id_0,
    output wand  id_1,
    output tri1  id_2
);
  wire id_4;
  assign module_2.id_6 = 0;
endmodule
module module_1 (
    output tri  id_0,
    input  wand id_1
);
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9 = 1;
  wire id_10;
  wire id_11;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    output tri0 id_0,
    input  wire id_1,
    output tri1 id_2,
    input  wire id_3,
    input  wire id_4
);
  assign id_2 = 1;
  uwire id_6;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_2
  );
  reg id_7;
  id_8(
      .id_0(id_6 !=? 1'b0), .id_1(id_1)
  );
  wire id_9;
  wire id_10;
  always @(*) begin : LABEL_0
    id_0 = 1;
    id_7 <= 1;
  end
  assign id_7 = 1;
  wire id_11;
endmodule

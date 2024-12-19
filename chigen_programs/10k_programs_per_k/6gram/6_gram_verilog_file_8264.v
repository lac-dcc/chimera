// Seed: 2268501537
module module_0 (
    input  tri1 id_0,
    output tri1 id_1
);
  always begin : LABEL_0$display
    ;
    if (1 & 1) id_1 = 1'b0;
    else id_1 = 1;
  end
endmodule
module module_1 (
    input  tri   id_0,
    input  tri1  id_1,
    output uwire id_2,
    input  tri   id_3
);
  tri1 id_5;
  wire id_6;
  assign id_5 = id_0 == 1'b0;
  module_0 modCall_1 (
      id_3,
      id_2
  );
  assign modCall_1.type_3 = 0;
endmodule
module module_2 (
    input  tri  id_0,
    input  wand id_1,
    input  tri  id_2,
    output tri  id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_3
  );
  assign modCall_1.type_3 = 0;
endmodule

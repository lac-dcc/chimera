// Seed: 2916325870
module module_0 (
    output tri   id_0,
    input  uwire id_1,
    input  tri1  id_2
);
  always disable id_4;
  assign id_4 = 1'b0;
  wire id_5;
  wire id_6;
  wire id_7;
endmodule
module module_1 (
    output tri  id_0,
    output wire id_1,
    input  wand id_2
);
  assign id_1 = id_2;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2
  );
  assign modCall_1.type_0 = 0;
endmodule
module module_2 (
    input tri0 id_0
    , id_3,
    input wand id_1
);
  always_latch begin : LABEL_0
    id_3 = 1;
  end
  module_0 modCall_1 (
      id_3,
      id_1,
      id_1
  );
  wire id_4;
  assign id_3 = id_1;
  assign id_3 = 1;
endmodule

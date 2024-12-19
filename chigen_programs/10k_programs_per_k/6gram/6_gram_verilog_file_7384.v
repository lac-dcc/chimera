// Seed: 122284383
module module_0 (
    output wor  id_0,
    output wire id_1
);
  always @(id_3) begin : LABEL_0
    #1;
  end
  module_2 modCall_1 ();
  assign modCall_1.id_1  = 0;
  assign module_1.type_8 = 0;
endmodule
module module_1 (
    input  wor  id_0,
    input  wire id_1,
    input  wand id_2,
    input  wire id_3,
    output wire id_4
    , id_7,
    output wand id_5
);
  assign id_5 = 1;
  module_0 modCall_1 (
      id_4,
      id_5
  );
endmodule
module module_2;
  assign id_1 = 1;
  assign id_1 = 1;
  import id_2::*;
  assign id_1 = id_2;
endmodule

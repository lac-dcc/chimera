// Seed: 2830312914
module module_0 (
    input tri0 id_0,
    input supply0 id_1
);
  timeunit 1ps;
  module_2 modCall_1 (
      id_1,
      id_0
  );
endmodule
module module_1 (
    input wand id_0,
    input tri0 id_1
    , id_12,
    input uwire id_2,
    input supply0 id_3,
    output wire id_4,
    output wand id_5,
    input tri1 id_6,
    output uwire id_7,
    input supply0 id_8,
    output wor id_9,
    input wand id_10
);
  wire id_13;
  module_0 modCall_1 (
      id_0,
      id_10
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input wire id_0,
    input tri0 id_1
);
  wire id_3;
  wire \id_4 ;
  always_comb @(negedge 1 or posedge 1 >>> \id_4 );
  initial begin : LABEL_0
    $signed(55);
    ;
  end
  assign \id_4 = id_0;
  assign module_0.id_1 = 0;
endmodule

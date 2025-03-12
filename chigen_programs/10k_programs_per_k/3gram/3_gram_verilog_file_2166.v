// Seed: 387298878
module module_0 (
    input  tri   id_0,
    input  tri   id_1,
    input  uwire id_2,
    output wor   id_3
);
  wire id_5;
  assign module_2.id_9 = 0;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    output wire id_0,
    input uwire id_1,
    output supply0 id_2,
    output wor id_3,
    input uwire id_4
);
  assign id_2 = id_4;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_3
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd37
) (
    output wire  id_0
    , id_11,
    input  wire  id_1,
    input  wor   id_2,
    input  wor   id_3,
    input  tri   _id_4,
    input  uwire id_5,
    input  wire  id_6,
    input  wire  id_7,
    input  wand  id_8,
    output tri   id_9
);
  always @(negedge id_11[id_4] & id_8 < -1 or posedge 1'd0) disable id_12;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_1,
      id_9
  );
endmodule

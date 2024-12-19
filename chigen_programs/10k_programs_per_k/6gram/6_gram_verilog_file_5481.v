// Seed: 552275309
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  generate
    for (genvar id_8 = 1; 1; id_5 = id_4) begin : LABEL_0
      genvar id_9;
      assign id_4 = id_8;
    end
  endgenerate
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    output wand  id_2,
    input  wand  id_3
    , id_5, id_6
);
  assign id_2 = 1'd0;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_5
  );
endmodule

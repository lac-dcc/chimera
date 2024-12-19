// Seed: 177023809
module module_0 (
    input tri0 id_0
);
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    output supply0 id_2,
    output supply1 id_3,
    input tri0 id_4,
    input tri1 id_5,
    output wand id_6,
    output uwire id_7,
    output tri id_8,
    output wand id_9,
    output wire id_10,
    input supply0 id_11,
    input uwire id_12,
    input wire id_13
);
  module_0 modCall_1 (id_12);
  assign modCall_1.id_0 = 0;
  wor id_15 = id_12;
endmodule
module module_2 (
    output logic id_0,
    input supply1 id_1,
    input logic id_2,
    input tri1 id_3,
    input wor id_4
    , id_6
);
  wire id_7;
  module_0 modCall_1 (id_3);
  assign modCall_1.id_0 = 0;
  tri1 id_8 = 1;
  initial begin : LABEL_0
    id_6 = 0;
    fork
      id_0 <= id_2;
    join_none
    if (1'b0) @(posedge 1 or posedge 1) #1 id_8 = ~1'b0;
    wait (1);
    id_8 = id_8 == id_3;
    id_8 = ~1;
  end
  assign id_6 = 1;
endmodule

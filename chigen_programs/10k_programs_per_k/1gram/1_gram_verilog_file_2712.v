// Seed: 4003754739
module module_0 (
    input wand id_0,
    output supply0 id_1,
    input tri0 id_2,
    input tri0 id_3
);
  integer id_5;
  ;
  parameter id_6 = 1 & 1;
  parameter id_7 = 1;
  assign id_1 = id_5 && id_6;
  logic id_8;
  ;
  initial
    @(posedge -1)
      assume (-1) begin : LABEL_0
        id_5 <= -1;
      end
endmodule
module module_1 (
    input supply1 id_0,
    input tri0 id_1,
    input uwire id_2
    , id_12,
    output supply0 id_3,
    input wire id_4,
    output wand id_5,
    output tri id_6,
    input tri id_7,
    inout supply0 id_8
    , id_13,
    input uwire id_9,
    output wire id_10
);
  parameter id_14 = 1, id_15 = id_1.id_7, id_16 = -1'b0;
  module_0 modCall_1 (
      id_9,
      id_10,
      id_2,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule

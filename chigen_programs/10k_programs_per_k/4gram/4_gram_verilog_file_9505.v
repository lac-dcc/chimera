// Seed: 3993314254
module module_0 (
    output tri id_0,
    input wire id_1,
    output uwire id_2,
    output uwire id_3,
    output wire id_4,
    input wor id_5,
    output uwire id_6,
    input wor id_7,
    input supply0 id_8,
    input uwire id_9,
    input wand id_10
    , id_14,
    input supply1 id_11,
    input tri0 id_12
);
  logic [-1 : 1] id_15;
  always @(id_15) begin : LABEL_0
    force id_6 = 1'b0;
  end
  wire [1 : -1] id_16;
endmodule
module module_1 (
    output wor  id_0,
    input  tri1 id_1
);
  module_0 modCall_1 (
      id_0,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_12 = 0;
  logic id_3;
  wire  id_4;
  localparam id_5 = -1;
endmodule

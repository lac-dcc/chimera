// Seed: 1130278051
module module_0 (
    input tri0  id_0,
    input uwire id_1,
    input tri0  id_2,
    input wire  id_3,
    input uwire id_4
    , id_6
);
endmodule
module module_1 (
    input tri0 id_0,
    input tri id_1,
    output logic id_2
    , id_14,
    input logic id_3,
    input uwire id_4,
    output tri1 id_5,
    output supply1 id_6,
    input tri id_7,
    input wire id_8
    , id_15,
    input tri0 id_9,
    input tri1 id_10,
    input wire id_11,
    output wand id_12
);
  always @(posedge id_7 + id_8) begin : LABEL_0
    id_15 = 1;
    id_2 <= 1'h0;
    assume (id_9);
    $display(1);
    id_14 <= id_3;
  end
  module_0 modCall_1 (
      id_8,
      id_11,
      id_4,
      id_4,
      id_9
  );
  assign modCall_1.type_0 = 0;
endmodule

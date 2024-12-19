// Seed: 1428767076
module module_0 (
    input wire id_0,
    input uwire id_1,
    output supply0 id_2,
    output wor id_3
);
endmodule
module module_1 (
    input uwire id_0,
    output supply1 id_1,
    input tri1 id_2,
    input uwire id_3,
    input uwire id_4,
    input logic id_5,
    output wor id_6,
    input wor id_7,
    input wire id_8,
    output tri id_9,
    input wire id_10,
    output logic id_11
);
  assign id_11 = id_5;
  wire id_13 = 1, id_14;
  always @(posedge id_7 or 1'b0) begin : LABEL_0
    id_11 <= 1;
  end
  wire id_15;
  module_0 modCall_1 (
      id_8,
      id_2,
      id_9,
      id_6
  );
  assign modCall_1.type_0 = 0;
  wand id_16 = 1 - 1;
  wire id_17;
  always @* begin : LABEL_0
    {id_15, 1} += id_3;
  end
endmodule

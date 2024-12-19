// Seed: 1398306515
module module_0 (
    input supply1 id_0,
    input tri1 id_1,
    output tri1 id_2,
    input uwire id_3
);
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input uwire id_2,
    output supply1 id_3,
    input logic id_4,
    input logic id_5
    , id_11,
    input supply0 id_6,
    input wand id_7,
    output logic id_8,
    input wire id_9
);
  wire id_12, id_13;
  if (1 + 1 - id_2) begin : LABEL_0
    wire id_14;
    id_15(
        .id_0(), .id_1(id_11)
    );
  end
  always_latch @(posedge 1) begin : LABEL_0
    id_8 <= #1 id_5;
  end
  module_0 modCall_1 (
      id_6,
      id_6,
      id_3,
      id_6
  );
  assign modCall_1.type_5 = 0;
  assign id_0 = 1'b0;
  assign id_0 = 1;
  assign id_8 = id_4;
endmodule

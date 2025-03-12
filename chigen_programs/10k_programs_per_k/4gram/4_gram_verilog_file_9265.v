// Seed: 553905398
module module_0 (
    output uwire id_0,
    input uwire id_1,
    input supply1 id_2,
    output logic id_3,
    input uwire id_4,
    input wire id_5
);
  final begin : LABEL_0
    return id_2;
  end
  always_latch @(1) begin : LABEL_1
    id_3 <= #id_4 id_2;
  end
  assign id_3 = id_5;
endmodule
module module_1 (
    inout supply1 id_0,
    input wire id_1,
    output supply0 id_2,
    input wire id_3,
    input wand id_4,
    input tri0 id_5,
    input tri1 id_6,
    output tri id_7,
    output logic id_8,
    input wand id_9,
    input wor id_10,
    output tri1 id_11
);
  wire id_13;
  always_comb @(posedge id_4) begin : LABEL_0
    id_8 = -1'h0;
  end
  logic ["" : 1] id_14;
  parameter id_15 = -1'b0 == 1;
  localparam id_16 = 1;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_10,
      id_8,
      id_1,
      id_3
  );
  assign modCall_1.id_0 = 0;
endmodule

// Seed: 7134659
module module_0 (
    output wor id_0,
    input supply1 id_1,
    input tri0 id_2,
    input wand id_3,
    output wand id_4,
    output tri id_5,
    input wand id_6,
    output wand id_7,
    output wire id_8,
    output tri0 id_9,
    input uwire id_10
);
  wire id_12;
endmodule
module module_1 (
    output logic id_0,
    input supply1 id_1,
    output wire id_2,
    input logic id_3,
    input wire id_4
);
  if (1) begin : LABEL_0
    always @(posedge id_1) begin : LABEL_0
      id_0 <= id_3;
      id_0 = 1'h0;
    end
  end else assign id_2 = id_4 - 1'd0;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_4,
      id_4,
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_4
  );
  assign modCall_1.id_5 = 0;
  assign id_0 = 1;
  wire id_6;
  wire id_7;
endmodule

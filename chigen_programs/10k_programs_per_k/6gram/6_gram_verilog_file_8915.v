// Seed: 2940070765
module module_0 (
    input wand id_0,
    output tri0 id_1,
    input tri0 id_2,
    output wand id_3,
    input supply0 id_4,
    input wor id_5,
    input wor id_6
);
  wire id_8;
endmodule
module module_1 (
    output logic id_0
    , id_13,
    output tri id_1,
    output tri1 id_2,
    input tri id_3,
    input supply1 id_4,
    input logic id_5,
    input tri id_6,
    input wire id_7,
    input tri1 id_8,
    input uwire id_9,
    input tri0 id_10,
    output logic id_11
);
  assign id_1 = 1;
  wire id_14;
  module_0 modCall_1 (
      id_8,
      id_1,
      id_6,
      id_2,
      id_9,
      id_9,
      id_6
  );
  assign modCall_1.id_2 = 0;
  always @(posedge id_9) begin : LABEL_0
    id_11 <= 1;
    $display(1'd0 == 1'b0, 1'h0, 1, 1'd0, 1, id_9, 1, 1, 1);
    id_0 <= id_5;
  end
endmodule

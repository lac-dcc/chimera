// Seed: 1863363135
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output tri0 id_2,
    input uwire id_3,
    input wire id_4,
    input tri1 id_5,
    output wire id_6,
    output wire id_7,
    output wor id_8
);
  assign id_8 = 1;
  assign id_2 = 1;
endmodule
module module_1 (
    input logic id_0,
    input tri0 id_1,
    input supply1 id_2,
    inout logic id_3,
    input wor id_4,
    input supply1 id_5,
    input wand id_6,
    input wor id_7,
    input wor id_8,
    output tri0 id_9
);
  always @(posedge 1'b0) begin : LABEL_0
    id_3 <= id_0;
  end
  module_0 modCall_1 (
      id_2,
      id_6,
      id_9,
      id_1,
      id_5,
      id_6,
      id_9,
      id_9,
      id_9
  );
  assign modCall_1.id_5 = 0;
endmodule

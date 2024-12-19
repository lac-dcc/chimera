// Seed: 2250223122
module module_0 (
    output tri0 id_0,
    output tri0 id_1,
    output tri1 id_2,
    input supply1 id_3
);
endmodule
module module_1 (
    input wand id_0,
    output logic id_1,
    input tri0 id_2,
    output supply0 id_3,
    input uwire id_4,
    output tri id_5,
    input logic id_6,
    input wire id_7,
    output supply0 id_8,
    input uwire id_9,
    input wire id_10
);
  assign id_5 = id_4;
  always @(posedge 1) begin : LABEL_0
    if ({1, 1 * 1}) begin : LABEL_0
      id_1 <= id_6;
    end
  end
  assign id_8 = id_2 == id_0;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_5,
      id_9
  );
  assign modCall_1.id_2 = 0;
endmodule

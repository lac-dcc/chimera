// Seed: 2747335233
module module_0 (
    input tri0 id_0,
    output supply0 id_1,
    output wand id_2,
    output uwire id_3,
    output tri id_4,
    input supply1 id_5,
    output tri0 id_6,
    input wire id_7,
    input supply0 id_8,
    input uwire id_9,
    input wire id_10,
    output wor id_11,
    input uwire id_12
);
  wire id_14;
  assign id_4 = id_5;
endmodule
module module_0 (
    output tri0 id_0,
    input supply1 id_1,
    input uwire id_2,
    input wand id_3,
    input tri0 id_4,
    output tri id_5,
    input logic id_6,
    input supply0 id_7,
    output logic id_8,
    output logic module_1,
    input wor id_10
);
  assign id_9 = id_6;
  assign id_8 = id_4 == id_4;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_0,
      id_0,
      id_5,
      id_1,
      id_0,
      id_2,
      id_3,
      id_10,
      id_10,
      id_5,
      id_4
  );
  assign modCall_1.id_7 = 0;
  assign id_9 = id_4 & 1 & 1;
  assign id_5 = 1'd0;
  always_ff @(posedge 1'b0 ^ id_6) id_9 <= 1'b0;
  initial begin : LABEL_0
    id_8 <= 1;
    wait (id_7 - id_10) begin : LABEL_0
      disable id_12;
    end
  end
endmodule

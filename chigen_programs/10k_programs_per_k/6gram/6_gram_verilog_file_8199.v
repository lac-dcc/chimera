// Seed: 3149511331
module module_0 (
    output logic id_0,
    input  tri0  id_1,
    input  tri1  id_2,
    output wor   id_3,
    input  logic id_4,
    output tri0  id_5
);
  wire id_7 = id_7;
  wire id_8;
  logic [7:0] id_9;
  always @(posedge (id_1)) begin : LABEL_0
    id_0 <= id_4;
  end
  assign id_9[(1)] = 1 == 1;
endmodule
module module_1 (
    output wire id_0,
    input supply0 id_1,
    input supply0 id_2,
    output wand id_3,
    input logic id_4,
    output tri0 id_5,
    output logic id_6,
    input uwire id_7,
    input wire id_8,
    input wor id_9,
    output uwire id_10
);
  assign id_0 = 1 != id_4;
  wire id_12;
  always @(id_8 or posedge 1) begin : LABEL_0
    id_6 <= id_4;
  end
  module_0 modCall_1 (
      id_6,
      id_1,
      id_8,
      id_5,
      id_4,
      id_5
  );
  assign modCall_1.type_0 = 0;
endmodule

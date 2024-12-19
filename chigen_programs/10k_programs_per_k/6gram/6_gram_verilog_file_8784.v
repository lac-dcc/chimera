// Seed: 1538986400
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_9 = 1;
  assign id_1 = id_7;
endmodule
module module_1 (
    input supply0 id_0,
    input supply0 id_1,
    input supply0 id_2,
    input supply1 id_3,
    input tri1 id_4
    , id_12,
    input tri id_5,
    input wor id_6,
    input wand id_7,
    output tri0 id_8,
    input logic id_9,
    output logic id_10
);
  generate
    for (id_13 = 1; 1; id_13 = "" - 1) begin : LABEL_0
      if (id_13) begin : LABEL_0
        wire id_14;
      end else begin : LABEL_0
        always @(id_5 * id_5) begin : LABEL_0
          id_10 <= id_9;
        end
      end
    end
  endgenerate
  nand primCall (id_8, id_9, id_13, id_1, id_4, id_7, id_12, id_6, id_2, id_3, id_0);
  module_0 modCall_1 (
      id_13,
      id_13,
      id_13,
      id_13,
      id_14,
      id_12,
      id_14,
      id_14
  );
  assign modCall_1.id_9 = 0;
endmodule

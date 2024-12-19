// Seed: 3836296272
module module_0 (
    input tri id_0,
    input wor id_1,
    input tri1 id_2,
    output tri1 id_3
    , id_8,
    input wor id_4,
    input supply1 id_5,
    output wor id_6
);
  tri  id_9 = 1'b0;
  wire id_10;
  assign id_10 = id_8;
  assign id_3 = 1;
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  wire  id_1,
    output logic id_2,
    input  wand  id_3,
    output uwire id_4,
    output tri0  id_5,
    output wor   id_6,
    input  wor   id_7,
    input  wor   id_8,
    output tri0  id_9
);
  assign id_4 = id_0;
  module_0 modCall_1 (
      id_7,
      id_0,
      id_1,
      id_9,
      id_1,
      id_0,
      id_9
  );
  supply1 id_11;
  always @(id_11 or posedge 1'd0)
    case (1 !== id_0 * id_0 - id_7)
      id_0 & id_7:
      if (1) begin : LABEL_0
        id_9 = 1;
      end
      1: id_2 <= ~id_1;
    endcase
  xor primCall (id_2, id_0, id_3, id_8);
endmodule

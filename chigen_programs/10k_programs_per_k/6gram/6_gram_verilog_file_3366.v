// Seed: 1831740059
module module_0 (
    output wand id_0,
    output supply1 id_1,
    input wand id_2,
    input tri1 id_3,
    input wor id_4,
    input tri id_5,
    input supply1 id_6,
    output supply0 id_7,
    output tri id_8,
    input wire id_9,
    input wand id_10,
    output tri id_11
);
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    input  tri   id_2,
    output wand  id_3,
    output logic id_4
);
  always @(negedge 1) begin : LABEL_0
    case (1)
      id_2: begin : LABEL_0
        id_4 <= ~id_0;
      end
      default: begin : LABEL_0
        id_1 <= id_0 >> 1'h0;
      end
    endcase
  end
  and primCall (id_1, id_2, id_0);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_0,
      id_0,
      id_2,
      id_0,
      id_3,
      id_3,
      id_2,
      id_2,
      id_3
  );
  assign modCall_1.id_9 = 0;
endmodule

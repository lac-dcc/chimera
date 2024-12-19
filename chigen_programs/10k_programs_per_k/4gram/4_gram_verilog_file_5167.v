// Seed: 2176804575
module module_0 (
    input wor id_0,
    output wor id_1,
    input uwire id_2,
    output tri0 id_3,
    input supply0 id_4
);
  tri1 id_6;
  assign module_1.type_4 = 0;
  id_7(
      .id_0((id_3 == id_4)),
      .id_1(id_0),
      .id_2(1),
      .id_3(id_3),
      .id_4(1'b0),
      .sum(""),
      .id_5(id_6 > id_2)
  );
  tri1 id_8 = id_2;
endmodule
module module_1 (
    input wand id_0,
    output tri id_1,
    output supply0 id_2,
    output supply1 id_3,
    output wand id_4,
    input wor id_5,
    input logic id_6,
    input uwire id_7,
    input uwire id_8,
    output wor id_9,
    output wor id_10,
    output logic id_11,
    output uwire id_12,
    input uwire id_13,
    output uwire id_14,
    input wire id_15,
    input supply1 id_16
);
  always @(negedge id_16 or posedge id_15) begin : LABEL_0
    id_11 <= id_6;
    casex ((1'b0))
      id_13: id_1 = 1;
      id_7: id_9 = 1;
      1: begin : LABEL_0
        release id_2;
      end
      default: id_12 = id_7#(.id_6(1));
    endcase
  end
  module_0 modCall_1 (
      id_0,
      id_14,
      id_13,
      id_12,
      id_15
  );
endmodule

// Seed: 1462125731
module module_0 (
    input wor id_0,
    input wor id_1,
    input supply0 id_2,
    output supply1 id_3
);
  assign id_3 = 1;
endmodule
module module_1 (
    input tri1 id_0,
    output wor id_1,
    input wire id_2,
    input supply0 id_3,
    input tri1 id_4,
    input logic id_5,
    input supply0 id_6
    , id_16,
    input wand id_7,
    output uwire id_8,
    input tri0 id_9,
    output wor id_10,
    output wand id_11,
    input tri0 id_12,
    output uwire id_13,
    output supply0 id_14
);
  assign id_16 = 1'b0 ? 1'b0 : 1 ? id_6 : 1;
  reg id_17, id_18, id_19 = id_3#(.id_12(1)) == id_4 + 1'b0;
  wire id_20;
  generate
    if (id_12) begin : LABEL_0
      id_21(
          .id_0(1 == id_5), .id_1(1), .id_2(1), .id_3(id_3), .id_4(id_14 == 1), .id_5(id_7)
      );
    end
  endgenerate
  module_0 modCall_1 (
      id_0,
      id_16,
      id_7,
      id_8
  );
  always @(posedge 1'b0 or posedge 1'b0) id_18 <= id_5;
endmodule

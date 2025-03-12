// Seed: 2459420258
module module_0 (
    input supply1 id_0,
    input wor id_1,
    output wire id_2,
    output tri0 id_3
);
  assign id_2 = id_1;
endmodule
module module_1 #(
    parameter id_16 = 32'd18
) (
    input supply1 id_0,
    input tri id_1,
    input supply1 id_2,
    input uwire id_3,
    input wand id_4,
    output tri0 id_5,
    input tri id_6,
    output logic id_7,
    output supply0 id_8,
    input uwire id_9,
    output supply0 id_10,
    input wor id_11,
    output logic id_12,
    input wand id_13,
    output tri0 id_14,
    output supply0 id_15,
    input wor _id_16,
    output tri0 id_17
);
  always @(id_6 or posedge 1) begin : LABEL_0
    id_7 <= id_11;
    fork
      begin : LABEL_1
        if (1 ^ -1'b0) id_12 <= 1;
        else begin : LABEL_2
          wait (id_0);
        end
      end
    join : SymbolIdentifier
  end
  assign id_7 = id_11;
  tri [id_16 : 1] id_19 = -1 && -1'b0;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_10,
      id_14
  );
  assign modCall_1.LABEL_0.id_1 = 0;
  assign id_14 = (id_6);
endmodule

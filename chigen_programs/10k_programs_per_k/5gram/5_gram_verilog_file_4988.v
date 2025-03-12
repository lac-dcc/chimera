// Seed: 993825159
module module_0 (
    input supply1 id_0,
    input tri id_1,
    output uwire id_2,
    input wor id_3,
    input tri1 id_4
    , id_7,
    input wand id_5
);
  assign id_7 = -1;
endmodule
module module_1 (
    output tri0 id_0,
    input supply0 id_1,
    input wor id_2,
    output logic id_3,
    input wor id_4,
    output logic id_5
);
  generate
    always @(posedge 1) begin : LABEL_0
      #1 begin : LABEL_1
        id_3 <= 1;
        id_5 <= id_2;
      end
    end
  endgenerate
  wire id_7;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_0,
      id_2,
      id_2,
      id_2
  );
  assign modCall_1.id_7 = 0;
endmodule

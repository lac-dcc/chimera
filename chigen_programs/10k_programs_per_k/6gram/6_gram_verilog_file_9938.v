// Seed: 158966239
module module_0 (
    input tri id_0,
    output logic id_1,
    input supply1 id_2,
    input wor id_3,
    output supply1 id_4
);
  assign id_4 = -1;
  initial begin : LABEL_0
    id_1 <= -1;
  end
  assign module_1.id_8 = 0;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3,
    input wand id_4,
    output tri id_5,
    input wor id_6,
    input wire id_7,
    input tri id_8,
    input supply1 id_9,
    input wor id_10,
    inout supply0 id_11,
    input supply0 id_12,
    output logic id_13,
    output uwire id_14
);
  always @* $unsigned(26);
  ;
  generate
    for (id_16 = 1'b0; -1; id_13 = id_12) begin : LABEL_0
      always @(posedge 1) begin : LABEL_1
        id_16 <= id_1;
      end
    end
  endgenerate
  module_0 modCall_1 (
      id_6,
      id_13,
      id_2,
      id_10,
      id_5
  );
endmodule

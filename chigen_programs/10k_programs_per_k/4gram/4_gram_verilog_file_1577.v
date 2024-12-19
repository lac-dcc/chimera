// Seed: 537545009
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output wor id_2,
    input tri id_3,
    input tri0 id_4
);
  assign module_1.type_1 = 0;
  wire id_6;
endmodule
module module_1 (
    output logic id_0,
    output supply0 id_1,
    input uwire id_2,
    input supply0 id_3,
    input tri id_4
);
  always @(posedge id_4) begin : LABEL_0
    id_0 = #1 1'b0;
  end
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_1,
      id_3,
      id_2
  );
  assign id_0 = 1 && 1'b0 && id_3;
  wire id_7;
endmodule

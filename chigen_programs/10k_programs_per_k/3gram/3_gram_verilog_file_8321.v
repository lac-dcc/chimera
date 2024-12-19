// Seed: 3776183041
module module_0;
  assign id_1 = 1;
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input tri1 id_1,
    output supply1 id_2,
    output supply1 id_3
);
  assign id_3 = 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  logic id_0,
    input  logic id_1,
    output logic id_2,
    input  wor   id_3
);
  logic id_5;
  assign id_5 = 1;
  logic id_6, id_7;
  always begin : LABEL_0
    if (1) id_2 = 1;
    @(posedge id_3 - 1);
    id_2 <= 1'b0;
    id_6 = id_1;
    if (1 | id_0) begin : LABEL_0
      id_2 = 1'b0;
    end else begin : LABEL_0
      id_2 = 1;
    end
    for (id_5 = id_5 - 1; 1; id_7 = id_7) id_6 <= id_0;
  end
  always @(id_0 or posedge id_5) id_2 <= 1 & "" & 1 & id_3 & id_5 & id_6;
  module_0 modCall_1 ();
endmodule

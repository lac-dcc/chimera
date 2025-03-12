// Seed: 3318936093
module module_0 (
    input uwire id_0,
    input wand  id_1
);
  logic [7:0] id_3;
  assign id_3[-1] = 1'b0;
  assign id_3[1]  = id_1;
  logic id_4;
  ;
  assign module_1.id_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    output logic id_1,
    input wire id_2,
    output logic id_3,
    input tri id_4
);
  always @(id_4 == 1) begin : LABEL_0
    id_3 = #id_6(id_6);
  end
  module_0 modCall_1 (
      id_4,
      id_2
  );
  logic id_7;
  always @(posedge id_4) begin : LABEL_1
    id_1 <= id_2;
    id_3 <= 1 - id_4;
  end
endmodule

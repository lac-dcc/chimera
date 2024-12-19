// Seed: 1584757179
module module_0;
  reg id_2;
  always @(negedge id_2) id_2 = 1;
  always @(posedge id_2 ==? id_2) begin : LABEL_0
    id_2 <= #1 id_1 & 1'b0;
  end
  always @(posedge 1 or negedge id_2 == 1'b0) begin : LABEL_0
    id_1 = 1'b0;
  end
  assign id_1 = 1 ? 1 : id_2;
  wire id_3;
  wire id_4;
  wire id_5;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input uwire id_1
);
  always @(1) begin : LABEL_0
    id_3 = #1  !id_0;
  end
  module_0 modCall_1 ();
endmodule

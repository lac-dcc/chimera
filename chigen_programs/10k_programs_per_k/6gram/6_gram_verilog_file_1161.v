// Seed: 3455354717
module module_0;
  always @(1 or posedge 1) begin : LABEL_0
    if (id_1) disable id_2;
  end
  assign module_1.id_3 = 0;
  wire id_3;
  supply1 id_4;
  reg id_5;
  assign id_4 = 1'b0;
  always @(posedge 1) begin : LABEL_0
    id_5 = #id_6 id_6 - 1;
  end
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    input uwire id_2,
    input wand id_3,
    output logic id_4,
    input supply0 id_5,
    input logic id_6,
    input tri id_7,
    input wor id_8
);
  uwire id_10;
  always @(negedge 1) for (id_10 = 1'b0; 1'b0 ^ 1; id_4 = 1) id_4 <= id_6;
  module_0 modCall_1 ();
endmodule

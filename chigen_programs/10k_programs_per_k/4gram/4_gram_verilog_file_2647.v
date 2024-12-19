// Seed: 3876590011
module module_0;
  assign id_1 = id_1;
  assign module_3.id_1 = 0;
  assign module_2.type_0 = 0;
endmodule
module module_1;
  tri0 id_2;
  module_0 modCall_1 ();
  assign id_2 = 1;
  assign id_1 = id_2;
endmodule
module module_2 (
    output logic id_0,
    input  uwire id_1,
    input  wand  id_2
);
  always @(posedge id_2) id_0 <= 1'b0;
  module_0 modCall_1 ();
endmodule
module module_3 (
    input  tri   id_0,
    output logic id_1,
    input  uwire id_2
);
  always @(1 or posedge 1, negedge id_0) begin : LABEL_0
    id_1 <= 1;
  end
  module_0 modCall_1 ();
endmodule

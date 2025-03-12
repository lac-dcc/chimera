// Seed: 3821439645
module module_0 ();
  specify
    (posedge id_1 => (id_2 +: 1'b0)) = (id_1, -1'b0 : 1  : id_1);
  endspecify
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
  wire id_2;
endmodule
module module_2 (
    input  tri1  id_0,
    output wire  id_1,
    input  uwire id_2
);
  assign id_1 = id_0;
  wire id_4;
  module_0 modCall_1 ();
  assign id_1 = id_2;
endmodule
module module_3 (
    input  wire  id_0,
    input  tri   id_1,
    input  uwire id_2,
    output logic id_3,
    input  tri0  id_4
);
  always_ff @((id_4)) begin : LABEL_0
    id_3 <= 1 == id_0;
  end
  module_0 modCall_1 ();
  assign modCall_1.id_2 = 0;
endmodule

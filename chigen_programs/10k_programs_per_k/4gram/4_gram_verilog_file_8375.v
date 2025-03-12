// Seed: 109737083
module module_0 (
    output logic id_0,
    input  uwire id_1,
    input  tri   id_2
);
  always @(negedge -1) id_0 = id_1;
  assign id_0 = -1;
  logic \id_4 ;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    output logic id_2
);
  always_latch @(!id_0 or negedge id_0 == 1) begin : LABEL_0
    id_2 = -1;
  end
  always @(1) id_1 = 1'h0;
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0
  );
  wire id_4;
endmodule
module module_2 (
    input uwire id_0,
    output tri1 id_1,
    input supply0 id_2,
    input wor id_3,
    output wire id_4,
    input tri0 id_5
);
  always force id_1 = id_3;
endmodule
module module_3 (
    input  tri0  id_0,
    output uwire id_1,
    input  tri   id_2,
    output tri0  id_3
);
  parameter id_5 = -1;
  module_2 modCall_1 (
      id_0,
      id_3,
      id_2,
      id_0,
      id_3,
      id_2
  );
endmodule

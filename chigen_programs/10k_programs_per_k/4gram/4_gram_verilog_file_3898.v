// Seed: 3641581077
module module_0 (
    output tri id_0,
    output wor id_1,
    input supply1 id_2,
    output uwire id_3,
    input tri0 id_4,
    output wand id_5,
    input tri0 id_6,
    output wand id_7
);
  assign id_3 = (1);
endmodule
module module_1 (
    input  tri1  id_0,
    output tri0  id_1,
    input  tri1  id_2,
    output logic id_3
);
  always force id_3 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_0,
      id_1,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_3 = 0;
  initial begin : LABEL_0
    id_3 <= id_0;
  end
endmodule
module module_2 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  logic [7:0] id_4 = id_1;
  assign id_4[1] = -1;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  output wire id_3;
  module_2 modCall_1 (
      id_2,
      id_3,
      id_1
  );
  inout wire id_2;
  inout wire id_1;
  wire id_5;
  ;
  always @(posedge id_4) begin : LABEL_0
    wait (id_1);
  end
endmodule

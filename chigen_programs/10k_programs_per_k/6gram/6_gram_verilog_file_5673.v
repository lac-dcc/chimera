// Seed: 1241459009
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  assign id_3 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wand id_4 = 1, id_5;
  module_0 modCall_1 (
      id_4,
      id_4
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge 1'd0) id_4 <= (id_1);
  assign module_3.type_1 = 0;
endmodule
module module_3 (
    input  logic id_0,
    output wand  id_1
);
  reg id_3;
  generate
    for (id_4 = 1; id_0 == id_3; id_4 = id_4) begin : LABEL_0
      wire id_5;
      assign id_4 = 1;
    end
  endgenerate
  initial begin : LABEL_0
    id_3 <= id_0;
    $display(1, id_3 + id_4);
  end
  module_2 modCall_1 (
      id_3,
      id_4,
      id_5,
      id_3,
      id_4
  );
endmodule

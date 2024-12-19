// Seed: 2368811982
module module_0 (
    output wor id_0,
    input uwire id_1,
    input wire id_2,
    input uwire id_3,
    input supply0 id_4,
    output wire id_5
);
  wire id_7;
  assign module_1.id_3 = 0;
  wire id_8;
  module_2 modCall_1 (
      id_8,
      id_7
  );
endmodule
module module_1 (
    output tri1 id_0,
    input  tri0 id_1,
    input  tri  id_2,
    output tri1 id_3,
    input  tri0 id_4
);
  generate
    always @(1 or negedge 1) begin : LABEL_0
      wait (1 - 1);
    end
  endgenerate
  notif1 primCall (id_3, id_2, id_4);
  module_0 modCall_1 (
      id_3,
      id_2,
      id_4,
      id_4,
      id_4,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2
);
  inout wire id_2;
  output wire id_1;
  assign id_1 = id_2;
endmodule

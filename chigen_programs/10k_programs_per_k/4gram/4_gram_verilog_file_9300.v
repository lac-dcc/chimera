// Seed: 3667767741
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  assign module_1.id_0 = 0;
  output wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    output tri0 id_0
);
  always @(posedge 1'h0) begin : LABEL_0
    fork
      @(posedge -1);
      wait (1);
    join
  end
  wire id_2;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_2
  );
  assign (weak1, highz0) id_2 = id_2;
endmodule
module module_2 #(
    parameter id_2 = 32'd94
) (
    id_1,
    _id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire _id_2;
  input wire id_1;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5
  );
  logic [id_2 : -1] id_6;
endmodule

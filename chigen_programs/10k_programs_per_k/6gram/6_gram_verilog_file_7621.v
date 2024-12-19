// Seed: 1486362321
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3, id_4;
  assign module_1.id_1 = 0;
endmodule
module module_1;
  generate
    for (id_1 = id_1; id_1; id_1 = 1'b0) begin : LABEL_0
      always @(negedge id_1 == 1'b0) $display;
    end
  endgenerate
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = id_6 && 1;
  module_0 modCall_1 (
      id_1,
      id_2
  );
endmodule

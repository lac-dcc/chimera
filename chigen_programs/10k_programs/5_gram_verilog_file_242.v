// Seed: 378585174
module module_0 (
    input tri1 id_0,
    input tri1 id_1
);
  assign id_3 = 0;
endmodule
module module_1 (
    input tri1 id_0,
    input wire id_1
);
  reg id_3;
  module_0(
      id_0, id_1
  );
  generate
    assign id_3 = $display("" & !id_1);
  endgenerate
  always @(posedge 1'b0) id_3 = #1 1;
endmodule
module module_2 (
    input  tri1  id_0,
    output uwire id_1,
    output wor   id_2
);
  assign id_1 = 1 || 1 || 1;
  module_0(
      id_0, id_0
  );
endmodule

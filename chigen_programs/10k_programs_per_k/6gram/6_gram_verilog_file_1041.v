// Seed: 3289641128
module module_0 (
    input supply0 id_0,
    input tri id_1,
    output supply1 id_2
);
  always @(posedge 1'b0)
    if (1 || id_0)
      for (id_2 = 1; 1; id_2 = id_1) begin
        $display;
      end
endmodule
module module_1 (
    input supply0 id_0,
    input tri id_1,
    output uwire id_2,
    output tri0 id_3
);
  assign id_2 = 1;
  module_0(
      id_1, id_0, id_3
  );
endmodule
module module_2 (
    output supply1 id_0,
    input  supply1 id_1,
    output uwire   id_2
);
  assign id_2 = 1;
  logic [7:0] id_4;
  module_0(
      id_1, id_1, id_0
  );
  assign id_4[1] = 1;
endmodule

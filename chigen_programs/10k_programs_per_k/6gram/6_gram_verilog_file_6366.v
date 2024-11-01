// Seed: 373664605
module module_0 (
    input  wand id_0,
    input  tri1 id_1,
    output tri0 id_2
);
  generate
    for (id_4 = id_0; id_0; id_4 = id_4) begin : id_5
      always @(1 - 1 or 1, 0 - id_1 or posedge 1) begin
        $display(id_5 & id_0, id_0);
        id_2 = 1'b0;
      end
    end
  endgenerate
endmodule
module module_1 (
    output tri   id_0,
    output wand  id_1,
    input  wire  id_2,
    output logic id_3
);
  initial
    #1 begin
      id_3 <= 1'h0 == "";
    end
  module_0(
      id_2, id_2, id_0
  );
endmodule

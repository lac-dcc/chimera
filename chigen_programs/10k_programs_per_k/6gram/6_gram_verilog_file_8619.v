// Seed: 3865096021
module module_0 (
    output uwire id_0,
    output tri   id_1,
    input  tri   id_2,
    output wire  id_3,
    output wor   id_4
);
  always @(posedge 1'b0) begin
    #1;
  end
endmodule
module module_1 (
    input uwire id_0,
    input tri1 id_1,
    output uwire id_2,
    input tri0 id_3,
    output supply1 id_4
);
  module_0(
      id_4, id_2, id_3, id_4, id_4
  );
  assign id_2 = 1'b0;
  supply0 id_6 = 1;
  initial begin
    id_4 = id_1;
    if (id_6 || id_0 && 1) begin
      repeat (id_6) $display("" == 'b0, 1'b0, id_1, 1);
    end else begin
      for (id_4 = 1; 1'd0; id_6 = 1 + id_0) begin
        if (1) id_6 = id_0;
      end
    end
  end
endmodule

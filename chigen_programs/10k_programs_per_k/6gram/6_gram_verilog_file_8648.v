// Seed: 3194618389
module module_0 (
    input  tri0 id_0,
    output tri  id_1
);
endmodule
module module_1 (
    output supply1 id_0,
    input uwire id_1,
    input tri1 id_2,
    input logic id_3
);
  supply1 id_5;
  assign id_0 = id_5;
  logic id_6 = id_3;
  initial begin
    fork
      id_7(id_3 == id_6, id_7, 1, 1);
      for (id_6 = ~{1{id_6}} | 1'd0; 1; id_0 = 1) id_0 = 1;
      #1 id_6 <= #1 1'b0;
    join
    id_7 = id_2 == 1;
  end
  module_0(
      id_2, id_0
  );
endmodule

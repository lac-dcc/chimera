// Seed: 1251528710
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  for (id_6 = 1; 1'd0; id_1 = id_2) begin : id_7
    assign id_3 = 1'd0;
  end
endmodule
module module_1;
  wire id_2;
  module_0(
      id_2, id_2, id_2, id_2, id_2
  );
endmodule
module module_2 (
    output tri0 id_0,
    input  wand id_1,
    input  tri0 id_2
);
  id_4 :
  assert property (@(negedge id_2 ^ id_1) id_4 + 1)
  else assert (1'h0);
  or (id_0, id_5, id_2, id_1);
  wire id_5;
  module_0(
      id_4, id_4, id_5, id_4, id_4
  );
endmodule

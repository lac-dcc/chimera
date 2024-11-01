// Seed: 1984486056
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2,
    output uwire id_3,
    output tri0 id_4
);
  wire id_6, id_7;
  xnor (id_3, id_7, id_1, id_0);
  module_2(
      id_7, id_6, id_7, id_6, id_6
  );
endmodule
module module_1 (
    output tri id_0,
    output supply0 id_1,
    input tri id_2,
    output wor id_3,
    input uwire id_4
);
  always_latch @(posedge id_2) begin
    wait (1);
    id_1 += id_4;
  end
  wire id_6;
  generate
    assign id_0 = 1;
  endgenerate
  module_0(
      id_2, id_4, id_0, id_1, id_0
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_6 :
  assert property (@(posedge id_6) id_1)
  else $display;
endmodule

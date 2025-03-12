// Seed: 1413053141
module module_0 (
    input supply0 id_0,
    input supply1 id_1,
    output tri id_2,
    output uwire id_3,
    output tri id_4,
    input supply0 id_5
);
  parameter id_7 = ~(1);
  assign id_4 = id_5;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    input supply1 id_2,
    output tri id_3
);
  logic id_5;
  assign id_3 = id_2;
  assign id_0 = 1'b0 == id_2;
  logic id_6 = id_5;
  logic [-1 'b0 : -1 'h0] id_7;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_3,
      id_2
  );
endmodule

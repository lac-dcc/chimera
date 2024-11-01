// Seed: 2640035544
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  final $display(1, 1'b0 == id_7, id_8, 1);
  wire id_9;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  always_comb begin
    id_6 <= id_1;
  end
  xor (id_5, id_4, id_1, id_2);
  module_0(
      id_4, id_5, id_3, id_2, id_3, id_4, id_5, id_5
  );
endmodule

// Seed: 3886366740
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  reg id_5;
  module_0(
      id_1, id_4, id_1, id_4, id_1, id_2, id_1
  );
  xnor (id_1, id_3, id_4, id_2, id_5);
  always @(*) begin
    id_5 <= 1 == id_5;
  end
endmodule

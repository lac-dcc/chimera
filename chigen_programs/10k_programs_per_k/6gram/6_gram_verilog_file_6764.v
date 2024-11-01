// Seed: 3906475760
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  logic [7:0] id_3;
  assign id_3[1'b0] = id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_1[1] = {id_3{1}};
  module_0(
      id_4, id_4
  );
  always @* begin
    id_3 <= 1 - id_2;
  end
endmodule

// Seed: 3659187031
module module_0;
  initial begin
    id_1 = 1;
    assert (id_1 + id_1);
    $display(1);
    id_1 = #id_2 id_1;
  end
endmodule
module module_1 #(
    parameter id_11 = 32'd34,
    parameter id_12 = 32'd39
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_8 = id_2;
  wire id_9;
  wire id_10;
  module_0(); defparam id_11.id_12 = 1'b0;
  xnor (id_3, id_5, id_6, id_7, id_9);
endmodule

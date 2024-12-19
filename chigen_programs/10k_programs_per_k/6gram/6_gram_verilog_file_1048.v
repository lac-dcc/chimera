// Seed: 967400100
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_5 = id_8;
  always @(*) begin : LABEL_0
    id_1 = 1'b0;
  end
  assign module_1.id_9 = 0;
endmodule
module module_1 #(
    parameter id_10 = 32'd88,
    parameter id_9  = 32'd19
) (
    input  uwire id_0,
    input  tri0  id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  uwire id_4,
    output tri0  id_5
);
  wire id_7;
  or primCall (id_5, id_2, id_9, id_4, id_7, id_3);
  wire id_8;
  defparam id_9.id_10 = !id_4;
  module_0 modCall_1 (
      id_7,
      id_8,
      id_8,
      id_7,
      id_8,
      id_8,
      id_7,
      id_8,
      id_8
  );
endmodule

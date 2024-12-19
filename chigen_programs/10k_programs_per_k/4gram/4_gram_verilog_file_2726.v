// Seed: 1070252383
module module_0 #(
    parameter id_10 = 32'd50,
    parameter id_9  = 32'd93
) (
    input supply0 id_0,
    output supply0 id_1,
    output wor id_2,
    input wand id_3,
    output uwire id_4
);
  assign id_4 = 1;
  assign id_2 = 1'b0 - 1;
  logic [7:0] id_6, id_7;
  wire id_8;
  initial begin : LABEL_0
    id_6[1] <= "";
  end
  defparam id_9.id_10 = id_3 > 1;
endmodule
module module_1 (
    output tri0 id_0,
    input logic id_1,
    output uwire id_2,
    output tri1 id_3,
    output supply1 id_4,
    input tri id_5,
    input tri0 id_6,
    input tri id_7,
    output wire id_8,
    output tri0 id_9,
    output tri1 id_10,
    input wire id_11
);
  reg id_13 = 1;
  assign id_4 = id_5;
  always id_13 <= id_1;
  module_0 modCall_1 (
      id_11,
      id_10,
      id_8,
      id_5,
      id_2
  );
endmodule

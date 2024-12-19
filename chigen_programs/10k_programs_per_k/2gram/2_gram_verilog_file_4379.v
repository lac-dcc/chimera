// Seed: 4224359813
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  input wire id_1;
  tri id_4;
  supply1 id_5 = 1'h0;
  reg id_6;
  assign id_4 = id_5;
  supply1 id_7;
  initial begin : LABEL_0
    id_6 <= 1;
    id_7 = 1;
    if (1) id_3 <= 1;
    else id_4 = 1 + id_5;
  end
  wire id_8;
endmodule
module module_1 #(
    parameter id_5 = 32'd85,
    parameter id_6 = 32'd22
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  final begin : LABEL_0
    id_1 <= id_4;
  end
  assign id_2 = 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1
  );
  assign modCall_1.type_9 = 0;
  defparam id_5.id_6 = 1;
endmodule

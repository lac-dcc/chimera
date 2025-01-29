// Seed: 662648011
module module_0 #(
    parameter id_10 = 32'd82,
    parameter id_11 = 32'd45
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6, id_7, id_8, id_9;
  defparam id_10 = 1, id_11 = -1;
  wire id_12;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply0 id_1,
    output supply1 id_2
);
  wire id_4;
  for (id_5 = id_1; -1; id_2 = 1) begin : LABEL_0
    wire id_6;
  end
  module_0 modCall_1 (
      id_4,
      id_6,
      id_4,
      id_4,
      id_6
  );
  assign modCall_1.id_11 = 0;
  wire id_7, id_8, id_9, id_10;
  assign id_5 = 1;
  int id_11 (
      .id_0(id_4),
      .id_1(id_10),
      .id_2(-1'd0),
      .id_3(-1),
      .id_4(id_4),
      .id_5((id_8)),
      .id_6(1),
      .product(1)
  );
endmodule

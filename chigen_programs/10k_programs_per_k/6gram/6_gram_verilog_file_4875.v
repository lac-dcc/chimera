// Seed: 2895163656
module module_0 (
    output tri1 id_0,
    input wor id_1,
    output tri id_2,
    input wand id_3,
    input supply1 id_4,
    input wand id_5
);
  wire id_7;
  assign id_0 = 1;
  always @(posedge 1'd0) begin : LABEL_0
    id_0 = id_3;
  end
endmodule
module module_1 #(
    parameter id_11 = 32'd69,
    parameter id_12 = 32'd17
) (
    input tri0 id_0,
    input wire id_1,
    input wor id_2,
    input tri0 id_3,
    output tri1 id_4,
    output uwire id_5,
    output supply1 id_6,
    output tri0 id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4,
      id_0,
      id_3,
      id_3
  );
  assign modCall_1.type_0 = 0;
  wire id_10;
  defparam id_11.id_12 = 1;
endmodule

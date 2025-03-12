// Seed: 2063698225
module module_0 (
    input  wand id_0,
    output tri0 id_1
);
  assign id_1 = 1 ? id_0 + id_0 : id_0 == -1;
  generate
    assign id_1 = id_0#(
        .id_0(-1'd0),
        .id_0(1),
        .id_0(1),
        .id_0(1),
        .id_0(1'b0 | (1))
    );
    for (id_3 = -1; id_3 != -1; id_3 = -1) begin : LABEL_0
      wire id_4;
      ;
    end
  endgenerate
endmodule
module module_1 #(
    parameter id_9 = 32'd57
) (
    output tri1  id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  wand  id_3,
    output logic id_4,
    input  wire  id_5
    , id_8,
    output wor   id_6
);
  parameter id_9 = 1;
  logic id_10;
  defparam id_9.id_9 = id_9 < 1;
  module_0 modCall_1 (
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
  initial id_4 = id_9;
endmodule

// Seed: 195155862
module module_0 (
    input uwire id_0,
    input wire id_1,
    input supply0 id_2,
    input supply0 id_3,
    output wor id_4,
    output wor id_5,
    output wire id_6,
    input tri1 id_7,
    input wand id_8,
    input supply0 id_9
    , id_13,
    input supply0 id_10,
    output wor id_11
);
  tri  id_14 = id_3 & id_1;
  wire id_15;
  ;
  assign id_14 = id_1;
endmodule
module module_1 #(
    parameter id_8 = 32'd87
) (
    input wor id_0,
    output wire id_1,
    output uwire id_2,
    output supply0 id_3
);
  logic id_5;
  localparam id_6 = 1'b0;
  assign id_5 = -1;
  wire id_7, _id_8, id_9;
  uwire [id_8 : -1] id_10;
  module_0 modCall_1 (
      id_0,
      id_0,
      id_0,
      id_0,
      id_2,
      id_2,
      id_2,
      id_0,
      id_0,
      id_0,
      id_0,
      id_3
  );
  assign modCall_1.id_6 = 0;
  wire [1 : 1] id_11;
  parameter id_12 = id_6;
  assign id_10 = id_8 ? 1 : id_0;
  always @(id_8 or posedge 1 - id_6) begin : LABEL_0
    $signed(3);
    ;
  end
endmodule

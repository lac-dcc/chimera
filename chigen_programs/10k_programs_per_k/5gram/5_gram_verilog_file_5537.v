// Seed: 1764129029
module module_0 (
    input supply1 id_0,
    output logic id_1,
    input uwire id_2,
    input wand id_3
);
  always @(id_0 or id_3) begin : LABEL_0
    id_1 <= 1;
  end
  assign id_1 = id_2;
  parameter id_5 = 1;
  final begin : LABEL_1
    id_1 = "" && -1;
    if (1) id_1 <= (1 | id_2);
  end
endmodule
module module_1 #(
    parameter id_4 = 32'd7
) (
    input  tri1  id_0,
    output uwire id_1,
    output wand  id_2
    , id_6,
    output logic id_3,
    input  wand  _id_4
);
  logic [id_4 : 1] id_7;
  ;
  wire id_8 = id_6;
  wire id_9;
  always_ff @(*) id_3 = -1;
  module_0 modCall_1 (
      id_0,
      id_3,
      id_0,
      id_0
  );
endmodule

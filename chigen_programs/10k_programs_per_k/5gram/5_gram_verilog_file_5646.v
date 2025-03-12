// Seed: 1585890403
module module_0 (
    input  uwire id_0,
    output tri1  id_1,
    input  wor   id_2,
    output uwire id_3
);
  logic id_5;
  ;
endmodule
module module_1 #(
    parameter id_4 = 32'd86
) (
    input supply1 id_0,
    input wor id_1,
    output logic id_2,
    input tri id_3,
    input tri _id_4,
    output wire id_5
    , id_7
);
  logic [7:0] id_8;
  assign id_8[id_4] = -1'h0;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_0,
      id_5
  );
  final begin : LABEL_0
    id_2 <= id_4;
    id_2 <= id_8;
  end
  wire id_9;
  or primCall (id_2, id_0, id_3, id_1, id_7, id_8);
endmodule

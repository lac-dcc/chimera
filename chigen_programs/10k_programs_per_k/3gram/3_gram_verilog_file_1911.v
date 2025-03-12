// Seed: 3424246967
module module_0 (
    input tri id_0
    , id_16,
    input tri0 id_1,
    output wand id_2,
    input supply1 id_3,
    input supply1 id_4,
    input wire id_5
    , id_17,
    input wor id_6,
    output tri id_7,
    output wand id_8,
    output tri id_9,
    output tri0 id_10,
    output tri1 id_11,
    input wor id_12,
    input tri id_13,
    input wor id_14
);
  id_18 :
  assert property (@(posedge 1) id_0)
  else id_16 <= -1;
endmodule
module module_1 #(
    parameter id_5 = 32'd77
) (
    output tri1 id_0,
    output wand id_1,
    input tri id_2,
    input supply0 id_3,
    output tri0 id_4,
    input tri1 _id_5,
    output logic id_6,
    input wor id_7
);
  wire id_9;
  wire id_10;
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2,
      id_7,
      id_1,
      id_0,
      id_0,
      id_1,
      id_0,
      id_7,
      id_3,
      id_2
  );
  assign modCall_1.id_0 = 0;
  wire id_11;
  parameter id_12 = 1'd0;
  logic [id_5 : 1] id_13;
  integer id_14 = -1 || id_14;
  id_15 :
  assert property (@(posedge 1) 1)
  else begin : LABEL_0
    if (id_12) id_6 <= id_13[1] && id_3;
    else begin : LABEL_1
      id_15 <= id_9;
    end
  end
endmodule

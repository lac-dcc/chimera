// Seed: 2703528170
module module_0 (
    output supply0 id_0,
    input supply1 id_1,
    input wor id_2,
    output wire id_3,
    input wand id_4,
    input tri id_5,
    output uwire id_6,
    input wand id_7,
    input supply1 id_8,
    input supply0 id_9
);
  id_11 :
  assert property (@(negedge id_1) id_8)
  else $unsigned(40);
  ;
  assign module_1.id_6 = 0;
  logic id_12 = id_5;
endmodule
module module_1 #(
    parameter id_2 = 32'd23
) (
    input supply1 id_0,
    output wor id_1,
    input supply1 _id_2,
    input tri0 id_3,
    input tri1 id_4,
    input supply1 id_5,
    input supply1 id_6,
    input uwire id_7,
    input tri id_8,
    output tri1 id_9,
    output supply1 id_10,
    output logic id_11,
    input supply1 id_12,
    input uwire id_13,
    input tri0 id_14
);
  bit [(  1  ) : id_2] id_16 = id_8;
  assign id_11 = 1 ? id_3 : id_5;
  logic [1 : -1] id_17;
  initial begin : LABEL_0
    $signed(43);
    ;
    id_16 = 1;
    id_11 <= 1;
    id_17 <= id_7;
    assign id_17 = id_14;
  end
  module_0 modCall_1 (
      id_9,
      id_5,
      id_14,
      id_10,
      id_5,
      id_3,
      id_10,
      id_4,
      id_14,
      id_14
  );
endmodule

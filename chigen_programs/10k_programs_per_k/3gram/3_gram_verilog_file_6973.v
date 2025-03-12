// Seed: 208529323
module module_0 (
    input tri0 id_0,
    output wor id_1,
    input supply1 id_2,
    input wor id_3,
    input supply1 id_4,
    input wand id_5
);
  assign id_1 = ~id_0;
  logic [1 : -1] id_7;
  ;
  initial id_7 = 1;
endmodule
module module_1 (
    input wor id_0,
    output logic id_1,
    input supply0 id_2,
    output wire id_3,
    input supply1 id_4,
    input wor id_5,
    input tri0 id_6
    , id_10,
    output supply0 id_7,
    input supply1 id_8
);
  final begin : LABEL_0
    id_1 <= -1'd0;
  end
  module_0 modCall_1 (
      id_6,
      id_7,
      id_4,
      id_8,
      id_4,
      id_5
  );
  assign modCall_1.id_0 = 0;
  parameter id_11 = 1;
  wire id_12 = id_4;
endmodule

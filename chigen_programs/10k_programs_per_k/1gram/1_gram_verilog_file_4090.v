// Seed: 2901830079
module module_0 (
    input wand id_0,
    input supply1 id_1,
    input tri1 id_2
    , id_8,
    output wire id_3
    , id_9,
    output tri0 id_4,
    input tri1 id_5,
    output tri0 id_6
);
  id_10(
      id_2, 1
  );
endmodule
module module_1 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2,
    input wire void id_3,
    output tri1 id_4,
    input supply0 id_5,
    input wire id_6,
    input uwire id_7,
    output logic id_8,
    input wire id_9,
    output logic id_10
);
  tri1 id_12 = id_9;
  module_0 modCall_1 (
      id_5,
      id_0,
      id_9,
      id_12,
      id_12,
      id_5,
      id_4
  );
  assign modCall_1.type_4 = 0;
  time id_13;
  always begin : LABEL_0
    if (id_13) id_10.id_13 <= 1;
    else;
  end
  initial id_8 <= id_3 - id_12;
  assign id_12 = 1'b0;
  wand id_14 = id_0;
endmodule

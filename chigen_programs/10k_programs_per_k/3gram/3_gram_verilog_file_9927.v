// Seed: 2582030971
module module_0 (
    input tri id_0,
    output supply1 id_1,
    input uwire id_2,
    output supply1 id_3,
    input tri id_4,
    output supply0 id_5,
    output uwire id_6,
    output supply0 id_7,
    input wand id_8,
    output tri0 id_9
);
  assign id_3 = id_8;
  wire id_11;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    input uwire id_2,
    output wor id_3,
    input supply1 id_4,
    output logic id_5,
    input tri0 id_6,
    input wire id_7,
    input supply0 id_8,
    input tri0 id_9
    , id_15,
    input wire id_10,
    input wor id_11,
    input wand id_12,
    output tri id_13
);
  localparam id_16 = 1;
  final begin : LABEL_0
    id_5 <= id_6;
  end
  module_0 modCall_1 (
      id_6,
      id_3,
      id_2,
      id_3,
      id_9,
      id_3,
      id_13,
      id_0,
      id_12,
      id_3
  );
  assign modCall_1.id_1 = 0;
endmodule

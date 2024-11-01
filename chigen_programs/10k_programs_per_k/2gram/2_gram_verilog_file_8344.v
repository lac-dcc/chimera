// Seed: 3462227024
module module_0 (
    input uwire id_0
    , id_19,
    output supply0 id_1,
    output uwire id_2,
    input uwire id_3,
    input wor id_4,
    input wor id_5,
    output uwire id_6,
    input uwire id_7
    , id_20,
    output tri id_8,
    input tri id_9,
    input supply1 id_10,
    output wire id_11,
    output wire id_12
    , id_21,
    input tri1 id_13,
    input supply1 id_14,
    output tri1 id_15,
    output tri id_16,
    input tri id_17
);
  wire id_22;
  assign id_11 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wand  id_1,
    input  logic id_2,
    output tri1  id_3,
    output logic id_4,
    output wor   id_5,
    output tri0  id_6
);
  module_0(
      id_0,
      id_5,
      id_6,
      id_0,
      id_1,
      id_0,
      id_5,
      id_1,
      id_5,
      id_1,
      id_0,
      id_6,
      id_6,
      id_0,
      id_1,
      id_6,
      id_6,
      id_1
  );
  always_latch begin
    id_4 <= id_2;
  end
endmodule

// Seed: 4022362490
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2,
    input uwire id_3,
    input wire id_4,
    output uwire id_5,
    input wand id_6,
    output wor id_7,
    input tri1 id_8,
    output supply1 id_9,
    input wire id_10,
    input supply0 id_11,
    output supply0 id_12,
    output wire id_13,
    input tri1 id_14
    , id_16
);
  wire  id_17;
  wire  id_18;
  wire  id_19;
  uwire id_20 = id_14;
  assign module_1.type_1 = 0;
endmodule
module module_1 (
    output supply0 id_0,
    input supply1 id_1,
    output logic id_2,
    input supply0 id_3,
    input wor id_4,
    output wor id_5,
    output wire id_6,
    input supply0 id_7,
    output supply1 id_8
    , id_10
);
  always #0 begin : LABEL_0
    id_2 <= id_10;
  end
  module_0 modCall_1 (
      id_1,
      id_7,
      id_5,
      id_1,
      id_4,
      id_5,
      id_1,
      id_5,
      id_1,
      id_8,
      id_1,
      id_4,
      id_5,
      id_0,
      id_4
  );
endmodule

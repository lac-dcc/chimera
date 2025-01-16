// Seed: 2656566545
module module_0 (
    input uwire id_0,
    output tri id_1,
    output uwire id_2,
    input wor id_3,
    input wor id_4,
    input uwire id_5,
    input uwire id_6,
    input wand id_7,
    output wire id_8,
    input wor id_9,
    input supply0 id_10
);
  assign id_2 = 1;
  assign id_1 = id_3;
  wire id_12;
  always
    if (1) return id_0;
    else begin : LABEL_0
      id_8 = id_5;
    end
  wire id_13;
  assign id_2 = id_10 - id_3;
  wire id_14;
endmodule
module module_1 (
    input supply1 id_0,
    input wor id_1,
    output tri0 id_2,
    output wor id_3,
    input tri id_4,
    input supply1 id_5,
    output uwire id_6,
    input wor id_7,
    output supply1 id_8,
    input wire id_9,
    output tri1 id_10,
    output uwire id_11,
    input supply1 id_12,
    output wor id_13,
    input tri id_14,
    input tri0 id_15
);
  reg  id_17;
  wire id_18;
  always wait (id_15) id_17 <= -1;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_6,
      id_4,
      id_4,
      id_12,
      id_4,
      id_7,
      id_11,
      id_5,
      id_5
  );
  assign id_13 = (~id_14);
endmodule

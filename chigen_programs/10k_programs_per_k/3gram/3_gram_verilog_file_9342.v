// Seed: 585938469
module module_0 (
    input wor id_0,
    output uwire id_1,
    input wire id_2,
    input tri id_3,
    input uwire id_4,
    output tri0 id_5,
    input wor id_6,
    input tri1 id_7,
    input wor id_8,
    input tri id_9,
    output tri id_10,
    input wand id_11,
    output wire id_12,
    input tri1 id_13,
    output tri0 id_14,
    output wire id_15,
    input tri id_16
    , id_21,
    output tri0 id_17,
    input supply1 id_18,
    input uwire id_19
);
  wire id_22;
  assign module_1.type_13 = 0;
endmodule
module module_1 (
    input  tri1  id_0,
    input  uwire id_1,
    output tri0  id_2,
    output wire  id_3
    , id_9,
    input  wire  id_4,
    input  wand  id_5,
    output logic id_6,
    input  tri0  id_7
);
  module_0 modCall_1 (
      id_0,
      id_3,
      id_1,
      id_0,
      id_5,
      id_3,
      id_5,
      id_1,
      id_0,
      id_0,
      id_3,
      id_0,
      id_2,
      id_1,
      id_3,
      id_2,
      id_7,
      id_2,
      id_1,
      id_5
  );
  id_10 :
  assert property (@(id_9) 1)
  else id_6 <= 1;
  assign id_6 = id_10;
  assign id_9 = 1;
endmodule

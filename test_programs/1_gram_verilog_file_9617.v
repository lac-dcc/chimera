// Seed: 1443397467
module module_0 (
    input supply1 id_0,
    output uwire id_1,
    input tri id_2,
    input supply1 id_3,
    output wand id_4,
    id_14,
    input tri id_5,
    input supply0 id_6,
    input uwire id_7,
    output supply0 id_8,
    input wor id_9,
    input wand id_10,
    output supply1 id_11,
    input uwire id_12,
    id_15
);
  assign module_1.id_4 = 0;
  assign id_1 = id_3;
  wire id_16, id_17, id_18, id_19, id_20, id_21, id_22;
  parameter id_23 = id_15;
  assign id_19 = id_18;
  id_24(
      .id_0(-1), .id_1(1 ? -1 : id_23[1]), .id_2(id_0), .id_3(id_0)
  );
  parameter id_25 = 1;
  wire id_26;
endmodule
module module_1 (
    output logic id_0,
    output tri id_1,
    input tri0 id_2,
    input wand id_3,
    input tri0 id_4,
    input wand id_5,
    input wire id_6,
    input uwire id_7,
    id_27,
    input wor id_8,
    input supply1 id_9,
    input tri id_10,
    input supply1 id_11,
    input supply0 id_12,
    input wor id_13,
    input wire id_14,
    output supply0 id_15,
    output wor id_16,
    input wor id_17,
    output tri0 id_18,
    input supply1 id_19,
    input logic id_20,
    input logic id_21,
    id_28,
    input tri1 id_22,
    output uwire id_23,
    output tri id_24,
    input tri0 id_25
);
  if (id_28) assign id_0 = id_27;
  else
    id_29 :
    assert property (@(id_20) id_21)
    else @(posedge ~id_20 or negedge id_9 == id_17) id_27 <= 1;
  module_0 modCall_1 (
      id_8,
      id_16,
      id_5,
      id_5,
      id_18,
      id_2,
      id_3,
      id_17,
      id_23,
      id_3,
      id_5,
      id_18,
      id_5
  );
endmodule

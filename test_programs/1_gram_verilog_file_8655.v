// Seed: 1380944913
module module_0 (
    input tri id_0,
    input wire id_1,
    output supply0 id_2,
    input uwire id_3,
    input wor id_4,
    output tri id_5,
    output tri id_6,
    id_16,
    input supply1 id_7,
    output uwire id_8,
    input wire id_9,
    input tri id_10,
    output uwire id_11,
    output tri0 id_12,
    output tri0 id_13,
    output tri id_14
);
  id_17(
      id_9, 1
  );
endmodule
module module_1 (
    output wire id_0,
    input supply1 id_1,
    input tri0 id_2,
    input tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    input tri id_6,
    output logic id_7,
    input uwire id_8,
    input wand id_9,
    input tri0 id_10,
    input supply1 id_11,
    input uwire id_12,
    output tri id_13,
    input wor id_14,
    input tri id_15,
    id_18,
    input tri0 id_16
);
  id_19 :
  assert property (@(posedge id_11 or 1) -1 ** id_8) id_7 <= 1;
  logic id_20;
  module_0 modCall_1 (
      id_15,
      id_1,
      id_13,
      id_4,
      id_6,
      id_0,
      id_13,
      id_9,
      id_13,
      id_9,
      id_6,
      id_0,
      id_19,
      id_19,
      id_0
  );
  assign modCall_1.id_4 = 0;
  wand id_21 = id_3 & id_6, id_22;
  assign id_7 = id_20(1, id_14, id_18[1]);
endmodule

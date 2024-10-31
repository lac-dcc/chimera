// Seed: 3216276020
module module_0 (
    input tri   id_0,
    input uwire id_1,
    input tri0  id_2
);
endmodule
module module_1 (
    input wand id_0,
    input uwire id_1,
    input tri id_2,
    input wand id_3,
    output tri1 id_4,
    output tri1 id_5,
    input wor id_6,
    input wand id_7,
    output wand id_8,
    input supply0 id_9,
    input wor id_10,
    output tri1 id_11,
    input uwire id_12,
    input tri1 id_13,
    output logic id_14,
    input tri id_15,
    input supply1 id_16,
    input tri1 id_17,
    input supply1 id_18,
    input supply1 id_19,
    input wire id_20,
    input wand id_21,
    input supply1 id_22,
    output tri id_23
);
  reg id_25;
  id_26 :
  assert property (@(posedge id_19) id_10)
  else begin
    id_14 <= "";
    id_25 <= id_26 !=? id_7;
    id_11 = 1;
  end
  wire id_27;
  supply1 id_28 = 1;
  wire id_29;
  module_0(
      id_0, id_2, id_28
  );
  uwire id_30 = id_13;
  assign id_8 = id_28;
endmodule

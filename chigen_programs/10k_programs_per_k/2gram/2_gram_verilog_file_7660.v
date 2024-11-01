// Seed: 2925173182
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input tri id_2,
    input supply1 id_3,
    output supply0 id_4,
    input wire id_5,
    output supply0 id_6,
    input supply1 id_7,
    input tri1 id_8,
    input supply1 id_9,
    output uwire id_10,
    input wire id_11,
    input uwire id_12,
    input uwire id_13,
    output wor id_14,
    output wand id_15,
    output supply0 id_16,
    input supply0 id_17,
    input tri1 id_18,
    input supply1 id_19,
    input uwire id_20,
    output tri0 id_21,
    input tri0 id_22,
    input tri0 id_23
    , id_25
);
  id_26(
      .id_0(1'b0)
  );
endmodule
module module_1 (
    input tri1 id_0,
    output tri1 id_1,
    output tri0 id_2,
    input wand id_3,
    input uwire id_4,
    input supply1 id_5,
    input wand id_6
);
  wire id_8;
  module_0(
      id_6,
      id_5,
      id_5,
      id_0,
      id_1,
      id_4,
      id_1,
      id_6,
      id_3,
      id_3,
      id_2,
      id_5,
      id_5,
      id_3,
      id_2,
      id_2,
      id_1,
      id_3,
      id_3,
      id_6,
      id_4,
      id_2,
      id_4,
      id_4
  );
  wand id_9;
  assign id_9 = 1;
  id_10 :
  assert property (@(posedge id_4 or 'b0) 1)
  else;
  assign id_10 = 1;
endmodule

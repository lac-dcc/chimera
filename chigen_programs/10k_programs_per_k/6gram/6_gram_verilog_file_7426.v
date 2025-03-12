// Seed: 3773139355
module module_0 (
    output uwire id_0,
    input supply0 id_1,
    output supply0 id_2,
    input supply1 id_3,
    input supply1 id_4,
    input wor id_5,
    input tri0 id_6,
    input supply1 id_7,
    input tri id_8,
    input tri1 id_9,
    output tri id_10,
    input supply0 id_11,
    input tri1 id_12,
    input supply0 id_13,
    input uwire id_14,
    input supply0 id_15,
    input tri1 id_16,
    input supply1 id_17,
    input uwire id_18,
    input wire id_19,
    output supply0 id_20
);
  id_22 :
  assert property (@(posedge (id_7)) 1 ? id_7 : id_6)
  else $clog2(87);
  ;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    output tri id_2,
    input wand id_3,
    input wire id_4,
    output supply1 id_5
    , id_12,
    input wand id_6,
    input uwire id_7,
    input supply1 id_8,
    input supply1 id_9,
    output tri0 id_10
);
  wire id_13;
  ;
  wire id_14;
  ;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_5,
      id_9,
      id_9,
      id_9,
      id_6,
      id_8,
      id_4,
      id_3,
      id_10,
      id_3,
      id_4,
      id_3,
      id_9,
      id_4,
      id_6,
      id_3,
      id_4,
      id_3,
      id_0
  );
  assign modCall_1.id_0 = 0;
endmodule

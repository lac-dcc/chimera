// Seed: 4223221258
module module_0 (
    output uwire id_0,
    input wire id_1,
    input uwire id_2,
    input supply0 id_3,
    output wire id_4
);
  always
  fork
    @(posedge -1'h0) if (-1'b0) id_0 = id_3 ? id_3 : id_2;
  join
  wire id_6;
  wire id_7;
  wand id_8, id_9, id_10, id_11, id_12;
  assign id_0 = id_8;
endmodule
module module_1 (
    output uwire id_0,
    output wire id_1,
    input wor id_2,
    input supply0 id_3,
    output wire id_4,
    input wand id_5,
    input supply0 id_6,
    input tri0 id_7,
    output uwire id_8,
    input supply1 id_9,
    output wand id_10
);
  wor id_12 = id_3;
  wire id_13, id_14;
  module_0 modCall_1 (
      id_8,
      id_9,
      id_6,
      id_9,
      id_8
  );
  assign modCall_1.type_3 = 0;
  integer id_15, id_16;
endmodule

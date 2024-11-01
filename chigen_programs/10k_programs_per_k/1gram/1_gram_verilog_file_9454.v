// Seed: 1419118854
module module_0 (
    output tri id_0,
    output wand id_1,
    input uwire id_2,
    input wire id_3,
    input wor id_4,
    output uwire id_5,
    input wor id_6,
    input wor id_7,
    input uwire id_8,
    output uwire id_9,
    input uwire id_10,
    input supply0 id_11,
    input tri id_12,
    input tri id_13
    , id_20,
    input supply0 id_14,
    input supply1 id_15,
    input wand id_16,
    input supply1 id_17
    , id_21,
    output supply0 id_18
);
  wire id_22, id_23;
  id_24(
      .id_0(id_10), .id_1(id_16), .id_2(1), .id_3(id_13), .id_4(1), .id_5(id_0), .id_6("")
  );
  assign (highz1, weak0) id_21 = 1'b0;
  wire id_25;
  assign id_21 = 1'b0;
  supply1 id_26, id_27;
  assign id_26 = (1);
  assign id_20 = 1;
endmodule
module module_1 (
    output uwire id_0,
    input supply1 id_1,
    input supply0 id_2,
    output wand id_3,
    input wor id_4,
    output tri0 id_5,
    input wand id_6,
    input wire id_7
    , id_9
);
  assign id_9 = id_6;
  module_0(
      id_3,
      id_9,
      id_1,
      id_9,
      id_4,
      id_3,
      id_6,
      id_1,
      id_7,
      id_0,
      id_9,
      id_9,
      id_7,
      id_1,
      id_1,
      id_1,
      id_2,
      id_4,
      id_9
  );
  assign id_9 = id_6;
endmodule

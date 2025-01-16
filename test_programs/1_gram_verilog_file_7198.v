// Seed: 3903869904
module module_0 (
    input tri id_0,
    input tri id_1,
    input wor id_2,
    input supply0 id_3,
    output tri id_4,
    output wand id_5,
    input wand id_6,
    input wor id_7,
    input uwire id_8,
    output uwire id_9,
    input wand id_10,
    input tri0 id_11
);
  wire id_13;
  logic [7:0][1] id_14;
  wor id_15 = id_10;
  wire id_16, id_17;
  supply1 id_18 = -1'b0;
  assign id_14 = -1;
  wire id_19, id_20;
  id_21(
      -1
  );
  wire id_22;
  wire id_23, id_24;
  wire id_25;
endmodule
module module_1 (
    input uwire id_0,
    output wire id_1,
    input supply0 id_2
);
  assign id_1 = 1;
  logic [7:0] id_4, id_5;
  module_0 modCall_1 (
      id_0,
      id_2,
      id_2,
      id_0,
      id_1,
      id_1,
      id_0,
      id_0,
      id_0,
      id_1,
      id_2,
      id_2
  );
  wire id_6 = id_5[1'h0];
endmodule

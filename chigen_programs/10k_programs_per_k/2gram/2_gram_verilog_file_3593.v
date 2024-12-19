// Seed: 4193884877
module module_0 (
    input tri1 id_0,
    output uwire id_1,
    input supply1 id_2,
    input wor id_3,
    input uwire id_4,
    input tri id_5,
    input tri0 id_6,
    output wor id_7,
    input wor id_8
);
  uwire id_10 = id_0;
  logic [7:0] id_11;
  wire id_12;
  id_13(
      .id_0(id_7)
  );
  wire id_14;
  assign id_11[1] = 1 == 1'b0;
  wire id_15;
  id_16(
      id_0
  );
  wor  id_17;
  wire id_18;
  assign id_17 = 1;
endmodule
module module_1 (
    output supply1 id_0,
    input  supply1 id_1
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_0,
      id_1
  );
endmodule

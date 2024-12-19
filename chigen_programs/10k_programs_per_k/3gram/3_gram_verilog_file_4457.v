// Seed: 1631707863
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  assign id_2 = 1;
  assign module_2.id_9 = 0;
  assign module_1.type_12 = 0;
endmodule
module module_1 (
    output uwire id_0,
    input supply0 id_1,
    input tri id_2,
    input supply0 id_3,
    input wor id_4,
    input wand id_5,
    input supply1 id_6,
    input uwire id_7,
    input supply1 id_8
);
  assign id_0 = 1 - id_2;
  wire id_10;
  module_0 modCall_1 (
      id_10,
      id_10
  );
endmodule
module module_2 (
    input wor id_0
    , id_15,
    output wire id_1,
    input tri id_2,
    output wire id_3,
    input uwire id_4,
    input supply0 id_5,
    output uwire id_6,
    input uwire id_7,
    input wor id_8
    , id_16,
    input wor id_9
    , id_17,
    input uwire id_10,
    input tri0 id_11,
    input wor id_12,
    input wire id_13
);
  wire id_18;
  assign id_1 = id_16;
  wire id_19;
  module_0 modCall_1 (
      id_19,
      id_19
  );
  id_20(
      .id_0(id_0), .id_1(id_13), .id_2()
  );
  or primCall (
      id_6, id_2, id_7, id_11, id_8, id_17, id_16, id_5, id_4, id_15, id_18, id_0, id_12, id_9
  );
endmodule

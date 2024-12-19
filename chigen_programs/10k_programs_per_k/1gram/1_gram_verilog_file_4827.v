// Seed: 151726120
module module_0 (
    input supply0 id_0,
    input wor id_1,
    input wire id_2,
    input tri0 id_3,
    output wand id_4,
    input supply0 id_5,
    input tri1 id_6,
    input uwire id_7,
    output tri1 id_8
);
  assign id_4 = id_1;
  assign id_8 = id_6;
  assign id_4 = 1 + id_5;
  always #1 begin : LABEL_0
    @(posedge 1'b0) id_8 = 1;
  end
  wire id_10, id_11, id_12;
  wire id_13;
  wire id_14, id_15, id_16;
  wire id_17;
  wire id_18;
  assign module_1.type_4 = 0;
  id_19(
      .id_0(1), .id_1(id_13)
  );
endmodule
module module_1 (
    output uwire id_0,
    output tri0 id_1,
    input wire id_2,
    output supply1 id_3,
    output supply1 id_4,
    input wand id_5,
    input uwire id_6,
    input uwire id_7,
    input tri id_8
);
  wire id_10, id_11, id_12;
  module_0 modCall_1 (
      id_7,
      id_2,
      id_7,
      id_7,
      id_1,
      id_6,
      id_2,
      id_6,
      id_1
  );
endmodule

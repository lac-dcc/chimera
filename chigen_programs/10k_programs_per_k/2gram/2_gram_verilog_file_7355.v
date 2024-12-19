// Seed: 2088244336
module module_0 (
    input wor   id_0
    , id_4,
    input uwire id_1,
    input uwire id_2
);
  assign id_4 = 1;
endmodule
module module_1 (
    input wor id_0,
    output wor id_1,
    input uwire id_2,
    input uwire id_3,
    input tri id_4,
    input wand id_5,
    input wire id_6
    , id_15,
    output logic id_7,
    input uwire id_8,
    input uwire id_9,
    input uwire id_10,
    input logic id_11,
    input logic id_12,
    input supply0 id_13
);
  assign id_15 = id_11;
  always id_7 <= id_12;
  assign id_7 = 1;
  final @(id_15) id_7 = #1{1, id_0 - id_11};
  tri id_16;
  or primCall (id_1, id_17, id_8, id_11, id_9, id_16, id_0);
  assign id_16 = 1;
  wire id_17;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_3
  );
  assign modCall_1.id_0 = 0;
  specify
    $setup(id_18, posedge id_19, 'b0);
  endspecify
endmodule

// Seed: 4026198596
module module_0 (
    input tri0 id_0,
    input wand id_1,
    input supply0 id_2
    , id_8,
    output wire id_3,
    input wand id_4,
    input uwire id_5,
    input supply0 id_6
);
  id_9(
      .id_0(1), .id_1(id_5 == id_6), .id_2(1), .id_3(1)
  );
  assign id_3#(.id_6(1)) = id_4;
endmodule
module module_1 (
    output logic id_0,
    output supply1 id_1,
    input tri1 id_2,
    input wire id_3
    , id_5
);
  always @(id_2 < 1'b0 or posedge id_3) id_0 <= 1;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_2,
      id_1,
      id_3,
      id_3,
      id_2
  );
  assign modCall_1.type_11 = 0;
  wire id_6;
  assign id_0 = 0;
endmodule

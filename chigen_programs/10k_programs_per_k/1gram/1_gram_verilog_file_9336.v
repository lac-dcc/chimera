// Seed: 3398199120
module module_0;
  assign id_1 = 1;
  assign module_2.type_2 = 0;
endmodule
module module_1 (
    input supply0 id_0,
    input wire id_1,
    input tri0 id_2,
    input supply1 id_3,
    input uwire id_4,
    input tri1 id_5
    , id_9,
    output tri1 id_6,
    output wand id_7
);
  id_10(
      .id_0(id_0), .id_1(), .id_2(id_0), .id_3(1), .id_4(id_2)
  );
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input logic id_0,
    input supply0 id_1,
    input wor id_2,
    output logic id_3,
    input wor id_4,
    input logic id_5,
    input logic id_6,
    input wor id_7
);
  wire id_9;
  module_0 modCall_1 ();
  always #id_10 id_3 <= id_0;
  assign id_3 = 1 ? id_5 : id_6;
  nor primCall (id_3, id_4, id_5, id_6, id_7, id_9);
  assign id_3 = id_10;
endmodule

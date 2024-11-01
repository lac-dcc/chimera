// Seed: 1291258393
module module_0 (
    input tri1 id_0,
    output tri0 id_1,
    input supply0 id_2,
    input wire id_3,
    input wire id_4,
    input wire id_5,
    input wand id_6,
    input uwire id_7
    , id_9
);
  assign id_9 = 1;
  id_10(
      .id_0(id_5), .id_1(), .id_2(id_4), .id_3(1'h0), .id_4(1), .id_5(1)
  );
  wire id_11;
  wire id_12;
endmodule
module module_1 (
    output wor id_0,
    input tri1 id_1,
    output wand id_2,
    input supply0 id_3,
    input wor id_4,
    input wor id_5,
    input tri1 id_6,
    output wand id_7
);
  wire id_9;
  module_0(
      id_3, id_2, id_1, id_3, id_5, id_3, id_6, id_1
  );
  assign id_0 = 1 && id_3;
  id_10(
      .id_0(id_0), .id_1(id_0), .id_2(id_4), .id_3(id_2 > (1'b0))
  );
endmodule

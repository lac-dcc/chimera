// Seed: 1406519508
module module_0 (
    output tri0 id_0
);
  wire id_2;
  wire id_3, id_4, id_5, id_6, id_7, id_8, id_9;
  wire id_10;
  supply0 id_11 = 1;
  wire id_12;
  assign id_2 = id_10;
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    output supply1 id_2,
    input wire id_3
);
  module_0(
      id_2
  );
endmodule
module module_2 (
    input  uwire id_0,
    input  wire  id_1,
    output wor   id_2,
    input  wand  id_3,
    output logic id_4
);
  always begin
    id_4 <= 1'd0;
  end
  module_0(
      id_2
  );
  assign id_4 = 1;
  id_6(
      .id_0(1),
      .id_1(id_2 && 1),
      .id_2(1),
      .id_3(id_1),
      .id_4(id_0 + 1),
      .id_5(id_0),
      .id_6(1'd0),
      .id_7(1'b0),
      .id_8(id_1),
      .id_9(id_4),
      .id_10(1 - id_4 == id_4),
      .id_11(1'h0)
  );
endmodule

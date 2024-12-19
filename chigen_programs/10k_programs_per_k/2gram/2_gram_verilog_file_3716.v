// Seed: 3909499190
module module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  assign id_1 = 1;
  always cover (id_4);
  assign id_4 = id_3;
  wire id_5, id_6, id_7;
  assign id_4 = id_5;
endmodule
module module_1;
  wire id_1 = id_1;
  wire id_2;
  assign id_1 = id_1;
  reg id_3;
  assign id_2 = id_2;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_4
  );
  initial begin : LABEL_0
    id_3 <= 1;
  end
endmodule
module module_2 (
    input tri id_0,
    input uwire id_1,
    input supply1 id_2,
    input wor id_3,
    input tri1 id_4,
    output wor id_5,
    input tri1 id_6,
    input uwire id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9
  );
  id_10(
      .id_0((1'd0)),
      .id_1(1 - id_6),
      .id_2(id_4),
      .id_3(id_6),
      .id_4(1'b0 && 1),
      .id_5(id_1),
      .id_6(id_6),
      .id_7(1),
      .id_8(id_1 ^ id_1 ^ 1),
      .id_9(id_1)
  );
  xnor primCall (id_5, id_7, id_9, id_6, id_2, id_3);
endmodule

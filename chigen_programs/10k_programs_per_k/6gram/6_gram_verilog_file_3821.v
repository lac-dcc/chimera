// Seed: 3005308230
module module_0 (
    input supply0 id_0,
    input wand id_1,
    input wor id_2,
    output supply0 id_3,
    input wor id_4,
    input wor id_5,
    input uwire id_6,
    input wand id_7,
    input tri id_8,
    input wand id_9,
    output tri1 id_10
    , id_12
);
  id_13(
      .id_0(id_3),
      .id_1(1'h0),
      .id_2(1),
      .id_3(id_0),
      .id_4(),
      .id_5(id_4),
      .id_6(1),
      .id_7(id_9),
      .id_8(1),
      .id_9(1)
  );
  assign module_1.type_15 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output logic id_1,
    input tri0 id_2,
    input tri1 id_3,
    input tri0 id_4,
    input uwire id_5,
    input tri1 id_6,
    input logic id_7,
    output supply1 id_8,
    input tri0 id_9
    , id_12,
    output tri0 id_10
);
  wire id_13;
  initial begin : LABEL_0
    id_12 <= 1;
    id_1  <= 1;
    $display(id_2);
    #1;
  end
  assign id_12 = id_7;
  module_0 modCall_1 (
      id_2,
      id_5,
      id_6,
      id_8,
      id_2,
      id_9,
      id_9,
      id_9,
      id_6,
      id_5,
      id_10
  );
endmodule

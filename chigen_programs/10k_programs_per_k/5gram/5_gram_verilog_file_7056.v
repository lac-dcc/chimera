// Seed: 3070055324
module module_0 (
    id_1
);
  input wire id_1;
  wor id_2;
  assign id_2 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  always @* begin : LABEL_0
    id_5 <= id_3;
  end
  module_0 modCall_1 (id_2);
  assign modCall_1.id_2 = 0;
  wire id_11;
  or primCall (id_2, id_7, id_8, id_4, id_3);
  logic [7:0] id_12 = id_7;
  integer id_13 (
      .id_0 (id_5),
      .sum  (id_4),
      .id_1 ((1'h0)),
      .id_2 (id_11),
      .id_3 (id_12[1]),
      .id_4 (1'b0),
      .id_5 (1),
      .id_6 (id_10),
      .id_7 (1),
      .id_8 (1),
      .id_9 (id_4),
      .id_10((id_9)),
      .id_11()
  );
  specify
    (id_14 => id_15) = 1;
  endspecify
endmodule

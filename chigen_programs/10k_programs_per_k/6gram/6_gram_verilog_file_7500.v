// Seed: 535763886
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_4 = 1;
  supply0 id_7;
  tri0 id_8;
  wire id_9;
  assign module_1.id_2 = 0;
  wire id_10;
  wire id_11;
  generate
    for (id_12 = id_5; id_8 !=? 1; id_7 = id_8) begin : LABEL_0
      id_13(
          .id_0(id_10), .id_1(1 - id_6), .id_2(1), .id_3(1'h0), .id_4(id_5)
      );
    end
  endgenerate
  id_14(
      .id_0(1)
  );
endmodule
module module_1 (
    output wor id_0,
    output wand id_1,
    output wire id_2,
    input wire id_3,
    output supply0 id_4
);
  wire id_6;
  not primCall (id_2, id_6);
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule

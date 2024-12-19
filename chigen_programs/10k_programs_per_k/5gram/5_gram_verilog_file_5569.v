// Seed: 3257040714
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  tri0 id_6;
  always @(posedge 1 == id_6) begin : LABEL_0
    if (id_4 | id_1) disable id_7;
    else for (id_6 = id_3 & id_7 == 1; id_7 < 1; id_2 = id_6) @(1);
  end
  wire id_8;
  wand id_9 = id_6;
  assign id_2 = {1, 1};
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1), .id_1(id_1), .id_2(id_1)
  );
  module_0 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_3,
      id_3
  );
  assign modCall_1.id_2 = 0;
endmodule

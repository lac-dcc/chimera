// Seed: 4099063311
module module_0 (
    output tri  id_0,
    output wand id_1
);
  assign id_1 = (id_3);
  assign id_0 = 1;
  assign module_1.type_10 = 0;
  id_4(
      .id_0(id_3), .id_1(id_1), .id_2(id_3)
  );
endmodule
module module_1 (
    output tri   id_0,
    output tri   id_1,
    output uwire id_2,
    input  wor   id_3
);
  wire id_5;
  module_0 modCall_1 (
      id_0,
      id_2
  );
  wire id_6;
  wire id_7;
endmodule
module module_2 (
    input tri   id_0,
    input tri   id_1,
    input logic id_2
);
  always @(id_1 == 1 or id_0) id_4 <= 1;
  for (id_5 = 1; id_1; id_4 = 1) begin : LABEL_0
    reg id_6;
    assign id_4 = id_6;
  end
  wire id_7;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  assign modCall_1.id_1 = 0;
  always @(posedge id_7) id_4 <= id_2;
endmodule

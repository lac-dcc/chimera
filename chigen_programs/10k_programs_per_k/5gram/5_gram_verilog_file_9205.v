// Seed: 3503353108
module module_0 (
    output supply1 id_0,
    output supply1 id_1,
    output wand id_2,
    input tri0 id_3,
    input tri1 id_4,
    output wire id_5,
    output tri1 id_6,
    output tri0 id_7,
    input supply1 id_8
    , id_15,
    output wand id_9,
    input wire id_10,
    input uwire id_11,
    output uwire id_12,
    output tri0 id_13
);
  assign id_9 = !id_3 == id_10;
  assign id_1 = id_8;
endmodule
module module_1 (
    input  uwire id_0,
    output wor   id_1,
    input  uwire id_2,
    output logic id_3,
    input  wor   id_4
);
  always @(posedge id_4) begin : LABEL_0
    disable id_6;
    id_3 <= 1'b0;
  end
  uwire id_7 = 1;
  assign id_3 = id_7 || 1 || id_2;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_2,
      id_6,
      id_1,
      id_1,
      id_1,
      id_2,
      id_6,
      id_0,
      id_2,
      id_1,
      id_1
  );
  assign modCall_1.type_20 = 0;
  wire id_8;
  wire id_9;
  assign id_7 = 1;
  tri id_10 = 1;
  id_11(
      .id_0(id_0), .id_1(!id_7), .id_2(1)
  );
endmodule

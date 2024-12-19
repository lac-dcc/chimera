// Seed: 2419850708
module module_0 (
    input  uwire id_0,
    input  tri0  id_1,
    input  wor   id_2,
    output tri   id_3,
    input  wor   id_4,
    input  wor   id_5,
    input  uwire id_6
    , id_9,
    output wire  id_7
);
  wire id_10;
  assign module_1.type_6 = 0;
  always @(posedge {id_2,
    1
  })
  begin : LABEL_0
    @(posedge 1 == id_0 or negedge id_2);
    $display(id_10);
  end
endmodule
module module_1 (
    output wor id_0,
    input tri0 id_1,
    input supply1 id_2,
    input wire id_3,
    input wand id_4,
    output tri0 id_5,
    input wand id_6,
    inout tri1 id_7,
    output uwire id_8,
    output tri id_9,
    input tri0 id_10
);
  always disable id_12;
  module_0 modCall_1 (
      id_10,
      id_4,
      id_4,
      id_5,
      id_6,
      id_12,
      id_4,
      id_7
  );
  id_13(
      .id_0({1 + id_1, id_10, id_4, id_12}), .id_1(id_12), .id_2(id_5)
  );
endmodule

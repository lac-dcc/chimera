// Seed: 1515201673
module module_0 (
    input tri id_0,
    input wire id_1,
    input wire id_2,
    output tri1 id_3,
    input tri0 id_4,
    output supply1 id_5,
    input wire id_6,
    input wire id_7,
    input tri1 id_8,
    input tri id_9
);
  assign id_3 = 1;
endmodule
module module_1 (
    input  uwire id_0,
    input  wire  id_1,
    input  wand  id_2,
    output uwire id_3
);
  always @(*) begin : LABEL_0
    assign id_3 = id_1;
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_3,
      id_2,
      id_3,
      id_2,
      id_1,
      id_2,
      id_0
  );
  assign modCall_1.id_0 = 0;
  wire id_5, id_6;
  not primCall (id_3, id_1);
endmodule

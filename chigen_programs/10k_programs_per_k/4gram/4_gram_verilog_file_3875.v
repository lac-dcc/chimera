// Seed: 2598963383
module module_0 (
    input supply0 id_0,
    output wire id_1
    , id_8,
    input wor id_2,
    output tri1 id_3,
    input wire id_4,
    input supply0 id_5,
    output supply0 id_6
);
  wire id_9;
  assign module_2.id_1 = 0;
endmodule
module module_1 (
    output supply1 id_0,
    input wor id_1
);
  assign id_0 = id_1;
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    output tri1 id_0,
    input  wand id_1
);
  reg id_3;
  logic [7:0] id_4;
  always @(posedge 1 or posedge -1) begin : LABEL_0
    id_3 <= id_4[-1];
  end
  module_0 modCall_1 (
      id_1,
      id_0,
      id_1,
      id_0,
      id_1,
      id_1,
      id_0
  );
  wire [-1 : -1] id_5;
endmodule

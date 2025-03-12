// Seed: 135359234
module module_0 (
    input tri id_0,
    input tri1 id_1,
    output tri id_2,
    output tri1 id_3,
    input supply0 id_4,
    output uwire id_5,
    output supply0 id_6,
    input tri1 id_7,
    output supply0 id_8,
    input uwire id_9,
    output supply0 id_10
);
  always disable id_12;
  module_2 modCall_1 (
      id_10,
      id_4,
      id_9,
      id_5,
      id_1,
      id_5,
      id_5,
      id_7
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output wand id_1,
    input  wand id_2
);
  wire id_4;
  ;
  logic id_5;
  ;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_0,
      id_0,
      id_2,
      id_1,
      id_0,
      id_2,
      id_1,
      id_2,
      id_1
  );
  assign modCall_1.id_0 = 0;
endmodule
module module_2 (
    output tri id_0,
    input supply0 id_1,
    input tri id_2,
    output supply0 id_3,
    input supply0 id_4,
    output tri1 id_5,
    output tri1 id_6,
    input wire id_7
);
  always_latch @(posedge id_4 or negedge id_4) begin : LABEL_0
    disable id_9;
  end
  assign id_3 = id_1;
endmodule

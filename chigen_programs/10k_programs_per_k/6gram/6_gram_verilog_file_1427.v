// Seed: 3090089248
module module_0 (
    input supply1 id_0,
    output tri0 id_1,
    output tri1 id_2,
    output tri id_3,
    output uwire id_4
);
  wire id_6;
  ;
  assign module_1.id_5 = 0;
endmodule
module module_1 (
    input uwire id_0
    , id_7,
    output supply0 id_1,
    input wire id_2,
    input uwire id_3,
    inout tri0 id_4,
    output wire id_5
);
  assign id_5 = id_3;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_5,
      id_1,
      id_5
  );
endmodule
module module_2 (
    output uwire id_0,
    input  tri1  id_1,
    input  tri1  id_2,
    input  tri   id_3,
    output uwire id_4,
    output tri   id_5
);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_0,
      id_5,
      id_0
  );
  assign modCall_1.id_0 = 0;
  logic [7:0] id_7;
  assign id_7[1] = -1'b0 < 1;
  assign id_7 = (id_1);
  assign id_7[-1'b0] = 1;
  always @(-1'b0 or id_3) begin : LABEL_0
    $unsigned(98);
    ;
  end
endmodule

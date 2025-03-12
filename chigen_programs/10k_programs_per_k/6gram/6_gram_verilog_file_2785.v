// Seed: 328506166
module module_0 (
    input  tri0 id_0,
    input  wire id_1,
    output wire id_2
);
  logic id_4 = id_1;
  always @(id_0 or negedge 1) begin : LABEL_0
    id_4 <= id_4 > -1;
  end
  assign module_2.id_0 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    output supply0 id_1,
    input uwire id_2,
    input tri0 id_3,
    output wire id_4,
    input tri1 id_5
);
  wire id_7;
  module_0 modCall_1 (
      id_3,
      id_5,
      id_4
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    input supply0 id_0,
    output tri1 id_1,
    input tri1 id_2,
    input wor id_3,
    output wire id_4
);
  wire id_6;
  ;
  not primCall (id_1, id_6);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_1
  );
endmodule

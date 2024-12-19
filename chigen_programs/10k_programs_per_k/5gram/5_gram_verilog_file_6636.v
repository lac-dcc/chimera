// Seed: 3708029859
module module_0 (
    input tri0 id_0,
    input tri0 id_1
);
  wire id_3 = 1'h0;
  wire id_4;
endmodule
module module_1 (
    output wand  id_0,
    input  wand  id_1,
    output uwire id_2,
    output tri0  id_3
);
  always @(1, id_1)
    if (id_1) begin : LABEL_0
      wait (1'b0 == 1 & id_1);
    end
  buf primCall (id_2, id_1);
  module_0 modCall_1 (
      id_1,
      id_1
  );
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    input  uwire id_0,
    output tri1  id_1,
    output logic id_2,
    input  tri1  id_3,
    input  tri1  id_4,
    input  wor   id_5,
    input  wire  id_6
);
  always @(1'b0 or posedge id_4) begin : LABEL_0
    #1;
    id_2 <= 1 == 1'b0;
  end
  module_0 modCall_1 (
      id_3,
      id_5
  );
  assign modCall_1.id_0 = 0;
  wire id_8;
endmodule

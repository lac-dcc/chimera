// Seed: 4214261831
module module_0 ();
  assign id_1 = 1;
endmodule
module module_1 (
    input  wor  id_0,
    output wor  id_1,
    input  wire id_2
);
  assign id_1 = id_0 / 1;
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  always @(id_7 or 1) begin : LABEL_0
    if (id_1) id_4 <= 1;
    else begin : LABEL_0
      if (1) id_4 = id_8[1'b0];
      else id_7 <= #id_7 id_3;
    end
  end
  nor primCall (id_2, id_3, id_6, id_7, id_8, id_9);
  module_0 modCall_1 ();
  assign modCall_1.id_1 = 0;
endmodule

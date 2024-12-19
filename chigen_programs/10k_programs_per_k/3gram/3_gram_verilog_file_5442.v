// Seed: 2887188033
macromodule module_0 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  supply1 id_4 = 1'd0, id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  wire id_9;
  supply1 id_10;
  always
    if (1 + id_4) begin : LABEL_0
      id_10 = id_5;
      id_10 = id_1 == id_3 && 1 && 1'h0;
      id_7 <= 1'b0;
    end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_5
  );
  wire id_11;
endmodule

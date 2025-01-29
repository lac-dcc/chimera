// Seed: 3815995289
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  supply0 id_5;
  always begin : LABEL_0
    id_2 <= -1;
    #(1) wait (-1) @(posedge id_3);
  end
  logic [7:0] id_6;
  assign id_2 = 1;
  assign id_5 = id_3 * -1;
  final $display;
  supply1 id_7;
  generate
    begin : LABEL_0
      assign id_6[-1] = -1;
      always id_2 = #1 id_1;
      assign id_3 = 1;
    end
  endgenerate
  assign id_3 = id_3 == id_7;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_7,
      id_3
  );
endmodule

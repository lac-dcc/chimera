// Seed: 2850676446
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_3 = id_4 & 1'b0;
  wire id_11;
  assign id_1 = 1;
  wire id_12;
  always @(id_11) begin : LABEL_0
    fork
      #(id_11) id_5 = id_6 > 1;
    join
  end
endmodule
module module_1 (
    input tri1 id_0,
    output tri id_1,
    input supply1 id_2,
    input tri1 id_3,
    output wire id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6,
      id_6
  );
  always @(posedge 1 or posedge 1) $display(1'b0);
  wire id_7 = id_0;
  assign id_4 = id_3;
endmodule

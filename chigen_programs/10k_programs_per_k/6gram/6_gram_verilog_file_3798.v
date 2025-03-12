// Seed: 101953238
module module_0 #(
    parameter id_6 = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  logic id_5;
  logic _id_6 = id_2;
  assign module_1.id_6 = 0;
  wire id_7;
  parameter id_8 = 1;
  assign id_5[id_6] = "";
endmodule
module module_1 (
    input tri1 id_0,
    input wand id_1,
    input supply1 id_2,
    input wire id_3,
    output tri1 id_4
    , id_6
);
  assign id_6 = 1;
  wire id_7;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_7,
      id_7
  );
  always @(id_3 or negedge id_6) begin : LABEL_0
    id_6 = #id_8 id_7;
  end
endmodule

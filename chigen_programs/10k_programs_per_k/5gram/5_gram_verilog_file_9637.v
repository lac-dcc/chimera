// Seed: 2916473444
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_8;
  specify
    (negedge id_9 => (id_10 -: id_4)) = (1'b0, -1'b0);
    if (id_10) (posedge id_11 *> (id_12 +: id_12)) = (id_9, -1);
    specparam id_13 = 1;
  endspecify
endmodule
module module_1 (
    input tri1 id_0,
    output wire id_1,
    output uwire id_2,
    output uwire id_3,
    output tri0 id_4,
    input wand id_5,
    input wire id_6,
    input tri id_7,
    output logic id_8,
    output supply1 id_9,
    input tri id_10
);
  always_comb @(negedge -1 - id_5 or negedge (-1)) begin : LABEL_0
    id_8 <= 1'b0;
  end
  assign id_1 = {1, -1 != (1'b0), -1 < 1, id_6} ? id_6 + id_5 : id_5;
  logic id_12;
  ;
  wire id_13;
  module_0 modCall_1 (
      id_12,
      id_12,
      id_13,
      id_13,
      id_12,
      id_13,
      id_12
  );
endmodule

// Seed: 3191236640
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout tri id_3;
  output wire id_2;
  output tri id_1;
  assign id_3 = 1'h0;
  always_comb @(id_4 or posedge id_5) begin : LABEL_0
    assert (-1);
  end
  assign id_1 = id_5 !== id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  module_0 modCall_1 (
      id_1,
      id_3,
      id_5,
      id_3,
      id_3,
      id_4
  );
  output wire id_1;
  assign id_3 = id_2;
  always_latch @(posedge id_3);
endmodule

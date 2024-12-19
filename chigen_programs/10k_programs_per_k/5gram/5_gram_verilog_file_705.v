// Seed: 2549513114
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
endmodule
module module_1 (
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
  inout wire id_10;
  output wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  supply1 id_11 = 1;
  nor primCall (id_7, id_3, id_6, id_8, id_5, id_4, id_1, id_10, id_11);
  module_0 modCall_1 (
      id_4,
      id_3
  );
  id_12(
      .id_0(1), .id_1(id_8)
  );
  always @(posedge 1'b0) begin : LABEL_0
    id_11 = 1;
    id_7 <= id_8;
  end
endmodule

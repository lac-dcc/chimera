// Seed: 1055434521
module module_0 ();
  id_1(
      .id_0(id_2), .id_1(1)
  );
  wire id_3;
  assign module_1.id_8 = 0;
  supply0 id_4;
  assign id_2 = id_4 == 1'b0;
  tri id_5 = 1;
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16
);
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  output wire id_11;
  inout wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_11 = id_1[1];
  always @(1'd0) $display;
  assign id_2 = id_8 == id_14;
  module_0 modCall_1 ();
  always @(posedge id_8, posedge 1) id_13 <= #1{(1 - id_13 & 1'h0) {1}};
endmodule

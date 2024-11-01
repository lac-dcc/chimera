// Seed: 3815502591
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
    id_10,
    id_11,
    id_12,
    id_13,
    id_14,
    id_15,
    id_16,
    id_17
);
  inout wire id_17;
  inout wire id_16;
  input wire id_15;
  input wire id_14;
  inout wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_18;
  always @(posedge 1) id_11 = 1'b0;
  final $display(id_15);
  assign id_18 = id_14;
  assign id_1  = 1;
  assign id_2  = !1;
  wire id_19;
endmodule
module module_1 (
    output supply1 id_0,
    output wor id_1,
    input wand id_2,
    output wor id_3,
    input wor id_4
);
  assign id_1 = id_4;
  uwire id_6;
  reg   id_7;
  id_8 :
  assert property (@(negedge 1) 1)
  else begin
    id_7 <= 1 - id_6;
  end
  assign id_8 = id_8 ^ 1;
  reg id_9 = id_7;
  supply1 id_10 = id_6;
  wire id_11;
  module_0(
      id_11,
      id_11,
      id_11,
      id_11,
      id_8,
      id_11,
      id_10,
      id_8,
      id_10,
      id_10,
      id_10,
      id_8,
      id_6,
      id_11,
      id_8,
      id_6,
      id_10
  );
endmodule

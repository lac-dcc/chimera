// Seed: 1349080417
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
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_8 = 1'h0;
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
    id_14
);
  output wire id_14;
  input wire id_13;
  output wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always_comb @(posedge 1) begin
    id_11 <= |id_4;
  end
  assign id_5 = 1;
  wire id_15;
  wire id_16;
  module_0(
      id_16, id_9, id_15, id_3, id_10, id_10, id_12, id_4, id_15, id_16, id_16, id_8, id_6
  );
  reg id_17 = 1;
  always @(posedge 1'b0 or posedge id_7 ? id_3 : 1);
  always_latch #id_18 id_17 <= (id_13 - id_8);
  id_19(
      1'b0
  );
endmodule

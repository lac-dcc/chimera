// Seed: 3302729227
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  supply0 id_10;
  assign #1 id_10 = id_6;
  assign id_1 = 1 ? id_3 : 1 ? 1 - id_3 : id_10;
  wire id_11;
  supply0 id_12 = 1;
  assign id_5 = 1'h0;
  always force id_7 = id_8 - id_5;
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
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always @(negedge 1'b0 + id_1) begin
    disable id_9;
  end
  module_0(
      id_3, id_6, id_6, id_2, id_4, id_5, id_6, id_7, id_4
  );
endmodule

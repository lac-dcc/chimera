// Seed: 1251111246
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always_ff @(negedge id_5) begin
    assert (1 - !id_5);
  end
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
    id_9
);
  input wire id_9;
  inout wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_10;
  module_0(
      id_7, id_6, id_10, id_10, id_9
  );
  assign id_7 = 1'h0;
  assign id_8#(.id_8(id_3 ^ id_7)) = 1;
endmodule

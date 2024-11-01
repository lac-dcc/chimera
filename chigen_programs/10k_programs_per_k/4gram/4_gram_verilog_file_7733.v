// Seed: 3623237011
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always_latch @(id_1 or posedge id_1) begin
    if (1'b0) id_2 <= 1'b0;
    else id_2 <= #1 id_1;
  end
  assign id_1 = 1;
  wire id_4;
  module_0(
      id_4, id_4, id_4, id_4, id_4, id_4, id_4
  );
endmodule

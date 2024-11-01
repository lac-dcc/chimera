// Seed: 3018084154
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_2 & 1;
  wor id_5 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2[(1)] = id_4;
  wire id_5;
  module_0(
      id_1, id_4, id_5, id_5
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_1;
  module_0(
      id_2, id_3, id_2, id_2
  );
  always @(1'b0 or negedge 1'b0) begin
    id_4 <= 1;
  end
endmodule

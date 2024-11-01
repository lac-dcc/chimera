// Seed: 2472128118
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  logic [7:0] id_6;
  assign id_6[1'h0] = 1'b0;
endmodule
module module_1;
  assign id_1 = $display;
  module_0(
      id_1, id_1, id_1, id_1, id_1
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_6 = 1'b0;
  module_0(
      id_4, id_1, id_3, id_4, id_6
  );
  always @(posedge id_5) begin
    if (id_3) begin
      id_2[1'b0] = id_6 - id_3;
    end
  end
endmodule

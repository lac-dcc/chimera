// Seed: 2706089540
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  wire id_3;
  always_latch @(1 or id_1) begin
    id_1 <= 1;
    #1 begin
      $display(1'h0, 1);
    end
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
    id_8
);
  input wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  always @(negedge (id_2 | 1)) id_1 <= id_3;
  module_0(
      id_3, id_6
  );
endmodule

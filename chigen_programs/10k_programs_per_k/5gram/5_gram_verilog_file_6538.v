// Seed: 2180142816
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
  inout wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
  wire id_10;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_6) $display(id_6 == 1'd0);
  always_latch #1 begin
    id_5 <= ~id_1;
    id_3 <= id_6;
  end
  final $display(1);
  module_0(
      id_1, id_1, id_1, id_1, id_1, id_1, id_1
  );
endmodule

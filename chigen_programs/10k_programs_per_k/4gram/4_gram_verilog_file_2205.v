// Seed: 1931230684
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  initial begin
    id_3 <= 1;
    deassign id_3.id_1;
  end
  pullup (id_2, id_1);
  initial begin
    id_4 <= ~id_2;
    id_4 <= id_2;
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
    id_9,
    id_10,
    id_11
);
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(id_1 - 1) begin
    id_4 <= id_2;
    #1 $display;
  end
  module_0(
      id_2, id_2
  );
  nand (id_7, id_3, id_2, id_6, id_5, id_9, id_1, id_11);
endmodule

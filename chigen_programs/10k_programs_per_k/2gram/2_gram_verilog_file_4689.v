// Seed: 2798647866
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  task id_9;
    id_7 = id_9;
  endtask
  wire id_10;
  wire id_11;
  initial begin
    $display(id_9);
  end
  assign id_2 = 1;
endmodule
module module_1 #(
    parameter id_6 = 32'd35,
    parameter id_7 = 32'd21
) (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_5;
  nand (id_1, id_2, id_3, id_4);
  module_0(
      id_4, id_4, id_5, id_4, id_4, id_4, id_1, id_5
  );
  generate
    defparam id_6.id_7 = 1;
  endgenerate
endmodule

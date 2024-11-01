// Seed: 1587916297
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
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  tri0 id_10 = {id_5, 1};
  wire id_11;
  assign id_4#(.id_4(1'h0)) = id_3;
  assign id_4 = 1;
  assign id_3 = 1;
  wire id_12;
  always_latch #1 begin
    $display(id_7 - 1, id_9);
  end
  wire id_13;
  wire id_14;
endmodule
module module_1 #(
    parameter id_6 = 32'd26,
    parameter id_7 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  defparam id_6.id_7 = id_1; module_0(
      id_4, id_2, id_2, id_2, id_4, id_2, id_2, id_2, id_2
  );
endmodule

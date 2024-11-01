// Seed: 3579255499
module module_0 #(
    parameter id_10 = 32'd29,
    parameter id_9  = 32'd31
) (
    input wor id_0,
    input supply0 id_1,
    input tri1 id_2,
    output tri0 id_3,
    output tri0 id_4,
    input wire id_5
);
  wire id_7;
  wire id_8;
  initial $display(id_2);
  assign id_4 = id_2;
  defparam id_9.id_10 = 1 ==? 1;
endmodule
module module_1 (
    input logic id_0,
    input tri id_1,
    input wand id_2,
    input wire id_3,
    input supply1 id_4
    , id_8,
    output wor id_5,
    output wire id_6
);
  assign id_5 = 1;
  module_0(
      id_2, id_2, id_4, id_5, id_6, id_4
  );
  logic id_9;
  always
  fork
    id_8 <= 1;
    id_9 <= 1;
    #1 id_8 = 1;
    id_10(1, id_9);
    @(1'b0 ^ 1);
    $display(id_10);
  join
  assign id_9 = id_0;
  id_11(
      .id_0(id_0), .id_1(id_10)
  );
  wire id_12;
  id_13(
      .id_0(1), .id_1((1))
  );
  always disable id_14;
endmodule

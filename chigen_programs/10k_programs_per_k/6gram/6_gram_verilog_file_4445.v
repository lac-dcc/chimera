// Seed: 3843903125
module module_0 (
    output tri id_0,
    input tri1 id_1,
    input tri0 id_2,
    output wor id_3,
    input supply1 id_4,
    input wire id_5
    , id_8,
    output supply1 id_6
);
  reg id_9;
  always @(1) begin
    id_9 = #id_10 id_8 != 1;
  end
  initial begin
    if (id_4) begin
      $display(1, id_5);
      assert (1);
    end
    fork
      #1;
    join
  end
endmodule
module module_1 (
    output wor id_0,
    input supply1 id_1,
    output wire id_2,
    input wire id_3,
    input wire id_4,
    output supply1 id_5
);
  assign id_2 = 1'b0;
  assign id_0 = id_4;
  module_0(
      id_2, id_4, id_3, id_5, id_1, id_3, id_5
  );
endmodule

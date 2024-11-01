// Seed: 2317393985
module module_0 (
    input tri0 id_0,
    output wand id_1,
    output wand id_2,
    input supply1 id_3,
    output tri0 id_4,
    output tri0 id_5,
    input tri0 id_6,
    input tri1 id_7,
    input tri0 id_8,
    input wire id_9,
    output supply0 id_10,
    input uwire id_11,
    input uwire id_12,
    input wire id_13
);
  id_15 :
  assert property (@(negedge 1) (1'b0))
  else $display(id_12);
endmodule
module module_1 #(
    parameter id_6 = 32'd24,
    parameter id_7 = 32'd22
) (
    input wand  id_0,
    input uwire id_1
);
  wire id_3;
  supply1 id_4 = {1, id_0};
  wire id_5;
  defparam id_6.id_7 = 1;
  wire id_8;
  always_latch @(posedge 1) begin
    deassign id_8;
  end
  module_0(
      id_1, id_4, id_4, id_0, id_4, id_4, id_1, id_4, id_4, id_4, id_4, id_0, id_4, id_4
  );
endmodule

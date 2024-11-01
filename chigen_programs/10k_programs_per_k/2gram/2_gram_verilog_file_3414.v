// Seed: 3462236101
module module_0 (
    input wire id_0,
    output wand id_1,
    output tri id_2,
    input uwire id_3,
    output uwire id_4,
    output wor id_5,
    input wor id_6,
    input supply0 id_7,
    input supply1 id_8,
    input wand id_9
);
  initial
    @(negedge id_3 or posedge id_7) begin
      id_2 = $display;
      $display(id_3, id_9 - 1, id_3);
    end
  id_11(
      .id_0(1 - id_5), .id_1()
  );
  supply1 id_12 = id_3;
endmodule
module module_1 (
    input tri0 id_0,
    input wor id_1,
    input uwire id_2,
    input uwire id_3,
    input wire id_4,
    input wand id_5,
    output supply1 id_6,
    output tri1 id_7,
    output uwire id_8,
    output uwire id_9,
    output tri id_10,
    input wand id_11,
    input wire id_12
);
  uwire id_14;
  wire  id_15;
  uwire id_16 = 1;
  always_ff $display(!id_14);
  generate
    assign id_6 = id_0;
  endgenerate
  module_0(
      id_5, id_10, id_10, id_5, id_9, id_7, id_11, id_4, id_0, id_11
  );
  assign id_7 = id_4;
endmodule

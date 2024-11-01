// Seed: 3831027313
module module_0 (
    input tri1 id_0,
    input wire id_1,
    input supply1 id_2,
    input uwire id_3,
    output supply1 id_4,
    input wor id_5,
    input tri id_6,
    input tri0 id_7,
    input wor id_8,
    output wor id_9,
    input supply1 id_10,
    input tri0 id_11,
    input wor id_12
);
  always_latch @(posedge 1 or negedge id_3) begin
    fork
      id_9 = ~id_8;
      id_4 += 1;
    join
  end
endmodule
module module_1 (
    output wire id_0,
    output logic id_1,
    input supply1 id_2,
    input wand id_3,
    output supply1 id_4,
    output supply1 id_5,
    input logic id_6,
    input uwire id_7,
    output uwire id_8
);
  assign id_8 = 'b0;
  module_0(
      id_3, id_3, id_7, id_3, id_5, id_3, id_7, id_3, id_3, id_0, id_7, id_7, id_7
  );
  assign id_5 = id_7;
  reg id_10 = 1;
  generate
    always #1
      if (1) id_10 <= id_6;
      else begin
        id_1 <= 1;
      end
  endgenerate
endmodule

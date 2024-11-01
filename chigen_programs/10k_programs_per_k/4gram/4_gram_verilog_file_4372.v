// Seed: 3201828888
module module_0 #(
    parameter id_8 = 32'd3,
    parameter id_9 = 32'd33
) (
    output tri1  id_0,
    input  uwire id_1,
    input  wor   id_2,
    output tri1  id_3,
    input  tri   id_4,
    input  uwire id_5,
    output tri   id_6
);
  defparam id_8.id_9 = 1'b0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri id_1,
    input tri1 id_2,
    output supply0 id_3,
    input wand id_4,
    output uwire id_5,
    input tri1 id_6,
    output tri1 id_7,
    output tri1 id_8,
    output wire id_9,
    output uwire id_10,
    inout wor id_11,
    input wire id_12,
    output wand id_13,
    input uwire id_14,
    output wire id_15,
    input supply0 id_16,
    output wire id_17,
    output supply1 id_18
);
  tri id_20;
  always
    if (1) begin
      do
      @(posedge id_14) begin
        disable id_21;
      end
      while (id_20);
    end
  module_0(
      id_15, id_1, id_6, id_13, id_6, id_6, id_13
  );
  if (id_2) begin : id_22
    assign id_11 = 1;
  end else begin
    assign id_10 = id_4;
  end
endmodule

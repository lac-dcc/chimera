// Seed: 968547044
module module_0;
  tri0 id_1, id_2;
  id_3(
      id_1, id_2, 1'b0
  );
endmodule
module module_1;
  logic [7:0] id_1 = id_1[1];
  module_0();
endmodule
module module_2 #(
    parameter id_8 = 32'd97,
    parameter id_9 = 32'd27
) (
    input  wire  id_0,
    input  wand  id_1,
    output wire  id_2,
    output wire  id_3,
    input  uwire id_4,
    output uwire id_5
);
  generate
    if (id_0 == 1) begin : id_7
      assign id_3 = 1;
      defparam id_8.id_9 = (1'b0);
      assign id_2 = 1;
    end else begin
      wire id_10;
    end
  endgenerate
  module_0();
endmodule

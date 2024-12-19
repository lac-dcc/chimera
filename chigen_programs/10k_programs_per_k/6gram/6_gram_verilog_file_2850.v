// Seed: 1886358381
module module_0 #(
    parameter id_8 = 32'd64,
    parameter id_9 = 32'd24
) (
    input uwire id_0,
    input wor id_1,
    output supply1 id_2
);
  wand id_4, id_6, id_7;
  always @(negedge 1) begin : LABEL_0
    id_4 = ~id_0;
  end
  assign module_1.type_0 = 0;
  defparam id_8.id_9 = id_7;
endmodule
module module_1 #(
    parameter id_4 = 32'd21,
    parameter id_5 = 32'd67
) (
    output tri id_0,
    input supply0 id_1,
    output tri0 id_2
);
  defparam id_4.id_5 = 1'b0;
  nor primCall (id_2, id_4, id_1);
  module_0 modCall_1 (
      id_1,
      id_1,
      id_2
  );
endmodule

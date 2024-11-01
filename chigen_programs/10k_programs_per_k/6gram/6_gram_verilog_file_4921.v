// Seed: 164439153
module module_0 (
    input supply0 id_0,
    input tri0 id_1,
    output tri id_2,
    input wand id_3,
    input uwire id_4
);
endmodule
module module_1 #(
    parameter id_10 = 32'd19,
    parameter id_11 = 32'd36
) (
    input tri id_0,
    input supply1 id_1,
    output tri id_2,
    output uwire id_3,
    output logic id_4
);
  tri1 id_6;
  reg  id_7;
  generate
    for (id_8 = id_8; 1; id_6 = id_0) begin : id_9
      defparam id_10.id_11 = 1 - 1;
      assign id_6 = 1;
    end
  endgenerate
  module_0(
      id_1, id_6, id_6, id_0, id_0
  );
  always @(id_0) begin
    id_6 = id_1 == id_8;
    id_4 <= id_7;
    @(posedge 1'd0) $display(1);
  end
endmodule

// Seed: 552718245
module module_0 #(
    parameter id_6 = 32'd80
) (
    input supply1 id_0,
    input wand id_1,
    output uwire id_2,
    input supply0 id_3,
    output uwire id_4
);
  localparam id_6 = ~{1, 1};
  assign module_1.id_3 = 0;
  tri0 id_7 = {1, -1};
  defparam id_6.id_6 = id_6 - -1;
endmodule
module module_1 (
    input tri1 id_0,
    output logic id_1,
    input tri1 id_2,
    input supply1 id_3,
    input supply0 id_4,
    output supply1 id_5
);
  always @(posedge id_3 == id_0) begin : LABEL_0
    id_1 <= {id_4, 1} == 1;
    id_1 <= id_2;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_3,
      id_5
  );
endmodule

// Seed: 51372474
module module_0 ();
  id_1(
      .id_0(1'b0), .id_1(id_2)
  );
endmodule
module module_1 (
    input  tri0  id_0,
    output logic id_1,
    output logic id_2,
    input  uwire id_3,
    inout  wire  id_4,
    output tri1  id_5
);
  generate
    for (id_7 = 1; 1; id_5 = 1) begin : id_8
      always @(posedge id_4 | id_8) begin
        id_8 = id_8 - id_7;
        id_2 <= 1'b0;
        fork
          begin
            id_1 <= 1;
          end
          id_9(1, 1);
        join
      end
    end
  endgenerate
  module_0();
endmodule

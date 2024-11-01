// Seed: 1430817092
module module_0;
  wire id_2;
  reg  id_3;
  always_ff @(id_1)
    if (1) begin
      if (id_3) begin
        id_1 <= id_1;
      end
      id_3 = id_1;
    end
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1
);
  initial begin
    if (id_0) begin
      id_1 <= !id_0;
    end
  end
  module_0();
  wire id_3;
  id_5(
      .id_0(1), .id_1(1 !=? {~id_1, "", id_1}), .id_2(1'd0), .id_3(1)
  );
endmodule

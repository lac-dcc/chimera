// Seed: 300395500
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  input wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_2 = id_4;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  reg id_4 = id_4;
  generate
    if (id_4) begin : id_5
      for (id_6 = 'b0; 1'd0 == id_5 - 1'b0; id_5++) begin : id_7
        always @(*) begin
          id_2 <= id_7;
          if (1) id_4 = 1'b0;
        end
      end
    end
  endgenerate
  module_0(
      id_1, id_3, id_1, id_1
  );
endmodule

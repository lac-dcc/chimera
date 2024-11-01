// Seed: 991990000
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_4 = id_3;
  assign id_4 = id_2;
  generate
    if (id_3) begin : id_5
      id_6(
          .id_0(id_1), .id_1(id_4), .id_2(id_3), .id_3(id_2)
      );
    end else begin
      assign id_4 = id_3;
      assign id_1 = 1'b0;
    end
  endgenerate
endmodule
module module_1;
  assign id_1 = 1'h0;
  assign id_1 = id_1;
  module_0(
      id_1, id_1, id_1, id_1
  );
endmodule

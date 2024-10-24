// Seed: 2527002630
module module_0;
  type_9(
      1, id_0, (1)
  ); type_10(
      1'b0, 1, id_1
  );
  logic id_2;
  always @((id_0), 1) begin
    id_1 = 1 + {1, 1};
  end
  logic id_4, id_5 = 1;
  generate
    if (id_2) begin : id_6
      type_0 id_7 (
          .id_0 (1),
          .id_1 (1'b0),
          .id_2 (1),
          .id_3 (1'b0),
          .id_4 (|id_6 << 1),
          .id_5 (""),
          .id_6 (1'b0),
          .id_7 (1'd0),
          .id_8 (1),
          .id_9 (1),
          .id_10(~id_3)
      );
    end else begin
      assign id_0 = id_5;
    end
  endgenerate
  logic id_8;
endmodule

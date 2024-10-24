// Seed: 2852250338
module module_0;
  logic id_1;
  generate
    if (1) begin
      always @(posedge 1) begin
        #1 id_1 = id_1 - 1;
      end
    end else begin : id_2
      integer id_3 (
          .id_0 (1 - 1),
          .id_1 (),
          .id_2 (id_2),
          .id_3 (),
          .id_4 (id_1),
          .id_5 (id_1),
          .id_6 (1'b0),
          .id_7 (~id_2),
          .id_8 (1),
          .id_9 (1),
          .id_10(1),
          .id_11(1'd0 & 1),
          .id_12(1)
      );
    end
  endgenerate
  assign id_1 = 1;
  defparam id_4.id_5 = 1;
endmodule

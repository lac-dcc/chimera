// Seed: 2802038631
module module_0 (
    output reg id_0,
    output reg id_1,
    output reg id_2,
    input reg id_3,
    input id_4,
    input id_5
);
  generate
    if (id_5) begin
      assign id_2 = id_4;
    end else begin
      assign id_2 = id_3 - 1;
      initial begin
        id_1 <= id_3;
        SystemTFIdentifier(1);
      end
      uwire id_6 = id_6[1];
      type_0 id_7 (
          .id_0(id_4),
          .id_1(id_4),
          .id_2(id_5)
      );
    end
  endgenerate
  always @(1 or posedge (id_5))
    if (1'b0)
      if (1) begin
        if (1)
          if (id_3) begin
            id_0 <= id_4;
          end
      end
endmodule

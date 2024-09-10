// Seed: 841455948
`timescale 1ps / 1ps
module module_0 #(
    parameter id_2 = 32'd40
) (
    id_1,
    _id_2
);
  output _id_2;
  input id_1;
  generate
    if (id_1) begin
      always @(id_1 or id_2 + 1) begin
        SystemTFIdentifier(id_1, "");
        id_2 = 1;
      end
      type_0 id_3 (
          1,
          1,
          id_1
      );
    end else begin
      initial begin
        id_1 <= 1'd0;
        if (id_2) begin
          id_2 <= 1;
          id_1 <= 1;
        end else begin
          if (id_2) id_1 <= 1 + id_1;
          else begin
            forever
            for (id_1 = 1; 1; id_2 = 1) begin
              id_2[id_2] <= 1;
            end
          end
        end
      end
      logic id_4;
    end
  endgenerate
  defparam id_5.id_6 = 1'b0;
endmodule

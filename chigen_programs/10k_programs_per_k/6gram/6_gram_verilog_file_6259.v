// Seed: 2178704367
module module_0 (
    input id_0,
    input reg id_1,
    output id_2,
    output logic id_3
);
  generate
    assign id_3 = 1'b0;
    for (id_4 = 1; id_4; id_3 = 1) begin
      always @(posedge 1) begin
        id_2 = "";
        if (id_4) begin
          id_4 <= id_1;
          id_4 <= id_4;
        end else begin
          {id_1, 1'b0} = id_4;
        end
      end
    end
  endgenerate
endmodule

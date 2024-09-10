// Seed: 2937261128
module module_0 #(
    parameter id_1 = 32'd34,
    parameter id_2 = 32'd64
) ();
  logic _id_2;
  always @(posedge id_2) begin
    id_1[id_1] <= id_1;
    id_1 <= 1;
    if (id_2) begin
      id_2 <= id_2[id_1[id_2] : id_1];
    end
    id_2 <= 1;
  end
endmodule

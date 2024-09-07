// Seed: 837498131
module module_0 #(
    parameter id_1 = 32'd46,
    parameter id_2 = 32'd29
) (
    _id_1,
    _id_2
);
  input _id_2;
  output _id_1;
  assign id_2[""==1 : id_2-1'b0] = 1;
  initial
    @(1) begin
      id_1 = id_2;
    end
  assign id_2 = id_2[id_1];
  always id_1 = id_1[1'h0];
  initial id_2 <= (id_1);
  assign id_2 = 1;
  assign id_1 = 1;
endmodule

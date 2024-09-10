// Seed: 471197272
module module_0 #(
    parameter id_1 = 32'd49
) (
    _id_1
);
  input _id_1;
  assign id_1 = 1;
  initial begin
    #1;
    SystemTFIdentifier(id_1);
    id_1 = 1;
    if (id_1) begin
      #(1) id_1 = id_1[1 : id_1];
    end
  end
endmodule

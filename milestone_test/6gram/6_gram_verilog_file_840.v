// Seed: 3833086598
module module_0 #(
    parameter id_1 = 32'd27,
    parameter id_2 = 32'd36
);
  logic _id_1 = 1;
  logic _id_2;
  initial begin
    SystemTFIdentifier(id_2);
    case (id_1[id_1[id_1]] - 1)
      id_1: id_2 = id_1;
      id_2[1]: id_2 = 1;
      id_1: id_2 = id_1;
      id_2: begin
        id_1 <= id_2[1>>(id_2) : id_1[id_2]-id_2];
      end
      1: id_2 = id_1;
      id_1: begin
        if (1 && 1) SystemTFIdentifier(id_1, id_2);
      end
    endcase
  end
endmodule

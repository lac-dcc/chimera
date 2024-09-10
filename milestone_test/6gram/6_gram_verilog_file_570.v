// Seed: 1373885789
module module_0 #(
    parameter id_1 = 32'd90
);
  always @(posedge id_1) begin
    id_1[1 : id_1] = 1;
    forever begin
      if ({id_1, id_1}) begin
        {'b0} <= id_1;
      end
    end
  end
  always @* begin
    id_1 <= 1;
    if (id_1 && id_1) begin
      id_1 <= 1;
    end
  end
  assign id_1 = id_1[id_1];
endmodule

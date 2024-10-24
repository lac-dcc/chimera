// Seed: 4165335825
module module_0 (
    input id_0,
    output id_1,
    reg id_2
);
  always @(id_0 or posedge id_2 == 1'b0) begin
    if (id_0) begin
      #1;
      id_1 <= id_0;
      id_1 <= 1;
      id_2 = {1, id_2};
    end else id_1 <= 1;
  end
  assign id_1 = id_2;
  logic id_3 = 1;
endmodule

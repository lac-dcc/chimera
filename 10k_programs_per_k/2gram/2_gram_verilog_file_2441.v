// Seed: 1379180966
module module_0 (
    id_1,
    id_2
);
  inout id_2;
  output id_1;
  always begin
    assign id_2 = 1;
    id_1 <= 1'd0;
    if (id_2)
      #1 begin
        id_2 <= id_2;
      end
    id_1 = id_2;
    id_1 <= #1 1;
  end
endmodule

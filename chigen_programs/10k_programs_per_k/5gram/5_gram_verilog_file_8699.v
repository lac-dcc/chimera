// Seed: 2459660491
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout id_4;
  inout id_3;
  input id_2;
  inout id_1;
  assign id_3 = id_4;
  always @(posedge 1) begin
    #1;
    if (1'h0) begin
      if ("") id_1 <= 1;
      else id_1 <= id_4;
    end
    id_4 <= id_3;
    id_4 <= id_1 ? 1 : id_3;
    if (id_2) id_3 = id_2;
  end
  generate
    always @(1) {id_2, id_3, id_3, 1} = 1;
  endgenerate
endmodule

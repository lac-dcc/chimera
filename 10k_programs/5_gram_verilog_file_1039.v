// Seed: 887953330
module module_0 (
    output id_0,
    input  id_1,
    input  id_2,
    output id_3
);
  initial begin
    if (1) begin
      id_0 <= 1;
      if (1) begin
        SystemTFIdentifier;
      end
      id_0 = id_1;
    end else begin
      id_0 <= id_2;
      id_3 <= #1 id_2;
      id_0 <= id_2;
      id_3 = id_1;
    end
  end
  type_4(
      1'b0, {id_1{id_3}}
  );
endmodule

// Seed: 412437163
module module_0;
  type_1(
      .id_0(id_0), .id_1(1), .id_2(id_0 ? 'b0 : 1)
  );
  always begin
    id_0 <= 1'b0;
    if ((id_0 !== 1)) begin
      #1 begin
        id_0 <= 1;
      end
    end
  end
endmodule

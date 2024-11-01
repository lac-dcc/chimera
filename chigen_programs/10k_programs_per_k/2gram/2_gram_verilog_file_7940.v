// Seed: 4290572301
module module_0 (
    input tri0 id_0,
    input supply0 id_1,
    input tri1 id_2
);
  wire id_4;
endmodule
module module_1 (
    input  tri1  id_0,
    output logic id_1,
    output logic id_2
);
  reg id_4;
  module_0(
      id_0, id_0, id_0
  );
  always
    if (id_4) id_2 <= id_0 - id_4 & 1;
    else begin
      id_1 <= 1 ? id_4 : {1, 1'h0, 1'b0, id_4};
      assert (1);
      $display(id_4, 1);
      id_2 = 1;
    end
endmodule

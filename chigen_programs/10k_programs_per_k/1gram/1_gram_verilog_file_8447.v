// Seed: 3025390323
module module_0;
  wire id_1, id_2;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_2;
  initial begin
    id_1 <= 1;
    begin
      id_1 = id_1;
      if (1) id_1 = #1{1, 1'b0, 1};
      else id_1 <= 1;
    end
    id_1 <= id_1;
    @(1);
  end
  module_0();
  tri0 id_3;
  assign id_1 = 1;
  assign id_3 = id_2 && 1'd0;
  assign id_3 = 1'b0 && id_2;
endmodule

// Seed: 4050564758
module module_0;
  wire id_2;
  wire id_3;
  assign id_1 = 1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  assign id_2[1] = 1'b0;
  wire id_4;
  module_0();
endmodule
module module_2 (
    output wire id_0,
    input uwire id_1,
    input tri1 id_2,
    input wire id_3,
    input wire id_4,
    output logic id_5,
    output supply1 id_6
    , id_8
);
  wire id_9;
  nand (id_0, id_1, id_10, id_2, id_3, id_4, id_8, id_9);
  reg id_10;
  module_0();
  initial begin
    id_8 <= 1;
    begin : id_11
      id_5 <= id_10;
      if (1'b0) begin
        assert (1);
      end else #1 if (1) id_8 <= id_11 < 1;
    end
  end
endmodule

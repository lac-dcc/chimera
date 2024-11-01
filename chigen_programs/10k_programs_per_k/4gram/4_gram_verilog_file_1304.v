// Seed: 3693090030
module module_0 ();
  id_2(
      .id_0(1), .id_1(1)
  );
  assign id_1 = id_1 + id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
  wire id_3;
  module_0();
endmodule
module module_2;
  wire id_2;
  wire id_3;
  module_0();
  wire id_4;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  final begin
    if (id_1) begin
      fork
        id_3 <= "";
        for (id_4 = 1; 1'b0; id_3 = id_2) begin
          if (1) id_4 <= 1'b0;
        end
      join
      if (id_2) begin
        id_3 <= 1;
      end else if (id_1) id_4 <= id_1;
      else begin
        if (id_2) assume (1);
      end
    end else id_4 <= id_1;
  end
  reg id_5;
  assign id_3 = id_5;
  module_0();
  wire id_6;
  initial begin
    assert (id_6)
    else;
  end
endmodule

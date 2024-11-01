// Seed: 1399990382
module module_0;
  id_1(
      .id_0(id_2), .id_1(id_2)
  );
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  always @* begin
    #1 begin
      id_2 <= 1;
      if (id_1) id_2 <= 1;
      else begin
        id_2 = id_2 + 1'b0;
      end
    end
    id_2 = (1 == 1);
  end
  module_0();
endmodule
module module_2 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3, id_4;
endmodule
module module_3 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2[1] = 1;
  module_2(
      id_3, id_3
  );
  assign id_3 = id_1;
  wire id_5;
  wire id_6;
endmodule

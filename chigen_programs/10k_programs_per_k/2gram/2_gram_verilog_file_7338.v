// Seed: 3820176924
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_2 = 1 ? 1 && (1'h0) : 1;
endmodule
macromodule module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  assign id_4 = 1'b0;
  wire id_8;
  id_9(
      .id_0(id_4), .id_1(1'd0), .id_2(id_1)
  );
  reg  id_10;
  wire id_11 = id_8;
  module_0(
      id_4, id_7, id_7, id_7
  );
  wire id_12;
  assign id_3 = id_10;
  assign id_8 = id_8;
  assign id_6 = id_9;
  always
    if (id_5 ^ 1)
      @* begin
        return id_12;
      end
    else id_10 <= id_10;
  wire id_13;
  wire id_14;
  nor (id_7, id_2, id_8, id_10, id_1, id_11, id_3, id_5);
endmodule

// Seed: 569026513
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  reg  id_4 = id_1#(.id_4(1));
  wire id_5;
  module_0(
      id_5, id_5, id_5, id_5
  );
  assign id_2 = 1;
  logic [7:0] id_6;
  wire id_7;
  logic [7:0] id_8 = id_6;
  assign id_2 = id_1;
  reg  id_9;
  wire id_10;
  assign id_6[1] = id_5;
  always begin
    @(id_6[1'b0] or 1);
    begin : id_11
      fork
        id_9 = 1;
      join_any
    end
    id_2 <= id_9;
  end
endmodule

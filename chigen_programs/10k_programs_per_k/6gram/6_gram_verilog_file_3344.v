// Seed: 1753867888
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  id_4(
      .id_0(1'b0), .id_1(1)
  );
  assign id_3 = id_2 - 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  inout wire id_1;
  always
  fork
    for (id_7 = id_5; (id_1); id_7 += id_3) begin
      id_1 <= #1 1;
    end
    begin
      id_7 <= 1 - 1;
    end
  join
  module_0(
      id_2, id_2, id_2
  );
endmodule

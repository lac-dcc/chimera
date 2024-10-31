// Seed: 1955429010
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  input wire id_1;
  wire id_3;
  initial #1 $display(1'h0, id_2);
  initial id_2 = id_1 - 1'b0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_3 = "";
  wire id_6;
  always
  fork : id_7
    id_8;
    begin
      if ({id_8, 1}) begin
        id_1#(
            .id_8(1'b0),
            .id_7(id_2 == 1)
        ) <= id_4;
      end
    end
  join : id_9
  module_0(
      id_5, id_9
  );
endmodule

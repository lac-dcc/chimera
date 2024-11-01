// Seed: 2050019030
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  inout wire id_2;
  input wire id_1;
  tri0 id_7;
  assign id_7 = 1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(negedge 1 or negedge id_7) begin
    if (id_1)
      @(*)
      #id_9 begin
        if (id_8) begin
          id_1 = 1'b0;
          id_2 <= 1;
        end else begin
          id_1 <= 1;
        end
      end
    else id_1 = id_4;
  end
  module_0(
      id_8, id_5, id_5, id_8, id_5, id_5
  );
endmodule

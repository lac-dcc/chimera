// Seed: 1698885065
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  input wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  output wire id_1;
  assign id_10 = id_10;
  wire id_11 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6, id_7, id_8;
  wire id_9;
  assign id_5[1] = 1;
  module_0(
      id_4, id_9, id_6, id_9, id_6, id_4, id_7, id_7, id_4, id_7
  );
  initial begin
    wait (id_2);
    casex (1'b0 & id_8 & "" & id_4)
      1'b0: id_8 = 1;
      1'h0: id_1 = id_7;
      id_2: id_3 = 1'h0;
      default: id_4 = 1;
    endcase
    id_2 = #id_10 1'b0;
    id_2 = id_3;
  end
endmodule

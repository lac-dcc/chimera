// Seed: 1238932163
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
    id_10,
    id_11,
    id_12
);
  inout wire id_12;
  inout wire id_11;
  inout wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_13;
  assign id_10 = id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1 or posedge id_3)
    if (id_1)
      if (id_3) begin
        begin
          id_1 <= id_1;
          id_4 <= 1;
          if (id_3) disable id_5;
          else begin
            id_4 <= id_5(1) ? id_1 : id_5 & id_2;
          end
        end
      end else begin
        $display(1);
        id_4 <= id_3;
      end
  wire id_6;
  wire id_7;
  integer id_8 (
      1'h0,
      1 & id_2 & (id_3),
      1'b0
  );
  module_0(
      id_6, id_7, id_7, id_6, id_7, id_2, id_7, id_6, id_7, id_7, id_6, id_6
  );
endmodule

// Seed: 480124090
module module_0 #(
    parameter id_8 = 32'd73,
    parameter id_9 = 32'd57
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  always @(posedge 1) begin
    #1 id_1 = #1 1;
    #1 begin
      id_1 <= 1'h0;
    end
    `define pp_6 0
    id_1 <= id_3;
    id_5 = id_2;
  end
  wire id_7;
  defparam id_8.id_9 = id_8;
  integer id_10;
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
  inout wire id_5;
  input wire id_4;
  output wire id_3;
  input wire id_2;
  input wire id_1;
  always @(posedge id_4 or posedge id_1) begin
    id_7[1] <= id_5;
  end
  module_0(
      id_5, id_6, id_5, id_1, id_3
  );
endmodule

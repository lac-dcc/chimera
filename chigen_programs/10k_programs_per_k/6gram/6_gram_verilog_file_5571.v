// Seed: 164282320
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
  output wire id_12;
  input wire id_11;
  output wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
  id_13(
      .id_0(id_8), .id_1(id_1), .id_2(id_10 - id_3), .id_3(id_10), .id_4(id_5), .id_5(1)
  );
endmodule
module module_1 (
    input  uwire id_0,
    output logic id_1,
    input  tri   id_2,
    input  wor   id_3,
    output logic id_4,
    input  wor   id_5,
    output logic id_6,
    input  tri0  id_7,
    output wor   id_8
);
  wire id_10;
  always
  fork : id_11
    assign id_1 = id_11 == 1;
    begin
      id_4 <= id_11;
      if (1) disable id_12;
      else begin
        begin
          id_12 <= 1 ==? 1 ? id_12 : 1;
          if (1'b0) begin
            $display(1'd0);
          end
        end
        id_6 <= 1;
      end
    end
    begin
      id_1 <= id_3 != id_3;
    end
  join
  module_0(
      id_10, id_10, id_10, id_10, id_10, id_10, id_10, id_10, id_10, id_10, id_10, id_10
  );
endmodule

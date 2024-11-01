// Seed: 1161299131
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  input wire id_8;
  input wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  always @(posedge 1 or negedge ~id_8 == 1)
    case (id_4)
      1: begin
        if ($display(id_8)) begin
          case (id_6)
            1'b0: id_9 = 1;
            1'b0: if (1) if (id_4) id_1 <= id_8;
 else id_9 <= 1 == id_2;
 else assign id_1 = 1'b0;
            default: begin
              id_1 <= 1;
            end
          endcase
        end
      end
      id_3: id_9 = id_7;
      id_2: id_9 <= (id_4 !== ~$display);
    endcase
endmodule
module module_1 (
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
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_11;
  module_0(
      id_1, id_7, id_7, id_9, id_7, id_6, id_10, id_10, id_10
  );
  always @(posedge 0 or negedge id_3) begin
    id_1 <= id_10;
  end
endmodule

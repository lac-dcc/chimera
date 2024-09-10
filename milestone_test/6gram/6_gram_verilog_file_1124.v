// Seed: 4184198414
module module_0 #(
    parameter id_1 = 32'd32,
    parameter id_2 = 32'd60
) (
    output _id_2
);
  always @(posedge id_2) begin
    id_1 = id_2[id_1];
    repeat (1) begin
      id_2 <= 1'b0;
      SystemTFIdentifier(id_1, id_2);
      id_2 <= 1;
      if (1) begin
        if (id_1) begin
          id_2 <= 1'h0;
          id_2[id_2] <= 1;
          id_1 <= 1;
          id_1 <= 1;
        end else begin
          id_1 <= 1;
        end
      end else begin
        if ((1 ? ~id_2 : id_1[1'b0 : 1])) begin
          id_2 <= 1;
        end else begin
          case (1)
            1: id_1 = id_2;
            1: begin
              #1 id_1[1'd0] = 1;
            end
            1: id_1[1 : 1'b0] = 1;
            default: ;
          endcase
        end
        id_1 <= id_2[id_1-1];
      end
    end
    id_2 <= id_1 == 1;
    #(1);
    case (id_2)
      1: id_1 <= 1;
      1:
      if (id_2)
        if (id_2 || 1) id_1 <= 1 - id_2;
        else if (id_1) begin
          if (id_2)
            case ("")
              default: id_2 = id_2;
              default: ;
            endcase
        end else id_2 <= #1 id_2;
      else id_1 <= 1;
      id_1[1 : 1]: id_2[id_1 : 1] = 1;
    endcase
  end
endmodule
